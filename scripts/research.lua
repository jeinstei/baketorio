local g = require("globals")

local lib = {}

---@type fun(research:LuaTechnology):nil
lib.onNutrientResearchFinished = function (research)
    local force = research.force

    -- Add to active nutrient tech list
    storage.activeNutrientTechsByForce[force.name][research.name] = true

    local rEffects = research.prototype.effects
    for _, effect in ipairs(rEffects)
    do
        -- Check all recipe unlocks and build set of ingredients
        if effect.type == "unlock-recipe" then
            -- handle recipe; store ingredient states if good
            -- BReak out
            local recipe = force.recipes[effect.recipe]
            local ingredients = recipe.ingredients
            local numGood = 0
            for _, ing in ipairs(ingredients)
            do
                local otherIngredients = {}
                for _, oing in ipairs(ingredients) do
                    if ing.name ~= oing.name then
                        otherIngredients[oing.name] = true
                    end
                end

                if force.is_visible({ type = "item", name = ing.name }) then
                    numGood = numGood + 1
                else
                    break
                end
            end
            if numGood == #ingredients then
                g.enableNutrientRecipe(recipe)
            else
                g.disableNutrientRecipeDueToMissingIngredients(recipe)
            end
        end
    end
end

---@type fun(technology:LuaTechnology):nil
lib.onNonNutrientResearchFinished = function (technology)
    local force = technology.force
    local missing = storage.missingNutrientIngredientRecipesByForce[force.name]

    -- Loop through missing recipes, test for visibility, and enable as needed
    for nutrRecipe, _ in pairs(missing)
    do
        local recipe = force.recipes[nutrRecipe]
        local ingredients = recipe.ingredients
        local numGood = 0
        for _, ing in ipairs(ingredients)
        do
            if force.is_visible({ type = "item", name = ing.name }) then
                numGood = numGood + 1
            else
                break
            end
        end
        if numGood == #ingredients then
            g.enableNutrientRecipe(recipe)
        end
    end
end

---@type fun(research:LuaTechnology):nil
lib.onNutrientResearchReversed = function (research)
    local force = research.force
    local effects = research.prototype.effects

    -- Remove nutrient research from active nutrient tech list
    storage.activeNutrientTechsByForce[force.name][research.name] = nil

    -- Loop over technology effects
    for _, effect in ipairs(effects)
    do
        -- For each unlocked recipe in the nutrient technology
        if effect.type == "unlock-recipe" then
            local recipe = force.recipes[effect.recipe]

            -- Disable recipe
            -- TODO check if this actually disables or if I need it here (enabled by script)
            -- recipe.enabled = false

            -- Remove recipe from missing list
            storage.missingNutrientIngredientRecipesByForce[force.name][recipe.name] = nil

            -- Check if ingredients are in active ingredient list and remove recipe and ingredients as needed
            for _, ing in ipairs(recipe.ingredients) do
                if storage.activeNutrientIngredientsByForce[force.name][ing.name] ~= nil then
                    storage.activeNutrientIngredientsByForce[force.name][ing.name][recipe.name] = nil
                    -- If no recipes are left for the ingredient, then nil it out
                    if next(storage.activeNutrientIngredientsByForce[force.name][ing.name]) == nil then
                        storage.activeNutrientIngredientsByForce[force.name][ing.name] = nil
                    end
                end
            end
        end
    end
end

---@type fun(research:LuaTechnology):nil
lib.onNonNutrientResearchReversed = function (research)
    local force = research.force

    -- Build set of all products that are disappearing
    ---@type Product[]
    local disappearingProducts = {}
    local rEffects = research.prototype.effects
    for _, effect in ipairs(rEffects)
    do
        -- Check all recipe unlocks and build set of products
        if effect.type == "unlock-recipe" then
            -- handle recipe; store ingredient states if good
            -- Break out
            local recipe = force.recipes[effect.recipe]
            for _, prod in ipairs(recipe.products)
            do
                table.insert(disappearingProducts, prod)
            end
        end
    end

    for _, prod in ipairs(disappearingProducts)
    do
        g.testProductAndUpdateNutrientTables(force, prod)
    end
end

return lib

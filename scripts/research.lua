local g = require("globals")

local lib = {}

---@type fun(research:LuaTechnology):nil
lib.onNutrientResearchFinished = function (research)
    local force = research.force

    local rEffects = research.prototype.effects
    for _, effect in ipairs(rEffects)
    do
        -- Check all recipe unlocks and build set of ingredients
        if effect.type == "unlock-recipe" then
            -- handle recipe; store ingredient states if good
            -- BReak out
            local recipe = force.recipes[effect.recipe]
            local rIngredients = recipe.ingredients
            local rIngSize = table_size(rIngredients)
            local numGood = 0
            for _, ing in ipairs(rIngredients)
            do
                if force.is_visible({ type = "item", name = ing.name }) then
                    numGood = numGood + 1
                else
                    break
                end
            end
            if numGood == rIngSize then
                g.enableNutrientRecipe(recipe)
            else
                g.disableNutrientRecipeDueToMissingIngredients(recipe)
            end
        end
    end
end

---@type fun(research:LuaTechnology):nil
lib.onNonNutrientResearchFinished = function (research)
    local force = research.force
    local missing = storage.recipesMissingIngredientNutrientsByForce[force.name]

    -- If not a nutrient recipe, check if any deactivated nutrinent recipes are now valid
    for nutrRecipe, _ in pairs(missing)
    do
        local recipe = force.recipes[nutrRecipe]
        local rIngredients = recipe.ingredients
        local rIngSize = table_size(rIngredients)
        local numGood = 0
        for _, ing in ipairs(rIngredients)
        do
            if force.is_visible({ type = "item", name = ing.name }) then
                numGood = numGood + 1
            else
                break
            end
        end
        if numGood == rIngSize then
            g.enableNutrientRecipe(recipe)
        end
    end
end

---@type fun(research:LuaTechnology):nil
lib.onNutrientResearchReversed = function (research)
    local force = research.force
    local effects = research.prototype.effects
    local missing = storage.recipesMissingIngredientNutrientsByForce[force.name]

    for _, effect in ipairs(effects)
    do
        if effect.type == "unlock-recipe" then
            missing[effect.recipe] = nil
        end
    end
    g.rebuildActiveNutrientIngredients(force)
end

---@type fun(research:LuaTechnology):nil
lib.onNonNutrientResearchReversed = function (research)
    local force = research.force

    -- Build set of all products that are disappearing
    local disappearingProducts = {}
    local rEffects = research.prototype.effects
    for _, effect in ipairs(rEffects)
    do
        -- Check all recipe unlocks and build set of ingredients
        if effect.type == "unlock-recipe" then
            -- handle recipe; store ingredient states if good
            -- Break out
            local recipe = force.recipes[effect.recipe]
            for _, prod in ipairs(recipe.products)
            do
                disappearingProducts[prod.name] = true
            end
            g.removeProductFromNutrientIngredients(force, recipe.products)
        end
    end

    log("disappearingProducts")
    log(serpent.dump(disappearingProducts))
    log(serpent.dump(storage.activeNutrientIngredientsByForce[force.name]))

    -- Loop through active force recipes
    -- If visible and is a nutrient recipe
    -- If any of the products going away are an ingredient
    -- then add to missing list and disable recipe
    for k, v in pairs(force.recipes)
    do
        if force.is_visible({ type = "recipe", name = k }) then
            if k:find("recipe-nutrient", 1, true) == 1 then
                for _, ing in ipairs(v.ingredients)
                do
                    if disappearingProducts[ing.name] == true then
                        g.disableNutrientRecipeDueToMissingIngredients(v)
                        break
                    end
                end
            end
        end
    end

end

return lib

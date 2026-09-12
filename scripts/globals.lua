local lib = {}

-- gui_data: {LuaGuiElement|LuaPlayer: {str, any}}
-- activeNutrientTechsByForce: {LuaForce.name: {tech_name: bool}}
-- activeNutrientIngredientsByForce: {LuaForce.name: {ingredient.name:{recipesUsingIngredient:{other_ingredients: bool}}}}
-- missingNutrientIngredientRecipesByForce: {LuaForce.name: {recipe.name: bool}}}}

lib.storageData = {
    "gui_data",
    "activeNutrientTechsByForce",
    "activeNutrientIngredientsByForce",
    "missingNutrientIngredientRecipesByForce",
}

-- Builds storage data structures
---@type fun(doRebuild:boolean)
lib.buildStorageData = function (doRebuild)
    if doRebuild then
        for _, v in ipairs(lib.storageData) do
            storage[v] = {}
        end
    else
        for _, v in ipairs(lib.storageData) do
            if (not storage[v]) then storage[v] = {} end
        end
    end
end

-- Builds storage data structures
---@type fun(force:LuaForce, doRebuild:boolean)
lib.buildStorageDataForForce = function (force, doRebuild)
    -- Explicitly not calling buildStorageData as it should have an error otherwise
    if doRebuild then
        for _, v in ipairs(lib.storageData) do
            storage[v][force.name] = {}
        end
    else
        for _, v in ipairs(lib.storageData) do
            if (not storage[v][force.name]) then storage[v][force.name] = {} end
        end
    end
end

---@type fun(recipe:LuaRecipe):nil
lib.enableNutrientRecipe = function (recipe)
    local force = recipe.force

    -- Set recipe enabled
    recipe.enabled = true

    -- Remove from missing list, if it is there
    if storage.missingNutrientIngredientRecipesByForce[recipe.force.name][recipe.name] ~= nil then
        storage.missingNutrientIngredientRecipesByForce[recipe.force.name][recipe.name] = nil
    end

    -- Build other ingredient list and add ingredients to global table
    for _, ing in ipairs(recipe.ingredients) do
        ---@type string[]
        local otherIngredients = {}
        for _, oing in ipairs(recipe.ingredients) do
            if ing ~= oing then
                table.insert(otherIngredients, oing.name)
            end
        end
        if storage.activeNutrientIngredientsByForce[force.name][ing.name] == nil then storage.activeNutrientIngredientsByForce[force.name][ing.name] = {} end
        storage.activeNutrientIngredientsByForce[force.name][ing.name][recipe.name] = otherIngredients
    end
end

---@type fun(recipe:LuaRecipe):nil
lib.disableNutrientRecipeDueToMissingIngredients = function (recipe)
    local force = recipe.force
    recipe.enabled = false
    storage.missingNutrientIngredientRecipesByForce[force.name][recipe.name] = true
end

---@type fun(force:LuaForce)
lib.testMissingRecipesForVisibilityAndEnable = function (force)
    local missing = storage.missingNutrientIngredientRecipesByForce[force.name]
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
            lib.enableNutrientRecipe(recipe)
        end
    end
end

---@type fun()
lib.rebuildStorage = function ()
    lib.buildStorageData(true)
    for _, force in pairs(game.forces)
    do
        if force ~= nil then
            lib.buildStorageDataForForce(force, true)
            lib.rebuildNutrientGlobalData(force)
        end
    end
end

---@type fun(force:LuaForce):nil
lib.rebuildNutrientGlobalData = function (force)
    -- Find all enabled nutrient technologies
    local enabledNutrientTechs = {}
    storage.activeNutrientTechsByForce[force.name] = {}

    for tName, tech in pairs(force.technologies)
    do
        if tName:find("nutrient") == 1 then
            if tech.researched then
                enabledNutrientTechs[tName] = tech
            end
        end
    end

    -- Add active nutrient techs here
    -- Loop through enabled nutrients and setup which nutrient recipes are active
    for k, tech in pairs(enabledNutrientTechs)
    do
        storage.activeNutrientTechsByForce[force.name][k] = true

        local rEffects = tech.prototype.effects
        for _, effect in ipairs(rEffects)
        do
            -- Check all recipe unlocks and build set of ingredients
            if effect.type == "unlock-recipe" then
                -- handle recipe; store ingredient states if good
                -- BReak out
                local rRecipe = force.recipes[effect.recipe]
                local rIngredients = rRecipe.ingredients
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
                    lib.enableNutrientRecipe(rRecipe)
                else
                    lib.disableNutrientRecipeDueToMissingIngredients(rRecipe)
                end
            end
        end
    end
end

---@type fun(LuaForce, Product)
lib.testProductAndUpdateNutrientTables = function (force, prod)
    -- If the product is in the active ingredients table
    if storage.activeNutrientIngredientsByForce[force.name][prod.name] ~= nil then
        -- Check if the item can still be produced anywhere. If not, remove from tables
        if (not force.is_visible({ type = "item", name = prod.name })) then
            -- Loop through all recipes and others in the ingredient in the table
            for recipe, others in pairs(storage.activeNutrientIngredientsByForce[force.name][prod.name])
            do
                -- And for each other item, nil out the recipe
                for _, other in ipairs(others)
                do
                    storage.activeNutrientIngredientsByForce[force.name][other][recipe] = nil
                    -- and remove the other item if it is also without any recipes
                    if next(storage.activeNutrientIngredientsByForce[force.name][other]) == nil then
                        storage.activeNutrientIngredientsByForce[force.name][other] = nil
                    end
                end

                -- Set recipe as missing and disable
                force.recipes[recipe].enabled = false
                storage.missingNutrientIngredientRecipesByForce[force.name][recipe] = true
            end
            storage.activeNutrientIngredientsByForce[force.name][prod.name] = nil
        end
    end
end

return lib

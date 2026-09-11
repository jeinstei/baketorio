local lib = {}

lib.storageData = {
    "recipesMissingIngredientNutrientsByForce",
    "activeNutrientIngredientsByForce",
    "gui_data",
    "activeNutrientTechs",
    "activeNutrientRecipesByForce",
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

---@type fun(force:LuaForce, ingredients:Ingredient[])
lib.addIngredientToNutrientIngredients = function (force, ingredients)
    local uniqueIngredients = {}
    for _, v in ipairs(ingredients) do
        uniqueIngredients[v.name] = true
    end

    for k, _ in pairs(uniqueIngredients) do
        if (not storage.activeNutrientIngredientsByForce[force.name][k]) then
            log(k .. " not found: adding to storage")
            storage.activeNutrientIngredientsByForce[force.name][k] = 1
        else
            log(k .. " found: adding 1 to value")
            storage.activeNutrientIngredientsByForce[force.name][k] = storage.activeNutrientIngredientsByForce[force.name][k] +
                1
        end
        log(serpent.dump(storage.activeNutrientIngredientsByForce[force.name][k]))
    end
end

---@type fun(force:LuaForce, products:Product[])
lib.removeProductFromNutrientIngredients = function (force, products)
    local uniqueProducts = {}
    for _, v in ipairs(products) do
        uniqueProducts[v.name] = true
    end

    for k, _ in pairs(uniqueProducts) do
        log("Attempting removal from list " .. k)
        if storage.activeNutrientIngredientsByForce[force.name][k] ~= nil then
            log("Removing from list " .. k)
            log(serpent.dump(storage.activeNutrientIngredientsByForce[force.name][k]))
            storage.activeNutrientIngredientsByForce[force.name][k] = storage.activeNutrientIngredientsByForce[force.name][k] -
                1
            log(serpent.dump(storage.activeNutrientIngredientsByForce[force.name][k]))
            if storage.activeNutrientIngredientsByForce[force.name][k] <= 0 then
                log("ingredient removed; setting to nil")
                storage.activeNutrientIngredientsByForce[force.name][k] = nil
            end
        end
    end
end

---@type fun(force:LuaForce)
lib.rebuildActiveNutrientIngredients = function (force)
    storage.activeNutrientIngredientsByForce[force.name] = {}

    -- Find all enabled nutrient technologies
    local enabledNutrientTechs = {}
    for tName, tech in pairs(force.technologies)
    do
        if tName:find("nutrient") == 1 then
            if tech.researched then
                enabledNutrientTechs[tName] = tech
            end
        end
    end

    log("rebuilding for " .. force.name)
    log(serpent.dump(enabledNutrientTechs))
    log(serpent.dump(storage.activeNutrientIngredientsByForce[force.name]))
    -- Add active nutrient techs here
    -- Loop through enabled nutrients and setup which nutrient recipes are active
    for k, tech in pairs(enabledNutrientTechs)
    do
        storage.activeNutrientTechs[force.name][k] = true

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
                    -- This is done on a per-recipe basis on purpose to do proper tracking
                    -- of how many recipes can make that ingredient
                    lib.addIngredientToNutrientIngredients(force, rIngredients)
                end
            end
        end
    end
    log(serpent.dump(storage.activeNutrientIngredientsByForce[force.name]))
end

---@type fun()
lib.rebuildStorage = function ()
    lib.buildStorageData(true)
    for _, force in pairs(game.forces)
    do
        if force ~= nil then
            lib.buildStorageDataForForce(force, true)
            lib.rebuildActiveNutrientIngredients(force)
        end
    end
end

return lib

-- Create global storage to speed up processing
if (not storage.missingIngredientNutrients) then storage.missingIngredientNutrients = {} end

for _, rForce in pairs(game.forces)
do
    if (not storage.missingIngredientNutrients[rForce.name]) then storage.missingIngredientNutrients[rForce.name] = {} end

    -- Local reference to global storage
    local fMissing = storage.missingIngredientNutrients[rForce.name]

    -- Find all enabled nutrient technologies
    local enabledNutrients = {}
    for tName, tech in pairs(rForce.technologies)
    do
        if tName:find("nutrient") == 1 then
            if tech.researched then
                enabledNutrients[tName] = tech
            end
        end
    end

    -- Loop through enabled nutrients and setup which nutrient recipes are active
    for _, tech in pairs(enabledNutrients)
    do
        local rEffects = tech.prototype.effects
        for _, effect in ipairs(rEffects)
        do
            -- Check all recipe unlocks and build set of ingredients
            if effect.type == "unlock-recipe" then
                -- handle recipe; store ingredient states if good
                -- BReak out 
                local rRecipe = rForce.recipes[effect.recipe]
                local rIngredients = rRecipe.ingredients
                local rIngSize = table_size(rIngredients)
                local numGood = 0
                for _, ing in ipairs(rIngredients)
                do
                    if rForce.is_visible({ type = "item", name = ing.name }) then
                        numGood = numGood + 1
                    else
                        break
                    end
                end
                if numGood == rIngSize then
                    rRecipe.enabled = true
                    fMissing[rRecipe.name] = nil
                else
                    rRecipe.enabled = false
                    fMissing[rRecipe.name] = true
                end
            end
        end
    end
end

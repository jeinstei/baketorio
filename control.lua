local string_starts_with = function (s, start)
    return s:find(start, 1, true) == 1
end

local set_gui_data = function (elem, prop, value)
    if (not storage.gui_data) then storage.gui_data = {} end
    if (not storage.gui_data[elem.index]) then storage.gui_data[elem.index] = {} end
    storage.gui_data[elem.index][prop] = value
end

local get_gui_data = function (elem, prop)
    if (not storage.gui_data) then return false end
    if (not storage.gui_data[elem.index]) then return false end
    return storage.gui_data[elem.index][prop];
end


-- Hook on_research_finished to check for unlocks
script.on_event(defines.events.on_research_finished, function (event)
    -- Get force and get reference to all recipes force has enabled
    -- If a nutrient tech, loop through all recipes and unhide all recipes where the ingredients
    --   are enabled and unhidden
    -- Otherwise loop through effects of the prototype of the tech
    -- Determine list of all ingredients for all unlocked recipes
    -- and unhide all nutrient recipes that are enabled that use those ingredients

    local rForce = event.research.force

    -- Create global storage to speed up processing
    if (not storage.missingIngredientNutrients) then storage.missingIngredientNutrients = {} end
    if (not storage.missingIngredientNutrients[rForce.name]) then storage.missingIngredientNutrients[rForce.name] = {} end

    -- Local reference to global storage
    local fMissing = storage.missingIngredientNutrients[rForce.name]

    if string_starts_with(event.research.name, "nutrient") then
        local rEffects = event.research.prototype.effects
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
                    print("Enabling recipe " .. rRecipe.name)
                    rRecipe.enabled = true
                    fMissing[rRecipe.name] = nil
                else
                    print("Disabling recipe " .. rRecipe.name)
                    rRecipe.enabled = false
                    fMissing[rRecipe.name] = true
                end
            end
        end
    else
        -- If not a nutrient recipe, check if any deactivated nutrinent recipes are now valid
        for nutrRecipe, _ in pairs(fMissing)
        do
            local rRecipe = rForce.recipes[nutrRecipe]
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
                fMissing[nutrRecipe] = nil
            end
        end
    end
end)

script.on_event(defines.events.on_gui_opened, function (event)
    local player = game.players[event.player_index]
    if (event.entity ~= nil and string.sub(event.entity.name, 1, 18) == "assembling-machine") then
        if (player == nil or player.gui.top.recipe_chooser ~= nil) then
            return
        end
        player.gui.top.add { type = "frame", name = "recipe_chooser", caption = { "ui-elements.nutrigen" } }
        local filter = {
            {filter = "subgroup", subgroup = "basic" },
            {filter = "subgroup", subgroup = "bread" },
            {filter = "subgroup", subgroup = "milk" },
            {filter = "subgroup", subgroup = "chocolate" },
            {filter = "subgroup", subgroup = "fruit" },
            {filter = "subgroup", subgroup = "advanced" },
        }
        local item1 = player.gui.top.recipe_chooser.add { type = "choose-elem-button", name = "item1", elem_type = "item", caption = { "ui-elements.nutrigen-i1" }, elem_filters = filter }
        local item2 = player.gui.top.recipe_chooser.add { type = "choose-elem-button", name = "item2", elem_type = "item", caption = { "ui-elements.nutrigen-i2" }, elem_filters = filter }
        set_gui_data(item1, "nchooser", true)
        set_gui_data(item1, "other", item2)
        set_gui_data(item1, "entity", event.entity)
        set_gui_data(item2, "nchooser", true)
        set_gui_data(item2, "other", item1)
        set_gui_data(item2, "entity", event.entity)
    end
end)

script.on_event(defines.events.on_gui_closed, function (event)
    local player = game.players[event.player_index]
    if (player == nil or player.gui.top.recipe_chooser == nil) then
        return;
    end
    player.gui.top.recipe_chooser.destroy()
end)

script.on_event(defines.events.on_gui_elem_changed, function (event)
    if (event.element ~= nil and get_gui_data(event.element, "nchooser")) then
        local i1 = nil;
        local i2 = nil;
        local filter = {
            {
                filter = "has-product-item",
                elem_filters = {
                    {
                        filter = "subgroup",
                        subgroup = "nutrients"
                    }
                }
            }
        }
        if (event.element.elem_value ~= nil) then
            i1 = event.element.elem_value
            filter[#filter + 1] = {
                filter = "has-ingredient-item",
                mode = "and",
                elem_filters = {
                    { filter = "name", name = i1 }
                }
            }
        end
        if (get_gui_data(event.element, "other").elem_value ~= nil) then
            i2 = get_gui_data(event.element, "other").elem_value
            filter[#filter + 1] = {
                filter = "has-ingredient-item",
                mode = "and",
                elem_filters = {
                    { filter = "name", name = i2 }
                }
            }
        end

        local list = prototypes.get_recipe_filtered(filter)
        if (list == nil and i1 ~= nil and i2 ~= nil) then
            log("No nutrient recipe selected for: " .. i1 .. " and " .. i2)
        end
        for _, value in pairs(list) do
            get_gui_data(event.element, "entity").set_recipe(value.name);
            break;
        end

    end
end)

-- -- Enable nutrient1 tech by default
-- script.on_init(function()
--     for _,tech in pairs(game.forces['player'].technologies) do
--         if (tech.enabled and tech.name == "nutrient1") then
--             tech.researched = true
--             break
--         end
--     end
-- end)

-- https://lua-api.factorio.com/latest/prototypes/UseItemAchievementPrototype.html

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

-- ---@type fun(s:string, start:string):boolean
-- local string_starts_with = function (s, start)
--     return s:find(start, 1, true) == 1
-- end

local g = require("scripts.globals")
require("scripts.interfaces")
local gui = require("scripts.gui")
local r = require("scripts.research")

script.on_init(function ()
    g.rebuildStorage()
end
)

script.on_configuration_changed(function (confData)
    g.rebuildStorage()
end
)

-- Hook on_research_finished to check for unlocks
script.on_event(defines.events.on_research_finished, function (event)
    -- Get force and get reference to all recipes force has enabled
    -- If a nutrient tech, loop through all recipes and unhide all recipes where the ingredients
    --   are enabled and unhidden
    -- Otherwise loop through effects of the prototype of the tech
    -- Determine list of all ingredients for all unlocked recipes
    -- and unhide all nutrient recipes that are enabled that use those ingredients

    local force = event.research.force
    g.buildStorageDataForForce(force, false)

    if event.research.name:find("nutrient", 1, true) == 1 then
        r.onNutrientResearchFinished(event.research)
    else
        r.onNonNutrientResearchFinished(event.research)
    end

    gui.updateAllItemChooserForForce(force)
end)

-- Hook on_research_finished to check for unlocks
script.on_event(defines.events.on_research_reversed, function (event)
    -- Get force and get reference to all recipes force has enabled
    -- Recipes will auto-disable, so this doesn't call disableNutrientRecipeDueToMissingIngredients
    -- If a nutrient tech, loop through all recipes and unhide all recipes where the ingredients
    --   are enabled and unhidden
    -- Otherwise loop through effects of the prototype of the tech
    -- Determine list of all ingredients for all unlocked recipes
    -- and unhide all nutrient recipes that are enabled that use those ingredients

    local force = event.research.force
    g.buildStorageDataForForce(force, false)

    -- If a nutrient recipe, clear all nutrient recipes from missing list
    if event.research.name:find("nutrient", 1, true) == 1 then
        r.onNutrientResearchReversed(event.research)
    else
        r.onNonNutrientResearchFinished(event.research)
    end

    gui.updateAllItemChooserForForce(force)
end)

script.on_event(defines.events.on_gui_opened, function (event)
    local player = game.players[event.player_index]
    if (event.entity ~= nil and string.sub(event.entity.name, 1, 18) == "assembling-machine") then
        gui.onAssemblingMachineGuiOpened(player, event.entity)
    end
end)

script.on_event(defines.events.on_gui_closed, function (event)
    local player = game.players[event.player_index]
    gui.onRecipeChooserClosed(player)
end)

script.on_event(defines.events.on_gui_click, function (event)
    if (event.element ~= nil and gui.get_gui_data(event.element, "nchooser")) then
        gui.onChooserClick(event)
    elseif (event.element ~= nil and event.element.name:find("ngen", 1, true) == 1) then
        gui.onNgenItemSelectClick(event)
    end
end)

-- /c game.player.force.technologies.nutrient1.researched = true
-- /c game.player.insert({name="assembling-machine-1"})

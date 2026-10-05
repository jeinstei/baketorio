-- Assembling Machine Updates for two fluid inputs if needed
-- data:extend {
--     {
--         type = "recipe-category",
--         name = "crafting-with-two-fluids"
--     },
-- }
-- table.insert(data.raw["assembling-machine"]["assembling-machine-2"].crafting_categories, "crafting-with-two-fluids")
-- table.insert(data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories, "crafting-with-two-fluids")
--
-- local pipe_connections = {
--     { flow_direction = "input", direction = defines.direction.north, position = { -1, 1 } },
-- }
-- data.raw["assembling-machine"]["assembling-machine-2"].fluid_boxes[1].pipe_connections = pipe_connections
-- data.raw["assembling-machine"]["assembling-machine-3"].fluid_boxes[1].pipe_connections = pipe_connections
--
-- local newFluidBox = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-2"].fluid_boxes[1])
-- newFluidBox.pipe_connections = {
--     { flow_direction = "input", direction = defines.direction.north, position = { 1, 1 } },
-- }
-- table.insert(data.raw["assembling-machine"]["assembling-machine-2"].fluid_boxes, newFluidBox)
-- table.insert(data.raw["assembling-machine"]["assembling-machine-3"].fluid_boxes, newFluidBox)

local fb = {}

fb.batters = {
    {
        type = "fluid",
        name = "basic-batter",
        icon = baketorio.get_png("cakebatter"),
        icon_size = 32,
        subgroup = "basic",
        stack_size = 100,
        base_color = { r = 0.76, g = 0.73, b = 0.58, a = 1 },
        flow_color = { r = 0.76, g = 0.73, b = 0.58, a = 1 },
        ingredients = {
            { type = "item",  name = "flour",  amount = 3 },
            { type = "fluid", name = "milk",   amount = 5 },
            { type = "item",  name = "butter", amount = 1 },
            { type = "item",  name = "egg",    amount = 1 },
            { type = "item",  name = "sugar",  amount = 1 }
        }
    },
    {
        type = "fluid",
        name = "chocolate-batter",
        icon = baketorio.get_png("chocolate-batter"),
        icon_size = 32,
        subgroup = "chocolate",
        stack_size = 100,
        base_color = { r = 0.6, g = 0.42, b = 0.26, a = 1 },
        flow_color = { r = 0.6, g = 0.42, b = 0.26, a = 1 },
        ingredients = {
            { type = "fluid", name = "basic-batter", amount = 1 },
            { type = "item",  name = "cocoa-powder", amount = 2 },
        }
    },
    {
        type = "fluid",
        name = "cheese-batter",
        icon = baketorio.get_png("cheese-batter"),
        icon_size = 32,
        subgroup = "milk",
        stack_size = 100,
        base_color = { r = 0.76, g = 0.73, b = 0.58, a = 1 },
        flow_color = { r = 0.76, g = 0.73, b = 0.58, a = 1 },
        ingredients = {
            { type = "fluid", name = "basic-batter", amount = 1 },
            { type = "item",  name = "cheese",       amount = 3 },
        }
    },
    {
        type = "fluid",
        name = "blueberry-batter",
        icon = baketorio.get_png("blueberry-batter"),
        icon_size = 32,
        subgroup = "fruit",
        stack_size = 100,
        base_color = { r = 0.17, g = 0.46, b = 0.93, a = 1 },
        flow_color = { r = 0.17, g = 0.46, b = 0.93, a = 1 },
        ingredients = {
            { type = "fluid", name = "basic-batter", amount = 1 },
            { type = "item",  name = "blueberries",  amount = 1 },
        }
    },
    {
        type = "fluid",
        name = "advanced-cake-batter",
        icon = baketorio.get_png("advanced-cake-batter"),
        icon_size = 32,
        subgroup = "advanced",
        stack_size = 100,
        base_color = { r = 0.91, g = 0.91, b = 0.20, a = 1 },
        flow_color = { r = 0.91, g = 0.91, b = 0.20, a = 1 },
        ingredients = {
            { type = "fluid", name = "basic-batter", amount = 1 },
            { type = "item",  name = "baking-soda",  amount = 1 },
            { type = "item",  name = "salt",         amount = 2 },
            { type = "item",  name = "strawberries", amount = 1 },
        }
    }
}

fb.add_fluid_items = function ()
    for _, value in pairs(fb.batters) do
        -- Adding manually to get proper subgroups and still have a local batter table for reference
        data:extend({
            {
                type = value.type,
                name = value.name,
                localised_name = { "item-name." .. value.name },
                icon = value.icon,
                icon_size = value.icon_size,
                subgroup = "ingredient",
                default_temperature = 20,
                max_temperature = 45,
                stack_size = value.stack_size,
                base_color = value.base_color,
                flow_color = value.flow_color,
                ingredients = value.ingredients
            },
        })
    end
end

return fb

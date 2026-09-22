-- Modifications for previously created recipes
data.raw.recipe["brownie"].categories = { "crafting-with-fluid" }
data.raw.recipe["chocolate-chip-batter"].categories = { "crafting-with-fluid" }
data.raw.recipe["blueberry-pie"].categories = { "crafting-with-fluid" }
data.raw.recipe["strawberry-pie"].categories = { "crafting-with-fluid" }

data.raw.recipe["brownie"].ingredients = {
    { type = "fluid", name = "chocolate-batter", amount = 1 }
}
data.raw.recipe["chocolate-chip-batter"].ingredients[1] = { type = "fluid", name = "basic-batter", amount = 1 }
data.raw.recipe["blueberry-pie"].ingredients[1] = { type = "fluid", name = "fryer-dough", amount = 1 }
data.raw.recipe["strawberry-pie"].ingredients[1] = { type = "fluid", name = "fryer-dough", amount = 1 }

local batter = {
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
        name = "fryer-dough",
        icon = baketorio.get_png("fryer-dough"),
        icon_size = 32,
        subgroup = "bread",
        stack_size = 100,
        base_color = { r = 0.76, g = 0.73, b = 0.58, a = 1 },
        flow_color = { r = 0.76, g = 0.73, b = 0.58, a = 1 },
        ingredients = {
            { type = "item",  name = "flour",  amount = 3 },
            { type = "fluid", name = "milk",   amount = 5 },
            { type = "item",  name = "butter", amount = 1 },
            { type = "item",  name = "salt",   amount = 1 }
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

-- Add batter recipes
for key, value in pairs(batter) do
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
        {
            type = "recipe",
            name = value.name,
            localised_name = { "item-name." .. value.name },
            categories = { "crafting-with-fluid" },
            subgroup = "ingredient",
            energy_required = 1,
            enabled = false,
            ingredients = value.ingredients,
            results = {
                { type = "fluid", name = value.name, amount = 1 },
            },
            icon = value.icon,
            icon_size = 32
        },
    }
    )
end

-- Add batter shapes (muffins, cakes, etc)
local shapes = {
    {
        name = "cake",
        batter = "basic-batter",
        tastiness = 5,
        frosted_mod = 1,
        batter_amount = 1,
        result = 1,
    },
    {
        name = "cupcake",
        batter = "basic-batter",
        tastiness = 5,
        frosted_mod = 1,
        batter_amount = 1,
        result = 1,
    },
    {
        name = "doughnut",
        batter = "fryer-dough",
        tastiness = 4,
        frosted_mod = 1,
        batter_amount = 1,
        result = 1,
    },
    {
        name = "doughnut",
        batter = "chocolate-batter",
        tastiness = 6,
        frosted_mod = 1,
        batter_amount = 2,
        result = 1,
    },
    {
        name = "cake",
        batter = "chocolate-batter",
        tastiness = 7,
        frosted_mod = 1,
        batter_amount = 1,
        result = 1,
    },
    {
        name = "cupcake",
        batter = "chocolate-batter",
        tastiness = 7,
        frosted_mod = 1,
        batter_amount = 1,
        result = 1,
    },
    {
        name = "cake",
        batter = "cheese-batter",
        tastiness = 6,
        batter_amount = 1,
        result = 1,
    },
    {
        name = "bun",
        batter = "fryer-dough",
        tastiness = 8,
        frosted_mod = 2,
        topping = "cinnamon-sugar",
        batter_amount = 1,
        result = 1,
    },
    {
        name = "scone",
        batter = "blueberry-batter",
        tastiness = 9,
        frosted_mod = 1,
        batter_amount = 1,
        result = 2,
    },
    {
        name = "doughnut",
        batter = "blueberry-batter",
        tastiness = 11,
        batter_amount = 1,
        result = 1,
    },
    {
        name = "muffin",
        batter = "blueberry-batter",
        tastiness = 11,
        batter_amount = 1,
        result = 1,
    },
    {
        name = "cupcake",
        batter = "advanced-cake-batter",
        tastiness = 13,
        frosted_mod = 1,
        batter_amount = 1,
        result = 1,
    },
    {
        name = "cake",
        batter = "advanced-cake-batter",
        tastiness = 13,
        frosted_mod = 1,
        batter_amount = 1,
        result = 1,
    },
}

local dataToAdd = {}

for key, shape in pairs(shapes) do
    local b = nil
    for _, value in pairs(batter) do
        if value.name == shape.batter then
            b = value
            break
        end
    end

    if b == nil then
        log("Shape requested non-existent batter: " .. shape.batter)
    end

    local uncooked_shape = {
        type = "item",
        name = b.name .. "-" .. shape.name,
        subgroup = "ingredient",
        enabled = false,
        stack_size = 100,
        icon = baketorio.get_png(b.name .. "-" .. shape.name);
        icon_size = 32;
    }
    local uncooked_shape_recipe = {
        type = "recipe",
        name = (uncooked_shape.name),
        localised_name = { "item-name." .. uncooked_shape.name },
        categories = { "crafting-with-fluid" },
        subgroup = "ingredient",
        allow_productivity = true,
        energy_required = 2,
        enabled = false,
        ingredients = {
            { type = "fluid", name = b.name, amount = shape.batter_amount },
        },
        results = {
            { type = "item", name = uncooked_shape.name, amount = shape.result },
        },
        icon = uncooked_shape.icon;
        icon_size = 32;

    }
    if (shape.topping ~= nil) then
        uncooked_shape_recipe.ingredients[2] = { type = "item", name = shape.topping, amount = 1 };
    end

    local cooked_shape = {
        type = "capsule",
        capsule_action = baketorio.capsule_action(0),
        name = b.name .. "-" .. shape.name .. "-cooked",
        subgroup = b.subgroup,
        enabled = false,
        tastiness = shape.tastiness,
        stack_size = 100,
        icon = baketorio.get_png(b.name .. "-" .. shape.name .. "-cooked");
        icon_size = 32;
    }
    local cooked_shape_recipe = {
        type = "recipe",
        name = cooked_shape.name,
        localised_name = { "item-name." .. cooked_shape.name },
        categories = { "smelting" },
        subgroup = b.subgroup,
        allow_productivity = true,
        energy_required = 10,
        enabled = false,
        ingredients = {
            { type = "item", name = uncooked_shape.name, amount = 1 }
        },
        results = {
            { type = "item", name = cooked_shape.name, amount = shape.result }
        },
        icon = cooked_shape.icon;
        icon_size = 32;
    }
    data:extend({
        uncooked_shape,
        uncooked_shape_recipe,
        cooked_shape,
        cooked_shape_recipe
    })

    if (shape.frosted_mod ~= nil) then
        local cooked_shape_frosted = {
            type = "capsule",
            capsule_action = baketorio.capsule_action(0),
            name = b.name .. "-" .. shape.name .. "-cooked-frosted",
            subgroup = b.subgroup,
            tastiness = shape.tastiness + shape.frosted_mod,
            stack_size = 100,
            cant_mix_with = cooked_shape.name,
            icon = baketorio.get_png(b.name .. "-" .. shape.name .. "-cooked-frosted");
            icon_size = 32;
        }
        local cooked_shape_frosted_recipe = {
            type = "recipe",
            name = cooked_shape_frosted.name,
            localised_name = { "item-name." .. cooked_shape_frosted.name },
            categories = { "crafting" },
            subgroup = b.subgroup,
            allow_productivity = true,
            energy_required = 2,
            enabled = false,
            ingredients = {
                { type = "item", name = cooked_shape.name, amount = 1 },
                { type = "item", name = "frosting",        amount = 1 },
            },
            results = {
                { type = "item", name = cooked_shape_frosted.name, amount = 1 },
            },
            icon = cooked_shape_frosted.icon;
            icon_size = 32;
        }
        data:extend({
            cooked_shape_frosted,
            cooked_shape_frosted_recipe
        })
    end
end

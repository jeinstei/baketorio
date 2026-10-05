-- Add recipe names here to add them to productivity modules
local prod_recipes = {
    "unpasteurized-milk",
    "milk-filtering",
    "milk-pasteurization",
    "butter-churning"
}

data:extend(
    {
        {
            type = "recipe",
            name = "unpasteurized-milk",
            categories = { "greenhouse-recipes" },
            subgroup = "fluid-recipes",
            main_product = "unpasteurized-milk",
            energy_required = 10,
            enabled = false,
            ingredients = {
                { type = "item", name = "cow",   amount = 1, ignored_by_stats = 1 },
                { type = "item", name = "nutrient2", amount = 1 }
            },
            results = {
                { type = "item", name = "cow", amount = 1, ignored_by_stats = 1, ignored_by_productivity = 1 },
                { type = "fluid", name = "unpasteurized-milk", amount = 150 },
            },
        },
        {
            type = "recipe",
            name = "milk-pasteurization",
            categories = { "chemistry" },
            main_product = "milk",
            subgroup = "fluid-recipes",
            energy_required = 2,
            enabled = false,
            ingredients = {
                { type = "fluid", name = "unpasteurized-milk", amount = 20 },
                { type = "fluid", name = "water",          amount = 5 }
            },
            results = {
                { type = "fluid", name = "milk", amount = 18, ignored_by_productivity = 18 },
                { type = "fluid", name = "cream", amount = 2 },
            },
        },
        {
            type = "recipe",
            name = "milk-filtering",
            categories = { "chemistry" },
            subgroup = "fluid-recipes",
            energy_required = 2,
            enabled = false,
            ingredients = {
                { type = "fluid", name = "milk", amount = 20, ignored_by_stats = 18 },
                { type = "fluid", name = "water", amount = 5 }
            },
            results = {
                { type = "fluid", name = "milk", amount = 18, ignored_by_stats = 18, ignored_by_prodcutivity = 18 },
                { type = "fluid", name = "cream", amount = 2 },
            },
            icon = "__baketorio__/graphics/milk.png",
            icon_size = 32,
        },
        {
            type = "recipe",
            name = "butter-churning",
            categories = { "chemistry" },
            subgroup = "fluid-recipes",
            energy_required = 5,
            enabled = false,
            ingredients = {
                { type = "fluid", name = "cream", amount = 20 },
            },
            results = {
                { type = "fluid", name = "liquid-butter", amount = 10 },
            },
            icon = "__baketorio__/graphics/butter_liquid.png",
            icon_size = 32,
        }
    }
)

for _, v in ipairs(prod_recipes) do
    data.raw.recipe[v].allow_productivity = true
end

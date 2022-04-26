data:extend(
    {
        {
            type = "recipe",
            name = "u-milk-recipe",
            category = "greenhouse-recipes",
            subgroup = "fluid-recipes",
            energy_required = 10,
            enabled = "false",
            ingredients ={
                {type="item",name="cow",amount=1},
                {type="item",name="nutrient2",amount=1}
            },
            results=
            {
                {type="item",name="cow",amount=1},
                {type="fluid", name="unpasteurized-milk", amount=150},
            },
            icon = "__baketorio__/graphics/unpasteurized_milk.png",
            icon_size = 32,
        },
        {
            type = "recipe",
            name = "milk-pasteurization",
            category = "chemistry",
            subgroup = "fluid-recipes",
            energy_required = 2,
            enabled = "false",
            ingredients ={
                {type="fluid",name="unpasteurized-milk",amount=20},
                {type="fluid",name="water",amount=5}
            },
            results=
            {
                {type="fluid", name="milk", amount=18},
                {type="fluid", name="cream", amount=2},
            },
            icon = "__baketorio__/graphics/milk.png",
            icon_size = 32,
        },
        {
            type = "recipe",
            name = "milk-filtering",
            category = "chemistry",
            subgroup = "fluid-recipes",
            energy_required = 2,
            enabled = "false",
            ingredients ={
                {type="fluid",name="milk",amount=20},
                {type="fluid",name="water",amount=5}
            },
            results=
            {
                {type="fluid", name="milk", amount=18},
                {type="fluid", name="cream", amount=2},
            },
            icon = "__baketorio__/graphics/milk.png",
            icon_size = 32,
        },
        {
            type = "recipe",
            name = "butter-churning",
            category = "chemistry",
            subgroup = "fluid-recipes",
            energy_required = 5,
            enabled = "false",
            ingredients ={
                {type="fluid",name="cream",amount=20},
            },
            results=
            {
                {type="fluid", name="liquid-butter", amount=10},
            },
            icon = "__baketorio__/graphics/butter_liquid.png",
            icon_size = 32,
        }
    }
)
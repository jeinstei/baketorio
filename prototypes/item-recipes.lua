-- Add recipe names here to add them to productivity modules
local prod_recipes = {
  "butter-solification",
  "cheese-recipe",
  "greenhouse-recipe",
  "organic-synthesizer-recipe",
  "hardtack-recipe",
  "salted-hardtack-recipe",
  "chicken-recipe",
  "chicken-recipe-egg",
  "egg-recipe",
  "cow-recipe",
  "breed-cow-recipe",
  "frosting-recipe",
  "cocoa-powder-recipe",
  "brownie-recipe",
  "cinnamon-sugar-recipe",
  "cinnamon-sugar-doughnut-recipe",
  "chocolate-chip-batter-recipe",
  "chocolate-chip-cookie-recipe",
  "blueberry-pie-recipe",
  "blueberry-pie-cooked-recipe",
  "strawberry-pie-recipe",
  "strawberry-pie-cooked-recipe",
  "soda-ash",
  "baking-soda",
  "plain-ice-cream",
  "brownies-with-ice-cream",
}

for _, v in ipairs(prod_recipes) do
	baketorio_add_to_prod_mod(v)
end

data:extend(
    {
        {
            type = "recipe",
            name = "butter-solification",
            order="f",
            category = "chemistry",
            subgroup = "ingredient",
            energy_required = 0.1,
            enabled = false,
            ingredients ={
                {type="fluid",name="liquid-butter",amount=5}
            },
            results = {
                {type="item", name="butter", amount=1},
            },
            icon = "__baketorio__/graphics/butter.png",
            icon_size = 32,
        },
        {
            type = "recipe",
            name = "cheese-recipe",
            subgroup = "ingredient",
            category = "chemistry",
            order="g",
            energy_required = 30,
            enabled = false,
            ingredients ={
                {type="fluid",name="milk",amount=30},
                {type="fluid",name="cream",amount=2}
            },
            results = {
                {type="item", name="cheese", amount=5},
            },
            icon = "__baketorio__/graphics/cheese.png",
            icon_size = 32,
        },
        {
            type = "recipe",
            name = "greenhouse-recipe",
            category = "crafting",
            subgroup = "production-machine",
            energy_required = 5,
            enabled = true,
            ingredients ={
                
                {type="item",name="iron-plate",amount=20},
                {type="item",name="copper-cable",amount=5}
            },
            results = {
                {type="item",name="greenhouse",amount=1}
            },
            icon = "__baketorio__/graphics/greenhouse-icon.png",
            icon_size = 32,
        },
        {
            type = "recipe",
            name = "organic-synthesizer-recipe",
            category = "crafting",
            subgroup = "production-machine",
            energy_required = 5,
            enabled = true,
            ingredients ={
                
                {type="item",name="iron-plate",amount=10},
                {type="item",name="electronic-circuit",amount=2}
            },
            results = {
                {type="item",name="organic-synthesizer",amount=1}
            },
            icon = "__baketorio__/graphics/organic-synth-item.png",
            icon_size = 32,
        },
        {
            type = "recipe",
            name = "hardtack-recipe",
            category = "smelting",
            subgroup = "bread",
            energy_required = 2,
            enabled = true,
            ingredients ={
                {type="item",name="flour",amount=2}
            },
            results = {
                {type="item",name="hardtack",amount=3}
            },
            icon = "__baketorio__/graphics/hardtack.png",
            icon_size = 32,
        },{
            type = "recipe",
            name = "salted-hardtack-recipe",
            category = "crafting",
            subgroup = "bread",
            energy_required = 2,
            enabled = true,
            ingredients ={
                {type="item",name="hardtack",amount=3},
                {type="item",name="salt",amount=1}
            },
            results = {
                {type="item",name="salted-hardtack",amount=3}
            },
            icons = {
                {icon = "__baketorio__/graphics/hardtack.png", icon_size=32},
                {icon = "__baketorio__/graphics/salt-mod.png", icon_size=32}
            },
            icon_size = 32,
        },
        {
            type = "recipe",
            name = "chicken-recipe",
            order = "c",
            category = "organic-synth-recipes",
            subgroup = "seeds",
            energy_required = 40,
            enabled = false,
            ingredients ={
                {type="item",name="nutrient2",amount=40},
            },
            results = {
                {type="item",name="chicken",amount=1}
            },
            icon = "__baketorio__/graphics/chicken.png",
            icon_size = 32,
        },
        {
            type = "recipe",
            name = "chicken-recipe-egg",
            order = "d",
            category = "organic-synth-recipes",
            subgroup = "seeds",
            energy_required = 20,
            enabled = false,
            ingredients ={
                {type="item",name="egg",amount=1},
            },
            results = {
                {type="item",name="chicken",amount=1,probability=0.25}
            },
            icons = {
                {icon="__baketorio__/graphics/chicken.png", icon_size=32},
                {icon="__baketorio__/graphics/egg-sub.png", icon_size=32}
            },
            icon_size = 32,
        },
        {
            type = "recipe",
            name = "egg-recipe",
            order = "e",
            category = "greenhouse-recipes",
            subgroup = "ingredient",
            energy_required = 10,
            enabled = false,
            ingredients ={
                {type="item",name="chicken",amount=1},
                {type="item",name="nutrient1",amount=5}
            },
            results = {
                {type="item",name="egg",amount=1},
                {type="item",name="chicken",amount=1}
            },
            icon = "__baketorio__/graphics/egg.png",
            icon_size = 32,
        },
        {
            type = "recipe",
            name = "cow-recipe",
            order = "e",
            category = "organic-synth-recipes",
            subgroup = "seeds",
            energy_required = 20,
            enabled = false,
            ingredients ={
                {type="item",name="nutrient3",amount=10},
            },
            results = {
                {type="item",name="cow",amount=1}
            },
            icon="__baketorio__/graphics/cow.png",
            icon_size = 32,
        },
        {
            type = "recipe",
            name = "breed-cow-recipe",
            order = "f",
            category = "organic-synth-recipes",
            subgroup = "seeds",
            energy_required = 100,
            enabled = false,
            ingredients ={
                {type="item",name="cow",amount=2},
                {type="item",name="nutrient2",amount=10},
            },
            results = {
                {type="item",name="cow",amount=3}
            },
            icon="__baketorio__/graphics/cow.png",
            icon_size = 32,
        },
        {
            type = "recipe",
            name = "frosting-recipe",
            category = "crafting-with-fluid",
            subgroup = "ingredient",
            order="ea",
            energy_required = 3,
            enabled = false,
            ingredients ={
                {type="fluid",name="cream",amount=10},
                {type="item",name="sugar",amount=1}
            },
            results = {
                {type="item",name="frosting",amount=1}
            },
            icon="__baketorio__/graphics/frosting.png",
            icon_size = 32,
        },
        {
            type = "recipe",
            name = "cocoa-powder-recipe",
            category = "crafting",
            subgroup = "ingredient",
            order="i",
            energy_required = 20,
            enabled = false,
            ingredients ={
                {type="item",name="cocoa-beans",amount=3}
            },
            results = {
                {type="item",name="cocoa-powder",amount=2}
            },
            icon="__baketorio__/graphics/cocoa-powder.png",
            icon_size = 32,
        },
        {
            type = "recipe",
            name = "brownie-recipe",
            category = "smelting",
            subgroup = "chocolate",
            energy_required = 2,
            enabled = false,
            ingredients ={
                {type="item",name="chocolate-batter",amount=1}
            },
            results = {
                {type="item",name="brownie",amount=2}
            },
            icon="__baketorio__/graphics/brownies.png",
            icon_size = 32,
        },
        {
            type = "recipe",
            name = "cinnamon-sugar-recipe",
            category = "crafting",
            subgroup = "ingredient",
            order="k",
            energy_required = 20,
            enabled = false,
            ingredients ={
                {type="item",name="cinnamon",amount=1},
                {type="item",name="sugar",amount=1}
            },
            results = {
                {type="item",name="cinnamon-sugar",amount=2}
            },
            icon="__baketorio__/graphics/cinnamon-sugar.png",
            icon_size = 32,
        },
        {
            type = "recipe",
            name = "cinnamon-sugar-doughnut-recipe",
            category = "crafting",
            subgroup = "bread",
            energy_required = 20,
            enabled = false,
            ingredients ={
                {type="item",name="fryer-dough-doughnut-cooked",amount=1},
                {type="item",name="cinnamon-sugar",amount=1}
            },
            results = {
                {type="item",name="cinnamon-sugar-doughnut",amount=1}
            },
            icons={
                {
                    icon = "__baketorio__/graphics/cinnamon-sugar-doughnut.png",
                    icon_size = 32
                },
                {
                    icon = "__baketorio__/graphics/cinnamon-sugar-sub.png",
                    icon_size = 32
                }
            }
        },
        {
            type = "recipe",
            name = "chocolate-chip-batter-recipe",
            category = "crafting",
            subgroup = "chocolate",
            energy_required = 5,
            enabled = false,
            ingredients ={
                {type="item",name="basic-batter",amount=1},
                {type="item",name="cocoa-powder",amount=1}
            },
            results = {
                {type="item",name="chocolate-chip-batter",amount=1}
            },
            icon="__baketorio__/graphics/chocolate-chip-batter.png",
            icon_size = 32,
        },
        {
            type = "recipe",
            name = "chocolate-chip-cookie-recipe",
            category = "smelting",
            subgroup = "chocolate",
            energy_required = 6,
            enabled = false,
            ingredients ={
                {type="item",name="chocolate-chip-batter",amount=1},
            },
            results = {
                {type="item",name="chocolate-chip-cookie",amount=3}
            },
            icon="__baketorio__/graphics/chocolate-chip-cookie.png",
            icon_size = 32,
        },
        {
            type = "recipe",
            name = "blueberry-pie-recipe",
            category = "crafting",
            subgroup = "fruit",
            energy_required = 5,
            enabled = false,
            ingredients ={
                {type="item",name="fryer-dough",amount=1},
                {type="item",name="blueberries",amount=10},
            },
            results = {
                {type="item",name="blueberry-pie",amount=1}
            },
        },
        {
            type = "recipe",
            name = "blueberry-pie-cooked-recipe",
            category = "smelting",
            subgroup = "fruit",
            energy_required = 10,
            enabled = false,
            ingredients ={
                {type="item",name="blueberry-pie",amount=1},
            },
            results = {
                {type="item",name="blueberry-pie-cooked",amount=1}
            },
        },
        {
            type = "recipe",
            name = "strawberry-pie-recipe",
            category = "crafting",
            subgroup = "fruit",
            energy_required = 5,
            enabled = false,
            ingredients ={
                {type="item",name="fryer-dough",amount=1},
                {type="item",name="strawberries",amount=3},
            },
            results = {
                {type="item",name="strawberry-pie",amount=1}
            },
        },
        {
            type = "recipe",
            name = "strawberry-pie-cooked-recipe",
            category = "smelting",
            subgroup = "fruit",
            energy_required = 10,
            enabled = false,
            ingredients ={
                {type="item",name="strawberry-pie",amount=1},
            },
            results = {
                {type="item",name="strawberry-pie-cooked",amount=1}
            },
        },
        {
            type = "recipe",
            name = "soda-ash",
            category = "smelting",
            subgroup = "raw-material",
            energy_required = 10,
            enabled = false,
            ingredients ={
                {type="item",name="trona",amount=5},
            },
            results = {
                {type="item",name="soda-ash",amount=1}
            },
        },
        {
            type = "recipe",
            name = "baking-soda",
            category = "crafting-with-fluid",
            subgroup = "raw-material",
            energy_required = 5,
            enabled = false,
            ingredients ={
                {type="item",name="soda-ash",amount=2},
                {type="item",name="coal",amount=1},
                {type="fluid",name="water",amount=10},
            },
            results = {
                {type="item",name="baking-soda",amount=1}
            },
        },
        {
            type = "recipe",
            name = "plain-ice-cream",
            category = "crafting-with-fluid",
            subgroup = "ingredient",
            order="ec",
            energy_required = 120,
            enabled = false,
            ingredients ={
                {type="item",name="sugar",amount=1},
                {type="fluid",name="milk",amount=5},
            },
            results = {
                {type="item",name="plain-ice-cream",amount=1}
            },
        },
        {
            type = "recipe",
            name = "brownies-with-ice-cream",
            category = "crafting-with-fluid",
            subgroup = "chocolate",
            energy_required = 2,
            enabled = false,
            ingredients ={
                {type="item",name="brownie",amount=1},
                {type="item",name="plain-ice-cream",amount=1},
            },
            results = {
                {type="item",name="brownies-with-ice-cream",amount=1}
            },
        },
    }
)

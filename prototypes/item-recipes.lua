-- Add recipe names here to add them to productivity modules
local prod_recipes = {
  "butter-solidification",
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
	baketorio.add_to_prod_mod(v)
end

data:extend(
    {
        {
            type = "recipe",
            name = "butter-solidification",
            order="f",
            categories = {"chemistry"}, 
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
            localised_name = {"item-name.cheese"},
            subgroup = "ingredient",
            categories = {"chemistry"}, 
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
            localised_name = {"item-name.greenhouse"},
            categories = {"crafting"}, 
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
            localised_name = {"item-name.organic-synthesizer"},
            categories = {"crafting"}, 
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
            localised_name = {"item-name.hardtack"},
            categories = {"smelting"}, 
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
            localised_name = {"item-name.salted-hardtack"},
            categories = {"crafting"}, 
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
            localised_name = {"item-name.chicken"},
            order = "c",
            categories = {"organic-synth-recipes"}, 
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
            categories = {"organic-synth-recipes"}, 
            subgroup = "seeds",
            energy_required = 20,
            enabled = false,
            ingredients ={
                {type="item",name="egg",amount=1},
            },
            results = {
                {type="item",name="chicken",amount=1,independent_probability=0.25}
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
            localised_name = {"item-name.egg"},
            order = "e",
            categories = {"greenhouse-recipes"}, 
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
            localised_name = {"item-name.cow"},
            order = "e",
            categories = {"organic-synth-recipes"}, 
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
            categories = {"organic-synth-recipes"}, 
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
            localised_name = {"item-name.frosting"},
            categories = {"crafting-with-fluid"}, 
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
            localised_name = {"item-name.cocoa-powder"},
            categories = {"crafting"}, 
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
            localised_name = {"item-name.brownie"},
            categories = {"smelting"}, 
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
            localised_name = {"item-name.cinnamon-sugar"},
            categories = {"crafting"}, 
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
            localised_name = {"item-name.cinnamon-sugar-doughnut"},
            categories = {"crafting"}, 
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
            localised_name = {"item-name.chocolate-chip-batter"},
            categories = {"crafting"}, 
            subgroup = "ingredient",
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
            localised_name = {"item-name.chocolate-chip-cookie"},
            categories = {"smelting"}, 
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
            localised_name = {"item-name.blueberry-pie"},
            categories = {"crafting"}, 
            subgroup = "ingredient",
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
            localised_name = {"item-name.blueberry-pie-cooked"},
            categories = {"smelting"}, 
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
            localised_name = {"item-name.strawberry-pie"},
            categories = {"crafting"}, 
            subgroup = "ingredient",
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
            localised_name = {"item-name.strawberry-pie-cooked"},
            categories = {"smelting"}, 
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
            localised_name = {"item-name.soda-ash"},
            categories = {"smelting"}, 
            subgroup = "ingredient",
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
            localised_name = {"item-name.baking-soda"},
            categories = {"crafting-with-fluid"}, 
            subgroup = "ingredient",
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
            localised_name = {"item-name.plain-ice-cream"},
            categories = {"crafting-with-fluid"}, 
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
            localised_name = {"item-name.brownies-with-ice-cream"},
            categories = {"crafting-with-fluid"}, 
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

data:extend(
    {
        {
            type = "item",
            name = "sugar",
            icon = "__baketorio__/graphics/sugar.png",
            icon_size = 32,
            subgroup = "ingredient",
            stack_size = 100
        },
        {
            type = "item",
            name = "sugarcane",
            icon = "__baketorio__/graphics/sugarcane.png",
            icon_size = 32,
            subgroup = "ingredient",
            stack_size = 100
        },
        {
            type = "item",
            name = "sugarcane-seeds",
            icon = "__baketorio__/graphics/sugarcane-seeds.png",
            icon_size = 32,
            subgroup = "seeds",
            stack_size = 100
        },
        {
            type = "item",
            name = "wheat",
            icon = "__baketorio__/graphics/wheat.png",
            icon_size = 32,
            subgroup = "ingredient",
            stack_size = 100
        },
        {
            type = "item",
            name = "wheat-seeds",
            icon = "__baketorio__/graphics/seeds-wheat.png",
            icon_size = 32,
            subgroup = "seeds",
            stack_size = 100
        },
        {
            type = "item",
            name = "flour",
            icon = "__baketorio__/graphics/flour.png",
            icon_size = 32,
            subgroup = "ingredient",
            stack_size = 100,
        },
        {
            type = "item",
            name = "cocoa-beans",
            icon = "__baketorio__/graphics/cocoa-beans.png",
            icon_size = 32,
            subgroup = "ingredient",
            stack_size = 100
        },
        {
            type = "item",
            name = "cocoa-bean-seeds",
            icon = "__baketorio__/graphics/seeds-cocoa-beans.png",
            icon_size = 32,
            subgroup = "seeds",
            stack_size = 100
        },
        {
            type = "item",
            name = "cinnamon",
            icon = "__baketorio__/graphics/cinnamon.png",
            icon_size = 32,
            subgroup = "ingredient",
            stack_size = 100
        },
        {
            type = "item",
            name = "cinnamon-seeds",
            icon = "__baketorio__/graphics/seeds-cinnamon.png",
            icon_size = 32,
            subgroup = "seeds",
            stack_size = 100
        },
        {
            type = "capsule",
            capsule_action = capsule_action(0),
            name = "blueberries",
            icon = "__baketorio__/graphics/blueberries.png",
            icon_size = 32,
            subgroup = "fruit",
            stack_size = 100
        },
        {
            type = "item",
            name = "blueberry-seeds",
            icon = "__baketorio__/graphics/seeds-blueberries.png",
            icon_size = 32,
            subgroup = "seeds",
            stack_size = 100
        },
        {
            type = "item",
            name = "strawberry-seeds",
            icon = "__baketorio__/graphics/seeds-strawberries.png",
            icon_size = 32,
            subgroup = "seeds",
            stack_size = 100
        },
        {
            type = "capsule",
            capsule_action = capsule_action(0),
            name = "strawberries",
            icon = "__baketorio__/graphics/strawberries.png",
            icon_size = 32,
            subgroup = "fruit",
            stack_size = 100
        }
    }
)

-- Add recipe names here to add them to productivity modules
local prod_recipes = {
  "wheat-seeds",
  "wheat-recipe",
  "flour-recipe",
  "sugar-recipe",
  "sugarcane-recipe",
  "sugarcane-seeds",
  "cocoa-bean-seeds",
  "cocoa-beans-recipe",
  "cinnamon-seeds",
  "cinnamon-recipe",
  "blueberry-seeds",
  "blueberries-recipe",
  "strawberry-seeds",
  "strawberries-recipe",
}

for _, v in ipairs(prod_recipes) do
	baketorio_add_to_prod_mod(v)
end

data:extend{
    {
        type = "recipe",
        name = "wheat-seeds",
        localised_name = {"item-name.wheat-seeds"},
        category = "organic-synth-recipes",
        subgroup = "seeds",
        order="a",
        energy_required = 30,
        enabled = true,
        ingredients ={
            {type="item",name="wood",amount=100}
        },
        results = {
            {type="item",name="wheat-seeds",amount=1}
        },
        icon = "__baketorio__/graphics/seeds-wheat.png",
        icon_size = 32,
    },
    {
        type = "recipe",
        name = "wheat-recipe",
        localised_name = {"item-name.wheat"},
        category = "greenhouse-recipes",
        subgroup = "ingredient",
        order="a",
        energy_required = 10,
        enabled = true,
        ingredients ={
            {type="item",name="wheat-seeds",amount=1}
        },
        results = {
            {type="item",name="wheat-seeds",amount=1,probability = 0.1},
            {type="item",name="wheat-seeds",amount=1},
            {type="item",name="wheat",amount_min=3,amount_max=5}
        },
        icon = "__baketorio__/graphics/wheat.png",
        icon_size = 32,
    },
    {
        type = "recipe",
        name = "flour-recipe",
        localised_name = {"item-name.flour"},
        order="b",
        category = "crafting",
        subgroup = "ingredient",
        energy_required = 1,
        enabled = true,
        ingredients ={
            {type="item",name="wheat",amount=2}
        },
        results = {
            {type="item",name="flour",amount=1}
        },
        icon = "__baketorio__/graphics/flour.png",
        icon_size = 32,
    },
    {
        type = "recipe",
        name = "sugar-recipe",
        localised_name = {"item-name.sugar"},
        order="d",
        category = "crafting",
        subgroup = "ingredient",
        energy_required = 1,
        enabled = false,
        ingredients ={
            {type="item",name="sugarcane",amount=2}
        },
        results = {
            {type="item",name="sugar",amount=1}
        },
        icon = "__baketorio__/graphics/sugar.png",
        icon_size = 32,
    },
    {
        type = "recipe",
        name = "sugarcane-recipe",
        localised_name = {"item-name.sugarcane"},
        order="c",
        category = "greenhouse-recipes",
        subgroup = "ingredient",
        energy_required = 10,
        enabled = false,
        ingredients ={
            {type="item",name="sugarcane-seeds",amount=1},
            {type="item",name="nutrient1",amount=1}
        },
        results = {
            {type="item",name="sugarcane-seeds",amount=1,probability = 0.15},
            {type="item",name="sugarcane-seeds",amount=1},
            {type="item",name="sugarcane",amount_min=3,amount_max=4}
        },
        icon = "__baketorio__/graphics/sugarcane.png",
        icon_size = 32,
    },
    {
        type = "recipe",
        name = "sugarcane-seeds",
        localised_name = {"item-name.sugarcane-seeds"},
        order="b",
        category = "organic-synth-recipes",
        subgroup = "seeds",
        energy_required = 30,
        enabled = false,
        ingredients ={
            {type="item",name="nutrient1",amount=10}
        },
        results = {
            {type="item",name="sugarcane-seeds",amount=1}
        },
        icon = "__baketorio__/graphics/sugarcane-seeds.png",
        icon_size = 32,
    },
    {
        type = "recipe",
        name = "cocoa-bean-seeds",
        localised_name = {"item-name.cocoa-bean-seeds"},
        order="g",
        category = "organic-synth-recipes",
        subgroup = "seeds",
        energy_required = 30,
        enabled = false,
        ingredients ={
            {type="item",name="nutrient4",amount=1}
        },
        results = {
            {type="item",name="cocoa-bean-seeds",amount=1}
        },
        icon = "__baketorio__/graphics/seeds-cocoa-beans.png",
        icon_size = 32,
    },
    {
        type = "recipe",
        name = "cocoa-beans-recipe",
        localised_name = {"item-name.cocoa-beans"},
        order="h",
        category = "greenhouse-recipes",
        subgroup = "ingredient",
        energy_required = 10,
        enabled = false,
        ingredients ={
            {type="item",name="cocoa-bean-seeds",amount=1},
            {type="item",name="nutrient3",amount=1}
        },
        results = {
            {type="item",name="cocoa-bean-seeds",amount=1,probability = 0.05},
            {type="item",name="cocoa-bean-seeds",amount=1},
            {type="item",name="cocoa-beans",amount_min=2,amount_max=5}
        },
        icon = "__baketorio__/graphics/cocoa-beans.png",
        icon_size = 32,
    },
    {
        type = "recipe",
        name = "cinnamon-seeds",
        localised_name = {"item-name.cinnamon-seeds"},
        order="h",
        category = "organic-synth-recipes",
        subgroup = "seeds",
        energy_required = 120,
        enabled = false,
        ingredients ={
            {type="item",name="nutrient4",amount=100}
        },
        results = {
            {type="item",name="cinnamon-seeds",amount=1}
        },
        icon = "__baketorio__/graphics/seeds-cinnamon.png",
        icon_size = 32,
    },
    {
        type = "recipe",
        name = "cinnamon-recipe",
        localised_name = {"item-name.cinnamon"},
        category = "greenhouse-recipes",
        subgroup = "ingredient",
        order="j",
        energy_required = 10,
        enabled = false,
        ingredients ={
            {type="item",name="cinnamon-seeds",amount=1},
            {type="item",name="nutrient4",amount=1}
        },
        results = {
            {type="item",name="cinnamon-seeds",amount=1,probability = 0.01},
            {type="item",name="cinnamon-seeds",amount=1},
            {type="item",name="cinnamon",amount_min=2,amount_max=4}
        },
        icon = "__baketorio__/graphics/cinnamon.png",
        icon_size = 32,
    },
    {
        type = "recipe",
        name = "blueberry-seeds",
        localised_name = {"item-name.blueberry-seeds"},
        order="j",
        category = "organic-synth-recipes",
        subgroup = "seeds",
        energy_required = 360,
        enabled = false,
        ingredients ={
            {type="item",name="nutrient5",amount=1}
        },
        results = {
            {type="item",name="blueberry-seeds",amount=1}
        },
        icon = "__baketorio__/graphics/seeds-blueberries.png",
        icon_size = 32,
    },
    {
        type = "recipe",
        name = "blueberries-recipe",
        localised_name = {"item-name.blueberries"},
        category = "greenhouse-recipes",
        subgroup = "ingredient",
        order="l",
        energy_required = 10,
        enabled = false,
        ingredients ={
            {type="item",name="blueberry-seeds",amount=1},
            {type="item",name="nutrient5",amount=1}
        },
        results = {
            {type="item",name="blueberry-seeds",amount=1,probability = 0.02},
            {type="item",name="blueberry-seeds",amount=1},
            {type="item",name="blueberries",amount=1}
        },
        icon = "__baketorio__/graphics/blueberries.png",
        icon_size = 32,
    },
    {
        type = "recipe",
        name = "strawberry-seeds",
        localised_name = {"item-name.strawberry-seeds"},
        order="m",
        category = "organic-synth-recipes",
        subgroup = "seeds",
        energy_required = 500,
        enabled = false,
        ingredients ={
            {type="item",name="nutrient5",amount=25}
        },
        results = {
            {type="item",name="strawberry-seeds",amount=1}
        },
        icon = "__baketorio__/graphics/seeds-strawberries.png",
        icon_size = 32,
    },
    {
        type = "recipe",
        name = "strawberries-recipe",
        localised_name = {"item-name.strawberries"},
        category = "greenhouse-recipes",
        subgroup = "ingredient",
        order="m",
        energy_required = 10,
        enabled = false,
        ingredients ={
            {type="item",name="strawberry-seeds",amount=1},
            {type="item",name="nutrient5",amount=5}
        },
        results = {
            {type="item",name="strawberry-seeds",amount=1,probability = 0.04},
            {type="item",name="strawberry-seeds",amount=1},
            {type="item",name="strawberries",amount=1}
        },
        icon = "__baketorio__/graphics/strawberries.png",
        icon_size = 32,
    },

}
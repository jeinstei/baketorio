--local serpent = require("serpent")
function makeRecipe(name,amount,ingredients,c)
	local recipe_name = "recipe-".. name.."-" .. c
    data:extend{
        {
            type="recipe",
            name= recipe_name,
            localised_name = {"nutrient-name." .. name},
            energy_required = 2,
            category = "crafting",
            order= name .."-".. amount,
            subgroup="nutrients",
            enabled = (name == "nutrient1"),
            allow_productivity = true,
            ingredients = ingredients,
            results = {
                {type="item", name=name, amount=amount*2}
            },
            icon = "__baketorio__/graphics/"..name..".png",
            icon_size=32
        }
    }
	baketorio_add_to_prod_mod(recipe_name)
    if(name ~= "nutrient1") then
        -- log(name);
        table.insert(data.raw.technology[name].effects,{
            type = "unlock-recipe",
            recipe = "recipe-".. name.."-" .. c
        });
    end
end

data:extend(
    {
        {
            type = "item",
            name = "nutrient1",
            localised_name = {"nutrient-name.nutrient1"},
            icon = "__baketorio__/graphics/nutrient1.png",
            icon_size = 32,
            subgroup = "nutrients",
            stack_size = 100
        },
        {
            type = "item",
            name = "nutrient2",
            localised_name = {"nutrient-name.nutrient2"},
            icon = "__baketorio__/graphics/nutrient2.png",
            icon_size = 32,
            subgroup = "nutrients",
            stack_size = 100
        },
        {
            type = "item",
            name = "nutrient3",
            localised_name = {"nutrient-name.nutrient3"},
            icon = "__baketorio__/graphics/nutrient3.png",
            icon_size = 32,
            subgroup = "nutrients",
            stack_size = 100
        },
        {
            type = "item",
            name = "nutrient4",
            localised_name = {"nutrient-name.nutrient4"},
            icon = "__baketorio__/graphics/nutrient4.png",
            icon_size = 32,
            subgroup = "nutrients",
            stack_size = 100
        },
        {
            type = "item",
            name = "nutrient5",
            localised_name = {"nutrient-name.nutrient5"},
            icon = "__baketorio__/graphics/nutrient5.png",
            icon_size = 32,
            subgroup = "nutrients",
            stack_size = 100
        },
        {
            type = "item",
            name = "nutrient6",
            localised_name = {"nutrient-name.nutrient6"},
            icon = "__baketorio__/graphics/nutrient6.png",
            icon_size = 32,
            subgroup = "nutrients",
            stack_size = 100
        },
        {
            type = "item",
            name = "nutrient7",
            localised_name = {"nutrient-name.nutrient7"},
            icon = "__baketorio__/graphics/nutrient7.png",
            icon_size = 32,
            subgroup = "nutrients",
            stack_size = 100
        },
    }
)

data:extend{
    {
        type = "technology",
        name = "nutrient2",
        localised_name= {"nutrient-name.nutrient2"},
        icon_size = 128,
        icon = "__baketorio__/graphics/n2_tech.png",
        prerequisites = {"leavening"},
        effects = {},
        unit =
        {
          count = 10,
          ingredients = {
            {"automation-science-pack", 1}
        },
          time = 30
        },
    },
    {
        type = "technology",
        name = "nutrient3",
        localised_name= {"nutrient-name.nutrient3"},
        icon_size = 128,
        icon = "__baketorio__/graphics/n3_tech.png",
        prerequisites = {"leavening"},
        effects = {},
        unit =
        {
          count = 30,
          ingredients = {
            {"automation-science-pack", 1}
        },
          time = 30
        },
    },
    {
        type = "technology",
        name = "nutrient4",
        localised_name= {"nutrient-name.nutrient4"},
        icon_size = 128,
        icon = "__baketorio__/graphics/n4_tech.png",
        prerequisites = {"logistic-science-pack"},
        effects = {},
        unit =
        {
          count = 150,
          ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1}
        },
          time = 30
        },
    },
    {
        type = "technology",
        name = "nutrient5",
        localised_name= {"nutrient-name.nutrient5"},
        icon_size = 128,
        icon = "__baketorio__/graphics/n5_tech.png",
        prerequisites = {"chemical-science-pack"},
        effects = {},
        unit =
        {
          count = 200,
          ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1}
        },
          time = 30
        },
    },
    {
        type = "technology",
        name = "nutrient6",
        localised_name= {"nutrient-name.nutrient6"},
        icon_size = 128,
        icon = "__baketorio__/graphics/n6_tech.png",
        prerequisites = {"production-science-pack"},
        effects = {},
        unit =
        {
          count = 500,
          ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1}
          },
          time = 30
        },
    },
    {
        type = "technology",
        name = "nutrient7",
        localised_name= {"nutrient-name.nutrient7"},
        icon_size = 128,
        icon = "__baketorio__/graphics/n7_tech.png",
        prerequisites = {"rocket-silo"},
        effects = {},
        unit =
        {
          count = 800,
          ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"utility-science-pack", 1},
            {"production-science-pack", 1},
            {"space-science-pack", 1}
          },
          time = 30
        },
    },
}

function get_nutrient(tastiness)
    if(tastiness >= 30) then
        return {
            name = "nutrient7",
            amount = (tastiness-29);
        };
    end
    if(tastiness >= 25) then
        return {
            name = "nutrient6",
            amount = (tastiness-24);
        };
    end
    if(tastiness >= 17) then
        return {
            name = "nutrient5",
            amount = (tastiness-16);
        };
    end
    if(tastiness >= 12) then
        return {
            name = "nutrient4",
            amount = (tastiness-11);
        };
    end
    if(tastiness >= 7) then
        return {
            name = "nutrient3",
            amount = (tastiness-6);
        };
    end
    if(tastiness >= 5) then
        return {
            name = "nutrient2",
            amount = tastiness-4;
        };
    end
    if(tastiness >= 3) then
        return {
            name = "nutrient1",
            amount = tastiness-2;
        };
    end
    return {
        name = "none",
        energy = 2
    };
end

local foods = {}

for key,value in pairs(data.raw["item"]) do
    if(value.tastiness ~= nil and value.not_edible ~= true) then
        foods[#foods+1] = value;
    end
end

for key,value in pairs(data.raw["capsule"]) do
    if(value.tastiness ~= nil and value.not_edible ~= true) then
        foods[#foods+1] = value;
    end
end

-- Supports negative tastiness setting

for key,value in pairs(foods) do
    if (value.type == "capsule") then
        value.capsule_action = capsule_action(value.tastiness*10)
    end
end

local c = 0

-- Build nutrient ingredients for tasty recipes
for i=1,#foods-1 do
    local t;
    local ingredient1 = foods[i].name
    local nutrientData = get_nutrient(foods[i].tastiness)
    if(nutrientData.name ~= "none") then
        makeRecipe(nutrientData.name,nutrientData.amount,{{type="item", name=ingredient1, amount=1}},c);
    end
    for j=i+1,#foods do
        local ingredient2 = foods[j].name
        t = foods[i].tastiness + foods[j].tastiness
        if(foods[j].tastiness < t/5) then
            goto continue
        end
        if(foods[i].tastiness < t/5) then
            goto continue
        end
        if(foods[i].cant_mix_with == foods[j].name) then
            goto continue
        end
        if(foods[j].cant_mix_with == foods[i].name) then
            goto continue
        end
        c = c+1
        nutrientData = get_nutrient(t)
        if(nutrientData.name ~= "none") then
            makeRecipe(nutrientData.name,nutrientData.amount,{{type="item", name=ingredient1, amount=1},{type="item", name=ingredient2, amount=1}},c);
        end
        ::continue::
    end
end

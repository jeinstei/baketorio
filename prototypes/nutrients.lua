--local serpent = require("serpent")
local iconSize = 32
local overlayScale = 0.5

local adjustSize = iconSize / 4
local upperLeft = {-adjustSize,-adjustSize}
local upperRight = {adjustSize,-adjustSize}
local lowerLeft = {-adjustSize,adjustSize}
local lowerRight = {adjustSize,adjustSize}

local overlayOffsets = {upperLeft, upperRight, lowerLeft, lowerRight}

function baketorio.makeRecipe(name,amount,ingredients,c)
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
            ingredients = ingredients,
            results = {
                {type="item", name=name, amount=amount*2}
            },
            icons = baketorio.makeIconLayered(name,ingredients),
            icon_size=iconSize
        }
    }
    baketorio.add_to_prod_mod(recipe_name)

    table.insert(data.raw.technology[name].effects,{
        type = "unlock-recipe",
        recipe = "recipe-".. name.."-" .. c
    });

    return recipe_name
end

--Failed to load mods: Error while loading recipe prototype "recipe-nutrient1-0" (recipe): Value must be a dictionary in property tree at ROOT.recipe.recipe-nutrient1-0.icons[0]

function baketorio.makeIconLayered(name,ingredients)
    local icon_list = {
        {icon = baketorio.get_png(name), icon_size=iconSize},
    }

    -- For each ingredient, find item and choo
    for idx, ingredient in ipairs(ingredients) do

        -- Test for where to get icon data from and then use it
        local ingredientIcons = nil
        local rawItem = {}
        if rawget(data.raw["item"],ingredient.name) then
            if rawget(data.raw["item"][ingredient.name], "icon") then
                rawItem = data.raw["item"][ingredient.name]
            else
                ingredientIcons = data.raw["capsule"][ingredient.name].icons
            end
        end
        if rawget(data.raw["capsule"],ingredient.name) then
            if rawget(data.raw["capsule"][ingredient.name], "icon") then
                rawItem = data.raw["capsule"][ingredient.name]
            else
                ingredientIcons = data.raw["capsule"][ingredient.name].icons
            end
        end

        -- Add icons to list
        if ingredientIcons then
            for _, ii in ipairs(ingredientIcons) do
                table.insert(icon_list,
                {icon = ii.icon,
                icon_size = ii.icon_size,
                scale = overlayScale,
                shift = overlayOffsets[idx]
                })
            end
        else
            table.insert(icon_list,
            {icon = rawItem.icon,
            icon_size = rawItem.icon_size,
            scale = overlayScale,
            shift = overlayOffsets[idx]
            })
        end
    end
    return icon_list;
end

data:extend(
    {
        {
            type = "item",
            name = "nutrient1",
            localised_name = {"nutrient-name.nutrient1"},
            icon = baketorio.get_png("nutrient1"),
            icon_size = 32,
            subgroup = "nutrients",
            stack_size = 100
        },
        {
            type = "item",
            name = "nutrient2",
            localised_name = {"nutrient-name.nutrient2"},
            icon = baketorio.get_png("nutrient2"),
            icon_size = 32,
            subgroup = "nutrients",
            stack_size = 100
        },
        {
            type = "item",
            name = "nutrient3",
            localised_name = {"nutrient-name.nutrient3"},
            icon = baketorio.get_png("nutrient3"),
            icon_size = 32,
            subgroup = "nutrients",
            stack_size = 100
        },
        {
            type = "item",
            name = "nutrient4",
            localised_name = {"nutrient-name.nutrient4"},
            icon = baketorio.get_png("nutrient4"),
            icon_size = 32,
            subgroup = "nutrients",
            stack_size = 100
        },
        {
            type = "item",
            name = "nutrient5",
            localised_name = {"nutrient-name.nutrient5"},
            icon = baketorio.get_png("nutrient5"),
            icon_size = 32,
            subgroup = "nutrients",
            stack_size = 100
        },
        {
            type = "item",
            name = "nutrient6",
            localised_name = {"nutrient-name.nutrient6"},
            icon = baketorio.get_png("nutrient6"),
            icon_size = 32,
            subgroup = "nutrients",
            stack_size = 100
        },
        {
            type = "item",
            name = "nutrient7",
            localised_name = {"nutrient-name.nutrient7"},
            icon = baketorio.get_png("nutrient7"),
            icon_size = 32,
            subgroup = "nutrients",
            stack_size = 100
        },
    }
)

data:extend{
    {
        type = "technology",
        name = "nutrient1",
        localised_name= {"nutrient-name.nutrient1"},
        icon_size = 128,
        icon = baketorio.get_png("n1_tech"),
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
        name = "nutrient2",
        localised_name= {"nutrient-name.nutrient2"},
        icon_size = 128,
        icon = baketorio.get_png("n2_tech"),
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
        icon = baketorio.get_png("n3_tech"),
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
        icon = baketorio.get_png("n4_tech"),
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
        icon = baketorio.get_png("n5_tech"),
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
        icon = baketorio.get_png("n6_tech"),
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
        icon = baketorio.get_png("n7_tech"),
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

function baketorio.get_nutrient(tastiness)
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
        value.capsule_action = baketorio.capsule_action(value.tastiness*10)
    end
end

local c = 0

-- Build nutrient ingredients for tasty recipes
for i=1,#foods-1 do
    local t;
    local ingredient1 = foods[i].name
    local nutrientData = baketorio.get_nutrient(foods[i].tastiness)
    if(nutrientData.name ~= "none") then
        baketorio.makeRecipe(nutrientData.name,nutrientData.amount,{{type="item", name=ingredient1, amount=1}},c);
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
        nutrientData = baketorio.get_nutrient(t)
        if(nutrientData.name ~= "none") then
            baketorio.makeRecipe(nutrientData.name,nutrientData.amount,{{type="item", name=ingredient1, amount=1},{type="item", name=ingredient2, amount=1}},c);
        end
        ::continue::
    end
end
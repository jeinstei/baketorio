--local serpent = require("serpent")
local iconSize = 32
local overlayScale = 0.5

local adjustSize = iconSize / 4
local upperLeft = {-adjustSize,-adjustSize}
local upperRight = {adjustSize,-adjustSize}
local lowerLeft = {-adjustSize,adjustSize}
local lowerRight = {adjustSize,adjustSize}

local overlayOffsets = {upperLeft, upperRight, lowerLeft, lowerRight}

-- Definition of nutrient techs
local nutrient_tech_table_lookup = {}
nutrient_tech_table_lookup["nutrient1"] =  {
    tastiness = 3,
    prerequisites = {"leavening"},
    unit = {
        count = 10,
        ingredients = {
        {"automation-science-pack", 1}
    },
        time = 30,
    },
}
nutrient_tech_table_lookup["nutrient2"] =  {
    tastiness = 5,
    prerequisites = {"leavening"},
    unit = {count = 10,
        ingredients = {
        {"automation-science-pack", 1}
    },
        time = 30,
    }
}
nutrient_tech_table_lookup["nutrient3"] =  {
    tastiness = 7,
    prerequisites = {"leavening"},
    unit = {count = 30,
        ingredients = {
        {"automation-science-pack", 1}
    },
        time = 30,
    }
}
nutrient_tech_table_lookup["nutrient4"] =  {
    tastiness = 12,
    prerequisites = {"logistic-science-pack"},
    unit = {count = 150,
        ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
    },
        time = 30,
    }
}
nutrient_tech_table_lookup["nutrient5"] = {
    tastiness = 17,
    prerequisites = {"chemical-science-pack"},
    unit = {
        count = 200,
        ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
    },
        time = 30,
    }
}
nutrient_tech_table_lookup["nutrient6"] = {
    tastiness = 25,
    prerequisites = {"production-science-pack"},
    unit = {
        count = 500,
        ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1}
        },
        time = 30
    }
}
nutrient_tech_table_lookup["nutrient7"] = {
    tastiness = 30,
    prerequisites = {"rocket-silo"},
    unit = {
        count = 800,
        ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
        {"production-science-pack", 1},
        {"space-science-pack", 1},
        },
    time = 30,
    }
}

-- Helper function to verify that the nutrient definition table meets some minimum requirements
function baketorio.verify_nutrient_table(nutrient_table)
    -- Should toss a bad key error if nutrient names don't match as well
    local last_tasty
    local curr_tasty
    local tsize = table_size(nutrient_table)
    for i=tsize,1,-1
    do
        name = "nutrient" .. tostring(i)
        curr_tasty = nutrient_table[name]["tastiness"]
        if curr_tasty <= 2 then
            error("Nutrient tastiness must be > 2")
        end
        if i == tsize then
            last_tasty = curr_tasty
        else
            curr_tasty = nutrient_table[name]["tastiness"]
            if last_tasty <= curr_tasty then
                error("Nutrient_table requires tastiness to decrease with nutrient level")
            else
                last_tasty = curr_tasty
            end
        end
    end
end

-- Build a nutrient receipe
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
            enabled = false,
            ingredients = ingredients,
            results = {
                {type="item", name=name, amount=amount*2}
            },
            icons = baketorio.makeIconLayered(name,ingredients),
            icon_size=iconSize
        }
    }

    -- Allow productivity modules for nutrients
    baketorio.add_to_prod_mod(recipe_name)

    table.insert(data.raw.technology[name].effects,{
        type = "unlock-recipe",
        recipe = "recipe-".. name.."-" .. c
    });

    return recipe_name
end

-- Make a layered icon based on its ingredients
function baketorio.makeIconLayered(name,ingredients)
    local icon_list = {
        {icon = baketorio.get_png(name), icon_size=iconSize},
    }

    -- For each ingredient, find item and choo
    for idx, ingredient in ipairs(ingredients) do

        -- Test for where to get icon data from and then use it
        local ingredientIcons = nil
        local rawItem = {}
        if rawget(data.raw["item"], ingredient.name) then
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

-- Add nutrient items to prototypes
function baketorio.build_nutrient_items(nutrient_table)
    for i=1,table_size(nutrient_table),1
    do
        data:extend(
            {
                {
                    type = "item",
                    name = "nutrient" .. tostring(i),
                    localised_name = {"nutrient-name.nutrient" .. tostring(i)},
                    icon = baketorio.get_png("nutrient" .. tostring(i)),
                    icon_size = 32,
                    subgroup = "nutrients",
                    stack_size = 100
                },
            }
        )
    end
end

-- Get the list of nutrient items that were built from the registered prototypes
function baketorio.getNutrientListFromData()
    local nlist = {}
    for _,v in ipairs(data.raw["item"])
    do
        if v["subgroup"] == "nutrients" then
            table.insert(nlist, v["name"])
        end
    end
    return nlist
end

-- Build nutrient technologies from table definitions and add to prototypes
function baketorio.build_nutrient_techs(nutrient_table)
    for key, values in pairs(nutrient_table)
    do
        nNumber = string.sub(key, 9, 1)
        data:extend{
            {
                type = "technology",
                name = key,
                localised_name= {"nutrient-name." .. key},
                icon_size = 128,
                icon = baketorio.get_png(key .. "_tech"),
                prerequisites = values["prerequisites"],
                effects = {},
                unit = values["unit"],
            }
        }
    end
end

-- Helper function to get which nutrient an item uses based on its tastiness
function baketorio.get_nutrient_by_tastiness(tastiness, nutrient_table)
    -- Iterate backwards through table for tastiness
    for i=table_size(nutrient_table),1,-1
    do
        name = "nutrient" .. tostring(i)
        test_value = nutrient_table[name]["tastiness"]
        if(tastiness >= test_value) then
            return {
                name = name,
                amount = (tastiness-(test_value-1));
            };
        end
    end

    return {
        name = "none",
        energy = 2
    };
end

-- Builds all the nutrient recipes based on tastiness values for the defined nutrients
function baketorio.build_nutrient_recipes(nutrient_table)
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
        local nutrientData = baketorio.get_nutrient_by_tastiness(foods[i].tastiness, nutrient_table)
        if(nutrientData.name ~= "none") then
            baketorio.makeRecipe(nutrientData.name,nutrientData.amount,{{type="item", name=ingredient1, amount=1}},c);
            c = c + 1
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
            nutrientData = baketorio.get_nutrient_by_tastiness(t, nutrient_table)
            if(nutrientData.name ~= "none") then
                baketorio.makeRecipe(nutrientData.name,nutrientData.amount,{{type="item", name=ingredient1, amount=1},{type="item", name=ingredient2, amount=1}},c);
                c = c + 1
            end
            ::continue::
        end
    end
end

-- Removes nutrient technologies for clean slate
-- Does not clear recipes, though
function baketorio.clear_nutrient_techs()
    -- Get nutrient tech indices for techs that match the string "nutrient[0,9]"
    local nTechsIdx = {}
    for i,v in ipairs(data.raw["technology"]) do
        -- If a match, save index of technology into list
        if string.sub(v["name"], 1, 8) == "nutrient" and tonumber(string.sub(v["name"], 9, 1)) ~= nil then
            table.insert(nTechsIdx, i)
        end

        -- Remove nutrient techs from prerequisites of all technologies
        for _, j in ipairs(data.raw["technology"][k]["prerequisites"])
        do
            -- Trigger a prerequisites rebuild if a nutrient tech was found in the list
            local doRebuild = false
            if string.sub(j, 1, 8) == "nutrient" and tonumber(string.sub(v["name"], 9, 1)) ~= nil then
                doRebuild = true
            end

            -- Perform rebuild of prerequsistes if needed and then break out of this loop
            if doRebuild then
                for _, j in ipairs(data.raw["technology"][k]["prerequisites"])
                do
                    local prereqs = {}
                    if string.sub(j, 1, 8) ~= "nutrient" then
                        table.insert(prereqs, j)
                    end
                    data.raw["technology"][k]["prerequisites"] = prereqs
                end
                break
            end
        end
    end

    -- Remove techs previously found
    for i in ipairs(nTechsIdx)
    do
        tech  = data.raw["technology"][i]
        data.raw["technology"][i] = nil
    end
end

-- Clear all nutrient recipes from nutrient technologies and data prototypes
-- Used primarily to allow for a rebuild based on other mods that might use the tastiness field
function baketorio.clear_nutrient_recipes(max_level)
    -- Remove recipe unlocks from nutrient technologies for clean slate
    for i=1,max_level,1 do
        data.raw["technology"]["nutrient" .. tostring(i)].effects = {}
    end

    -- Remove all old nutrient recipes
    for k, recipe in ipairs(data.raw["recipe"]) do
        if recipe.subgroup == "nutrients" then
            data.raw["recipe"][k] = nil
        end
    end
end

-- baketorio.getNutrientListFromData()
baketorio.verify_nutrient_table(nutrient_tech_table_lookup)
baketorio.build_nutrient_items(nutrient_tech_table_lookup)
baketorio.build_nutrient_techs(nutrient_tech_table_lookup)
baketorio.build_nutrient_recipes(nutrient_tech_table_lookup)
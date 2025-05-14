local getIcons = function(main,sub)
    if(sub ~= nil) then
        return {
            {
                icon = main,
                icon_size = 32
            },
            {
                icon = sub,
                icon_size = 32
            }
        }
    else
        return {
            {
                icon = main,
                icon_size = 32
            }
        }
    end
end

local DOUGH_ICON = "__baketorio__/graphics/dough.png"
local BREAD_ICON = "__baketorio__/graphics/bread.png"

local doughs =
{
    {
        type = "item",
        name = "basic-dough",
        prefix = "basic",
        main_icon = DOUGH_ICON,
        sub_icon = nil,
        tastiness = 2;
        not_edible=true,
        salt_mod = 1;
        icon_size = 32,
        subgroup = "ingredient",
        stack_size = 100,
        ingredients = {
            {type="item", name="flour", amount=2},
            {type="fluid", name="water", amount=5}
        }

    },
    {
        type = "item",
        name = "egg-dough",
        prefix = "egg",
        main_icon = DOUGH_ICON,
        sub_icon = "__baketorio__/graphics/egg-sub.png",
        tastiness = 4;
        not_edible=true,
        icon_size = 32,
        subgroup = "ingredient",
        stack_size = 100,
        ingredients = {
            {type="item", name="flour", amount=2},
            {type="item", name="egg", amount=1},
            {type="fluid", name="water", amount=5}
        }
    },
    {
        type = "item",
        name = "sugar-dough",
        prefix = "sugar",
        main_icon = DOUGH_ICON,
        sub_icon = "__baketorio__/graphics/sugar-sub.png",
        tastiness = 3;
        not_edible=true,
        icon_size = 32,
        subgroup = "ingredient",
        stack_size = 100,
        ingredients = {
            {type="item", name="flour", amount=2},
            {type="item", name="sugar", amount=1},
            {type="fluid", name="water", amount=5}
        }
    },
    {
        type = "item",
        name = "cinnamon-dough",
        prefix = "cinnamon",
        main_icon = DOUGH_ICON,
        sub_icon = "__baketorio__/graphics/cinnamon-sugar-sub.png",
        tastiness = 6;
        not_edible=true,
        salt_mod = 1;
        icon_size = 32,
        subgroup = "ingredient",
        stack_size = 100,
        ingredients = {
            {type="item", name="cinnamon-sugar", amount=1},
            {type="item", name="flour", amount=2},
            {type="fluid", name="water", amount=5}
        }

    },
}

local dataToAdd = {}

for key,value in pairs(doughs) do
    value.icons = getIcons(DOUGH_ICON,value.sub_icon)
    local dough_recipe = {
        type="recipe",
        name= (value.name .. "-recipe"),
        localised_name = {"item-name." .. value.name},
        category = "crafting-with-fluid",
        subgroup = "ingredient",
        energy_required = 1,
        enabled = false,
        ingredients = value.ingredients,
        results = {
            {type="item", name=value.name, amount=1}
        },
        icons = getIcons(DOUGH_ICON,value.sub_icon)

    }
    local item = {
        type = "capsule",
        capsule_action=baketorio.capsule_action(0),
        name=(value.prefix .. "-bread"),
        subgroup = "bread",
        tastiness = value.tastiness,
        salt_mod = value.salt_mod,
        stack_size = 100,
        icons = getIcons(BREAD_ICON,value.sub_icon)

    }
    local bread_recipe = {
        type="recipe",
        name= (item.name .. "-recipe"),
        localised_name = {"item-name." .. item.name},
        category = "smelting",
        subgroup = "bread",
        energy_required = 2,
        enabled = false,
        ingredients = {
            {type="item", name=value.name, amount=1}
        },
        results = {
            {type="item", name=item.name, amount=1}
        },
        icons = getIcons(BREAD_ICON,value.sub_icon)
    }
    dataToAdd[#dataToAdd+1] = bread_recipe;
    dataToAdd[#dataToAdd+1] = dough_recipe;
    dataToAdd[#dataToAdd+1] = item;

	baketorio.add_to_prod_mod(bread_recipe.name);
	baketorio.add_to_prod_mod(dough_recipe.name);
end

data:extend(dataToAdd)
data:extend(doughs)





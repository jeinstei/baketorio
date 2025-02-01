function get_png(name)
    return "__baketorio__/graphics/"..name..".png"
end

local batter = {
    {
        type = "item",
        name = "basic-batter",
        icon = get_png("cakebatter"),
        icon_size = 32,
        subgroup = "basic",
        stack_size = 100,
        ingredients = {
            {type="item", name="flour", amount=3},
            {type="fluid", name="milk", amount=5},
            {type="item", name="butter", amount=1},
            {type="item", name="egg", amount=1},
            {type="item", name="sugar", amount=1}
        }
    },
    {
        type = "item",
        name = "chocolate-batter",
        icon = get_png("chocolate-batter"),
        icon_size = 32,
        subgroup = "chocolate",
        stack_size = 100,
        ingredients = {
            {type="item", name="basic-batter", amount=1},
            {type="item", name="cocoa-powder", amount=2},
        }
    },
    {
        type = "item",
        name = "fryer-dough",
        icon = get_png("fryer-dough"),
        icon_size = 32,
        subgroup = "bread",
        stack_size = 100,
        ingredients = {
            {type="item", name="flour", amount=3},
            {type="fluid", name="milk", amount=5},
            {type="item", name="butter", amount=1},
            {type="item", name="salt", amount=1}
        }
    },
    {
        type = "item",
        name = "cheese-batter",
        icon = get_png("cheese-batter"),
        icon_size = 32,
        subgroup = "milk",
        stack_size = 100,
        ingredients = {
            {type="item", name="basic-batter", amount=1},
            {type="item", name="cheese", amount=3},
        }
    },
    {
        type = "item",
        name = "blueberry-batter",
        icon = get_png("blueberry-batter"),
        icon_size = 32,
        subgroup = "fruit",
        stack_size = 100,
        ingredients = {
            {type="item", name="basic-batter", amount=1},
            {type="item", name="blueberries", amount=1},
        }
    },
    {
        type = "item",
        name = "advanced-cake-batter",
        icon = get_png("advanced-cake-batter"),
        icon_size = 32,
        subgroup = "advanced",
        stack_size = 100,
        ingredients = {
            {type="item", name="basic-batter", amount=1},
            {type="item", name="baking-soda", amount=1},
            {type="item", name="salt", amount=2},
            {type="item", name="strawberries", amount=1},
        }
    }
}

-- Add batter recipes
for key,value in pairs(batter) do
    -- Adding manually to get proper subgroups and still have a local batter table for reference
    data:extend ({
        {
            type = value.type,
            name = value.name,
            icon = value.icon,
            icon_size = value.icon_size,
            subgroup = "ingredient",
            stack_size = value.stack_size,
            ingredients = value.ingredients
        },
        {
            type="recipe",
            name= (value.name .. "-recipe"),
            localised_name = {"item-name." .. value.name},
            category = "crafting-with-fluid",
            subgroup = "ingredient",
            energy_required = 1,
            enabled = false,
            ingredients = value.ingredients,
            results = {
                {type="item", name=value.name, amount=1},
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
        name="cake",
        batter="basic-batter",
        tastiness=5,
        frosted_mod=1,
        batter_amount=1,
        result=1,
    },
    {
        name="cupcake",
        batter="basic-batter",
        tastiness=5,
        frosted_mod=1,
        batter_amount=1,
        result=1,
    },
    {
        name="doughnut",
        batter="fryer-dough",
        tastiness=4,
        frosted_mod=1,
        batter_amount=1,
        result=1,
    },
    {
        name="doughnut",
        batter="chocolate-batter",
        tastiness=6,
        frosted_mod=1,
        batter_amount=2,
        result=3,
    },
    {
        name="cake",
        batter="chocolate-batter",
        tastiness=7,
        frosted_mod=1,
        batter_amount=1,
        result=1,
    },
    {
        name="cupcake",
        batter="chocolate-batter",
        tastiness=7,
        frosted_mod=1,
        batter_amount=1,
        result=1,
    },
    {
        name="cake",
        batter="cheese-batter",
        tastiness=6,
        batter_amount=1,
        result=1,
    },
    {
        name="bun",
        batter="fryer-dough",
        tastiness=8,
        frosted_mod=2,
        topping = "cinnamon-sugar",
        batter_amount=1,
        result=1,
    },
    {
        name="scone",
        batter="blueberry-batter",
        tastiness=9,
        frosted_mod=1,
        batter_amount=1,
        result=2,
    },
    {
        name="doughnut",
        batter="blueberry-batter",
        tastiness=11,
        batter_amount=1,
        result=1,
    },
    {
        name="muffin",
        batter="blueberry-batter",
        tastiness=11,
        batter_amount=1,
        result=1,
    },
    {
        name="cupcake",
        batter="advanced-cake-batter",
        tastiness=13,
        frosted_mod=1,
        batter_amount=1,
        result=1,
    },
    {
        name="cake",
        batter="advanced-cake-batter",
        tastiness=13,
        frosted_mod=1,
        batter_amount=1,
        result=1,
    },
}

local dataToAdd = {}

for key,shape in pairs(shapes) do
    local b = nil
    for _,value in pairs(batter) do
        if value.name == shape.batter then
            b = value
            break
        end

    end

    if b == nil then
        log("Shape requested non-existent batter: " .. shape.batter)
    end

    local uncooked_shape = {
        type="item",
        name=b.name .. "-" .. shape.name,
        subgroup = "ingredient",
        enabled = false,
        stack_size = 100,
        icon = get_png(b.name .. "-" .. shape.name);
        icon_size = 32;
    }
    local uncooked_shape_recipe = {
        type="recipe",
        name= (uncooked_shape.name .. "-recipe"),
        localised_name = {"item-name." .. uncooked_shape.name},
        category = "crafting",
        subgroup = "ingredient",
        energy_required = 2,
        enabled = false,
        allow_productivity = true,
        ingredients = {
            {type="item", name=b.name, amount=shape.batter_amount},
        },
        results = {
            {type="item", name=uncooked_shape.name, amount=shape.result},
        },
        icon = uncooked_shape.icon;
        icon_size = 32;

    }
    if(shape.topping ~= nil) then
        uncooked_shape_recipe.ingredients[2] = {type="item", name=shape.topping,amount=1};
    end

    local cooked_shape = {
        type = "capsule",
        capsule_action=capsule_action(0),
        name=b.name .. "-" .. shape.name .. "-cooked",
        subgroup = b.subgroup,
        enabled = false,
        tastiness = shape.tastiness,
        stack_size = 100,
        icon = get_png(b.name .. "-" .. shape.name .. "-cooked");
        icon_size = 32;
    }
    local cooked_shape_recipe = {
        type="recipe",
        name= cooked_shape.name .. "-recipe",
        localised_name = {"item-name." .. cooked_shape.name},
        category = "smelting",
        subgroup = b.subgroup,
        energy_required = 10,
        enabled = false,
        allow_productivity = true,
        ingredients = {
            {type="item", name=uncooked_shape.name, amount=1}
        },
        results = {
            {type="item", name=cooked_shape.name, amount=shape.result}
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

	baketorio_add_to_prod_mod(uncooked_shape_recipe.name)
	baketorio_add_to_prod_mod(cooked_shape_recipe.name)

    if(shape.frosted_mod ~= nil) then
        local cooked_shape_frosted = {
            type = "capsule",
            capsule_action=capsule_action(0),
            name=b.name .. "-" .. shape.name .. "-cooked-frosted",
            subgroup = b.subgroup,
            tastiness = shape.tastiness + shape.frosted_mod,
            stack_size = 100,
            cant_mix_with=cooked_shape.name,
            icon = get_png(b.name .. "-" .. shape.name .. "-cooked-frosted");
            icon_size = 32;
        }
        local cooked_shape_frosted_recipe = {
            type="recipe",
            name= cooked_shape_frosted.name .. "-recipe",
            localised_name = {"item-name." .. cooked_shape_frosted.name},
            category = "crafting",
            subgroup = b.subgroup,
            energy_required = 2,
            enabled = false,
            allow_productivity = true,
            ingredients = {
                {type="item", name=cooked_shape.name, amount=1},
                {type="item", name="frosting", amount=1},
            },
            results = {
                {type="item", name=cooked_shape_frosted.name, amount=1},
            },
            icon = cooked_shape_frosted.icon;
            icon_size = 32;
        }
        data:extend({
            cooked_shape_frosted,
            cooked_shape_frosted_recipe
        })
		baketorio_add_to_prod_mod(cooked_shape_frosted_recipe.name)
    end
end

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
            {"flour", 3},
            {type="fluid", name="milk", amount=5},
            {"butter",1},
            {"egg",1},
            {"sugar",1}
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
            {"basic-batter",1},
            {"cocoa-powder",2},
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
            {"flour", 3},
            {type="fluid", name="milk", amount=5},
            {"butter",1},
            {"salt",1}
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
            {"basic-batter",1},
            {"cheese",3},
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
            {"basic-batter",1},
            {"blueberries",1},
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
            {"basic-batter",1},
            {"baking-soda",1},
            {"salt",2},
            {"strawberries",1},
        }
    }
}

data:extend(batter);

for key,value in pairs(batter) do
    data:extend {
        {
            type="recipe",
            name= (value.name .. "-recipe"),
            category = "crafting-with-fluid",
            subgroup = value.subgroup,
            energy_required = 1,
            enabled = "false",
            ingredients = value.ingredients,
            result = value.name,
            icon = value.icon,
            icon_size = 32
        }
    }

end

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
    local b = data.raw["item"][shape.batter];
    local uncooked_shape = {
        type="item",
        name=b.name .. "-" .. shape.name,
        subgroup = b.subgroup,
        energy_required = 2,
        enabled = "false",
        stack_size = 100,
        result = shape.name,
        icon = get_png(b.name .. "-" .. shape.name);
        icon_size = 32;
    }
    local uncooked_shape_recipe = {
        type="recipe",
        name= (uncooked_shape.name .. "-recipe"),
        category = "crafting",
        subgroup = b.subgroup,
        energy_required = 2,
        enabled = "false",
        ingredients = {
            {
                name=b.name,
                amount=shape.batter_amount
            }
        },
        result = uncooked_shape.name,
        result_count = shape.result,
        icon = uncooked_shape.icon;
        icon_size = 32;
        
    }
    if(shape.topping ~= nil) then
        uncooked_shape_recipe.ingredients[2] = {name=shape.topping,amount=1};
    end

    local cooked_shape = {
        type="item",
        name=b.name .. "-" .. shape.name .. "-cooked",
        subgroup = b.subgroup,
        energy_required = 10,
        enabled = "false",
        tastiness = shape.tastiness,
        stack_size = 100,
        result = shape.name,
        icon = get_png(b.name .. "-" .. shape.name .. "-cooked");
        icon_size = 32;
    }
    local cooked_shape_recipe = {
        type="recipe",
        name= cooked_shape.name .. "-recipe",
        category = "smelting",
        subgroup = b.subgroup,
        energy_required = 10,
        enabled = "false",
        ingredients = {
            {uncooked_shape.name,1}
        },
        result = cooked_shape.name,
        icon = cooked_shape.icon;
        icon_size = 32;
    }
    data:extend({
        uncooked_shape,
        uncooked_shape_recipe,
        cooked_shape,
        cooked_shape_recipe
    })
    if(shape.frosted_mod ~= nil) then
        local cooked_shape_frosted = {
            type="item",
            name=b.name .. "-" .. shape.name .. "-cooked-frosted",
            subgroup = b.subgroup,
            energy_required = 2,
            enabled = "false",
            tastiness = shape.tastiness + shape.frosted_mod,
            stack_size = 100,
            cant_mix_with=cooked_shape.name,
            result = shape.name,
            icon = get_png(b.name .. "-" .. shape.name .. "-cooked-frosted");
            icon_size = 32;
        }
        local cooked_shape_frosted_recipe = {
            type="recipe",
            name= cooked_shape_frosted.name .. "-recipe",
            category = "crafting",
            subgroup = b.subgroup,
            energy_required = 2,
            enabled = "false",
            ingredients = {
                {cooked_shape.name,1},
                {"frosting",1},
            },
            result = cooked_shape_frosted.name,
            icon = cooked_shape_frosted.icon;
            icon_size = 32;
        }
        data:extend({
            cooked_shape_frosted,
            cooked_shape_frosted_recipe
        })
    end
end
data:extend(
{
    {
        type="recipe-category",
        name="greenhouse-recipes"
    },
    {
        type="recipe-category",
        name="organic-synth-recipes"
    },
    {
        type="item-subgroup",
        name="nutrients",
        group="nutrients"
    },
    {
        type="item-subgroup",
        name="food",
        group="food"
    },
    {
        type="item-subgroup",
        name="milk",
        order="e",
        group="food"
    },
    {
        type="item-subgroup",
        name="seeds",
        order="a",
        group="food"
    },
    {
        type="item-subgroup",
        name="bread",
        order="c",
        group="food"
    },
    {
        type="item-subgroup",
        name="basic",
        order="d",
        group="food"
    },
    {
        type="item-subgroup",
        name="mod",
        order="h",
        group="food"
    },
    {
        type="item-subgroup",
        name="chocolate",
        order="f",
        group="food"
    },
    {
        type="item-subgroup",
        name="fruit",
        order="g",
        group="food"
    },
    {
        type="item-subgroup",
        name="ingredient",
        order="b",
        group="food"
    },
    {
        type="item-subgroup",
        name="advanced",
        order="h",
        group="food"
    },
    {
        type="item-group",
        name="nutrients",
        order="zzz",
        icon="__baketorio__/graphics/nutrient1.png",
        icon_size=32
    },
    {
        type="item-group",
        name="food",
        order="zz",
        icon="__baketorio__/graphics/basic-batter-cake-cooked-frosted.png",
        icon_size=32
    },
    {
        type = "recipe",
        name = "automation-science-pack-hardtack",
        energy_required = 1,
        category = "crafting",
        enabled = true,
        ingredients =
        {
          {type="item", name="salted-hardtack", amount=5}
        },
        results = {
            {type="item", name="automation-science-pack", amount=1}
        }
    }
})

data.raw["recipe"]["automation-science-pack"].ingredients =
{
    {type="item", name="basic-bread", amount=2}
}

data.raw["recipe"]["logistic-science-pack"].ingredients =
{
    {type="item", name="basic-batter-cupcake-cooked-frosted",amount= 2},
    {type="item", name="basic-batter-cake-cooked-frosted", amount=2}
}
data.raw["recipe"]["military-science-pack"].ingredients =
{
    {type="item", name="salted-hardtack",amount= 50},
}
data.raw["recipe"]["chemical-science-pack"].ingredients =
{
    {type="item", name="brownie", amount=3},
    {type="item", name="cheese-batter-cake-cooked", amount=2},
    {type="item", name="fryer-dough-doughnut-cooked-frosted", amount=5},
}

data.raw["recipe"]["utility-science-pack"].ingredients =
{
    {type="item", name="blueberry-batter-muffin-cooked", amount=2},
    {type="item", name="fryer-dough-bun-cooked-frosted", amount=1},
    {type="item", name="blueberry-batter-scone-cooked", amount=5},
}

data.raw["recipe"]["production-science-pack"].ingredients =
{
    {type="item", name="blueberry-pie-cooked", amount=1},
    {type="item", name="brownies-with-ice-cream", amount=2},
    {type="item", name="advanced-cake-batter-cake-cooked-frosted", amount=1},
    {type="item", name="chocolate-chip-cookie", amount=8},
}

data.raw["recipe"]["rocket-part"].ingredients =
{
    {type="item", name="nutrient6", amount=10},
}

data.raw["recipe"]["chemical-plant"].enabled = true;




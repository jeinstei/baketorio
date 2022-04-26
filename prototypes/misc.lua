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
        icon_size="32"
    },
    {
        type="item-group",
        name="food",
        order="zz",
        icon="__baketorio__/graphics/basic-batter-cake-cooked-frosted.png",
        icon_size="32"
    },
    {
        type = "recipe",
        name = "automation-science-pack-hardtack",
        energy_required = 1,
        category = "crafting",
        enabled = true,
        ingredients =
        {
          {"salted-hardtack", 5}
        },
        result_count = 1,
        result = "automation-science-pack"
    }
})

data.raw["recipe"]["automation-science-pack"].ingredients =
{
    {"basic-bread", 2}
}

data.raw["recipe"]["logistic-science-pack"].ingredients =
{
    {"basic-batter-cupcake-cooked-frosted", 2},
    {"basic-batter-cake-cooked-frosted", 2}
}
data.raw["recipe"]["military-science-pack"].ingredients =
{
    {"salted-hardtack", 50},
}
data.raw["recipe"]["chemical-science-pack"].ingredients =
{
    {"brownie", 3},
    {"cheese-batter-cake-cooked", 2},
    {"fryer-dough-doughnut-cooked-frosted", 5},
}

data.raw["recipe"]["utility-science-pack"].ingredients =
{
    {"blueberry-batter-muffin-cooked", 2},
    {"fryer-dough-bun-cooked-frosted", 1},
    {"blueberry-batter-scone-cooked", 5},
}

data.raw["recipe"]["production-science-pack"].ingredients =
{
    {"blueberry-pie-cooked", 1},
    {"brownies-with-ice-cream", 2},
    {"advanced-cake-batter-cake-cooked-frosted", 1},
    {"chocolate-chip-cookie", 8},
}

data.raw["recipe"]["rocket-part"].ingredients =
{
    {"nutrient6", 10},
}

data.raw["recipe"]["chemical-plant"].enabled = true;




data:extend {
  {
    type = "technology",
    name = "leavening",
    icon_size = 128,
    icon = "__baketorio__/graphics/bread_tech.png",
    prerequisites = {"automation"},
    effects =
    {
      {type = "unlock-recipe",recipe = "basic-dough"},
      {type = "unlock-recipe",recipe = "basic-bread"},
    },
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
    name = "sugar",
    icon_size = 128,
    icon = "__baketorio__/graphics/sugar_tech.png",
    prerequisites = {"leavening"},
    effects =
    {
      {type = "unlock-recipe",recipe = "sugarcane"},
      {type = "unlock-recipe",recipe = "sugarcane-seeds"},
      {type = "unlock-recipe",recipe = "sugar"},
      {type = "unlock-recipe",recipe = "sugar-dough"},
      {type = "unlock-recipe",recipe = "sugar-bread"},
    },
    unit =
    {
      count = 50,
      ingredients = {
        {"automation-science-pack", 1}
      },
      time = 30
    },
  },
  {
    type = "technology",
    name = "baking",
    icon_size = 128,
    icon = "__baketorio__/graphics/baking_tech.png",
    prerequisites = {"animal-husbandry","sugar"},
    effects =
    {
      {type = "unlock-recipe",recipe = "basic-batter"},
      {type = "unlock-recipe",recipe = "basic-batter-cake"},
      {type = "unlock-recipe",recipe = "basic-batter-cake-cooked"},
      {type = "unlock-recipe",recipe = "basic-batter-cake-cooked-frosted"},
      {type = "unlock-recipe",recipe = "basic-batter-cupcake"},
      {type = "unlock-recipe",recipe = "basic-batter-cupcake-cooked"},
      {type = "unlock-recipe",recipe = "basic-batter-cupcake-cooked-frosted"},
    },
    unit =
    {
      count = 100,
      ingredients = {
        {"automation-science-pack", 1}
      },
      time = 30
    },
  },
  {
    type = "technology",
    name = "frying",
    icon_size = 128,
    icon = "__baketorio__/graphics/frying_tech.png",
    prerequisites = {"animal-husbandry"},
    effects =
    {

      {type = "unlock-recipe",recipe = "fryer-dough"},
      {type = "unlock-recipe",recipe = "fryer-dough-doughnut"},
      {type = "unlock-recipe",recipe = "fryer-dough-doughnut-cooked"},
      {type = "unlock-recipe",recipe = "fryer-dough-doughnut-cooked-frosted"},
    },
    unit =
    {
      count = 50,
      ingredients = {
        {"automation-science-pack", 1}
      },
      time = 30
    },
  },
  {
    type = "technology",
    name = "animal-husbandry",
    icon_size = 128,
    icon = "__baketorio__/graphics/animal_husbandry.png",
    prerequisites = {"nutrient2"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "chemical-plant"
      },
      {
        type = "unlock-recipe",
        recipe = "egg"
      },
      {
        type = "unlock-recipe",
        recipe = "chicken"
      },
      {
        type = "unlock-recipe",
        recipe = "chicken-recipe-egg"
      },
      {
        type = "unlock-recipe",
        recipe = "cow"
      },
      {
        type = "unlock-recipe",
        recipe = "u-milk"
      },
      {
        type = "unlock-recipe",
        recipe = "milk-pasteurization"
      },
      {
        type = "unlock-recipe",
        recipe = "milk-filtering"
      },
      {
        type = "unlock-recipe",
        recipe = "frosting"
      },
      {
        type = "unlock-recipe",
        recipe = "butter-churning"
      },
      {
        type = "unlock-recipe",
        recipe = "butter-solidification"
      },
      {
        type = "unlock-recipe",
        recipe = "breed-cow"
      },
      {type = "unlock-recipe",recipe = "egg-dough"},
      {type = "unlock-recipe",recipe = "egg-bread"},

    },
    unit =
    {
      count = 80,
      ingredients = {
        {"automation-science-pack", 1}
      },
      time = 30
    },
  },
  {
    type = "technology",
    name = "cocoa",
    icon_size = 128,
    icon = "__baketorio__/graphics/cocoa.png",
    prerequisites = {"nutrient4"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "cocoa-bean-seeds"
      },
      {
        type = "unlock-recipe",
        recipe = "cocoa-beans"
      },
      {
        type = "unlock-recipe",
        recipe = "cocoa-powder"
      },
      {type = "unlock-recipe",recipe = "chocolate-batter"},
      {type = "unlock-recipe",recipe = "chocolate-batter-cake"},
      {type = "unlock-recipe",recipe = "chocolate-batter-cake-cooked"},
      {type = "unlock-recipe",recipe = "chocolate-batter-cake-cooked-frosted"},
      {type = "unlock-recipe",recipe = "chocolate-batter-cupcake"},
      {type = "unlock-recipe",recipe = "chocolate-batter-cupcake-cooked"},
      {type = "unlock-recipe",recipe = "chocolate-batter-cupcake-cooked-frosted"},
      {type = "unlock-recipe",recipe = "chocolate-batter-doughnut"},
      {type = "unlock-recipe",recipe = "chocolate-batter-doughnut-cooked"},
      {type = "unlock-recipe",recipe = "chocolate-batter-doughnut-cooked-frosted"},
      {type = "unlock-recipe",recipe = "brownie"},
    },
    unit =
    {
      count = 200,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
  },
  {
    type = "technology",
    name = "cheese",
    icon_size = 128,
    icon = "__baketorio__/graphics/cheese_tech.png",
    prerequisites = {"logistic-science-pack"},
    effects =
    {
      {type = "unlock-recipe",recipe = "cheese"},
      {type = "unlock-recipe",recipe = "cheese-batter"},
      {type = "unlock-recipe",recipe = "cheese-batter-cake"},
      {type = "unlock-recipe",recipe = "cheese-batter-cake-cooked"},
    },
    unit =
    {
      count = 100,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      },
      time = 30
    },
  },
  {
    type = "technology",
    name = "cinnamon",
    icon_size = 128,
    icon = "__baketorio__/graphics/cinnamon_tech.png",
    prerequisites = {"chemical-science-pack"},
    effects =
    {
      {type = "unlock-recipe",recipe = "cinnamon"},
      {type = "unlock-recipe",recipe = "cinnamon-seeds"},
      {type = "unlock-recipe",recipe = "cinnamon-sugar"},
      {type = "unlock-recipe",recipe = "fryer-dough-bun"},
      {type = "unlock-recipe",recipe = "fryer-dough-bun-cooked"},
      {type = "unlock-recipe",recipe = "fryer-dough-bun-cooked-frosted"},
      {type = "unlock-recipe",recipe = "cinnamon-dough"},
      {type = "unlock-recipe",recipe = "cinnamon-bread"},
      {type = "unlock-recipe",recipe = "cinnamon-sugar-doughnut"},
    },
    unit =
    {
      count = 300,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}},
      time = 30
    },
  },
  {
    type = "technology",
    name = "blueberries",
    icon_size = 128,
    icon = "__baketorio__/graphics/blueberries_tech.png",
    prerequisites = {"nutrient5"},
    effects =
    {
      {type = "unlock-recipe",recipe = "blueberries"},
      {type = "unlock-recipe",recipe = "blueberry-seeds"},
      {type = "unlock-recipe",recipe = "blueberry-batter"},
      {type = "unlock-recipe",recipe = "blueberry-batter-doughnut"},
      {type = "unlock-recipe",recipe = "blueberry-batter-doughnut-cooked"},
      {type = "unlock-recipe",recipe = "blueberry-batter-scone"},
      {type = "unlock-recipe",recipe = "blueberry-batter-scone-cooked"},
      {type = "unlock-recipe",recipe = "blueberry-batter-scone-cooked-frosted"},
      {type = "unlock-recipe",recipe = "blueberry-batter-muffin"},
      {type = "unlock-recipe",recipe = "blueberry-batter-muffin-cooked"},
    },
    unit =
    {
      count = 500,
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
    name = "strawberries",
    icon_size = 128,
    icon = "__baketorio__/graphics/strawberries_tech.png",
    prerequisites = {"utility-science-pack"},
    effects =
    {
      {type = "unlock-recipe",recipe = "strawberries"},
      {type = "unlock-recipe",recipe = "strawberry-seeds"},
    },
    unit =
    {
      count = 500,
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
    name = "chocolate-chips",
    icon_size = 128,
    icon = "__baketorio__/graphics/choc_tech.png",
    prerequisites = {"utility-science-pack"},
    effects =
    {
      {type = "unlock-recipe",recipe = "chocolate-chip-batter"},
      {type = "unlock-recipe",recipe = "chocolate-chip-cookie"},
    },
    unit =
    {
      count = 300,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 30
    },
  },
  {
    type = "technology",
    name = "advanced-baking",
    icon_size = 128,
    icon = "__baketorio__/graphics/trona_tech.png",
    prerequisites = {"utility-science-pack","strawberries","oil-processing"},
    effects =
    {
      {type = "unlock-recipe",recipe = "soda-ash"},
      {type = "unlock-recipe",recipe = "baking-soda"},
      {type = "unlock-recipe",recipe = "advanced-cake-batter"},
      {type = "unlock-recipe",recipe = "advanced-cake-batter-cake"},
      {type = "unlock-recipe",recipe = "advanced-cake-batter-cake-cooked"},
      {type = "unlock-recipe",recipe = "advanced-cake-batter-cake-cooked-frosted"},
      {type = "unlock-recipe",recipe = "advanced-cake-batter-cupcake"},
      {type = "unlock-recipe",recipe = "advanced-cake-batter-cupcake-cooked"},
      {type = "unlock-recipe",recipe = "advanced-cake-batter-cupcake-cooked-frosted"},
    },
    unit =
    {
      count = 800,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 30
    },
  },
  {
    type = "technology",
    name = "ice-cream",
    icon_size = 128,
    icon = "__baketorio__/graphics/ice_cream_tech.png",
    prerequisites = {"utility-science-pack"},
    effects =
    {
      {type = "unlock-recipe",recipe = "plain-ice-cream"},
      {type = "unlock-recipe",recipe = "brownies-with-ice-cream"},
    },
    unit =
    {
      count = 800,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 30
    },
  },
  {
    type = "technology",
    name = "pie",
    icon_size = 128,
    icon = "__baketorio__/graphics/pie_tech.png",
    prerequisites = {"strawberries"},
    effects =
    {
      {type = "unlock-recipe",recipe = "blueberry-pie"},
      {type = "unlock-recipe",recipe = "strawberry-pie"},
      {type = "unlock-recipe",recipe = "blueberry-pie-cooked"},
      {type = "unlock-recipe",recipe = "strawberry-pie-cooked"},
    },
    unit =
    {
      count = 500,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 30
    },
  },
}

-- Adding alternative recipe unlock
table.insert(data.raw.technology["automation-science-pack"].effects, {type="unlock-recipe", recipe="automation-science-pack-hardtack"})

local baking_science = data.raw.technology["logistic-science-pack"];
baking_science.prerequisites = {"baking"};

local flavour_science = data.raw.technology["chemical-science-pack"];
flavour_science.prerequisites = {"cocoa","frying","cheese"};

local utility_science = data.raw.technology["utility-science-pack"];
utility_science.prerequisites = {"cinnamon","blueberries"};

local p_science = data.raw.technology["production-science-pack"];
p_science.prerequisites = {"advanced-baking","pie","chocolate-chips","ice-cream"};

local r = data.raw.technology["rocket-silo"];
table.insert(r.prerequisites,"nutrient6");
data:extend {
  {
    type = "technology",
    name = "leavening",
    icon_size = 128,
    icon = "__baketorio__/graphics/bread_tech.png",
    prerequisites = {"automation"},
    effects =
    {
      {type = "unlock-recipe",recipe = "basic-dough-recipe"},
      {type = "unlock-recipe",recipe = "basic-bread-recipe"},
    },
    unit =
    {
      count = 10,
      ingredients = {{"automation-science-pack", 1}},
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
      {type = "unlock-recipe",recipe = "sugarcane-recipe"},
      {type = "unlock-recipe",recipe = "sugarcane-seeds"},
      {type = "unlock-recipe",recipe = "sugar-recipe"},
      {type = "unlock-recipe",recipe = "sugar-dough-recipe"},
      {type = "unlock-recipe",recipe = "sugar-bread-recipe"},
    },
    unit =
    {
      count = 50,
      ingredients = {{"automation-science-pack", 1}},
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
      {type = "unlock-recipe",recipe = "basic-batter-recipe"},
      {type = "unlock-recipe",recipe = "basic-batter-cake-recipe"},
      {type = "unlock-recipe",recipe = "basic-batter-cake-cooked-recipe"},
      {type = "unlock-recipe",recipe = "basic-batter-cake-cooked-frosted-recipe"},
      {type = "unlock-recipe",recipe = "basic-batter-cupcake-recipe"},
      {type = "unlock-recipe",recipe = "basic-batter-cupcake-cooked-recipe"},
      {type = "unlock-recipe",recipe = "basic-batter-cupcake-cooked-frosted-recipe"},
    },
    unit =
    {
      count = 100,
      ingredients = {{"automation-science-pack", 1}},
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
      
      {type = "unlock-recipe",recipe = "fryer-dough-recipe"},
      {type = "unlock-recipe",recipe = "fryer-dough-doughnut-recipe"},
      {type = "unlock-recipe",recipe = "fryer-dough-doughnut-cooked-recipe"},
      {type = "unlock-recipe",recipe = "fryer-dough-doughnut-cooked-frosted-recipe"},
    },
    unit =
    {
      count = 50,
      ingredients = {{"automation-science-pack", 1}},
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
        recipe = "egg-recipe"
      },
      {
        type = "unlock-recipe",
        recipe = "chicken-recipe"
      },
      {
        type = "unlock-recipe",
        recipe = "chicken-recipe-egg"
      },
      {
        type = "unlock-recipe",
        recipe = "cow-recipe"
      },
      {
        type = "unlock-recipe",
        recipe = "u-milk-recipe"
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
        recipe = "frosting-recipe"
      },
      {
        type = "unlock-recipe",
        recipe = "butter-churning"
      },
      {
        type = "unlock-recipe",
        recipe = "butter-solification"
      },
      {
        type = "unlock-recipe",
        recipe = "breed-cow-recipe"
      },
      {type = "unlock-recipe",recipe = "egg-dough-recipe"},
      {type = "unlock-recipe",recipe = "egg-bread-recipe"},

    },
    unit =
    {
      count = 80,
      ingredients = {{"automation-science-pack", 1}},
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
        recipe = "cocoa-beans-recipe"
      },
      {
        type = "unlock-recipe",
        recipe = "cocoa-powder-recipe"
      },
      {type = "unlock-recipe",recipe = "chocolate-batter-recipe"},
      {type = "unlock-recipe",recipe = "chocolate-batter-cake-recipe"},
      {type = "unlock-recipe",recipe = "chocolate-batter-cake-cooked-recipe"},
      {type = "unlock-recipe",recipe = "chocolate-batter-cake-cooked-frosted-recipe"},
      {type = "unlock-recipe",recipe = "chocolate-batter-cupcake-recipe"},
      {type = "unlock-recipe",recipe = "chocolate-batter-cupcake-cooked-recipe"},
      {type = "unlock-recipe",recipe = "chocolate-batter-cupcake-cooked-frosted-recipe"},
      {type = "unlock-recipe",recipe = "chocolate-batter-doughnut-recipe"},
      {type = "unlock-recipe",recipe = "chocolate-batter-doughnut-cooked-recipe"},
      {type = "unlock-recipe",recipe = "chocolate-batter-doughnut-cooked-frosted-recipe"},
      {type = "unlock-recipe",recipe = "brownie-recipe"},
    },
    unit =
    {
      count = 200,
      ingredients = {{"automation-science-pack", 1},{"logistic-science-pack",1}},
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
      {type = "unlock-recipe",recipe = "cheese-recipe"},
      {type = "unlock-recipe",recipe = "cheese-batter-recipe"},
      {type = "unlock-recipe",recipe = "cheese-batter-cake-recipe"},
      {type = "unlock-recipe",recipe = "cheese-batter-cake-cooked-recipe"},
    },
    unit =
    {
      count = 100,
      ingredients = {{"automation-science-pack", 1},{"logistic-science-pack",1}},
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
      {type = "unlock-recipe",recipe = "cinnamon-recipe"},
      {type = "unlock-recipe",recipe = "cinnamon-seeds"},
      {type = "unlock-recipe",recipe = "cinnamon-sugar-recipe"},
      {type = "unlock-recipe",recipe = "fryer-dough-bun-recipe"},
      {type = "unlock-recipe",recipe = "fryer-dough-bun-cooked-recipe"},
      {type = "unlock-recipe",recipe = "fryer-dough-bun-cooked-frosted-recipe"},
      {type = "unlock-recipe",recipe = "cinnamon-dough-recipe"},
      {type = "unlock-recipe",recipe = "cinnamon-bread-recipe"},
      {type = "unlock-recipe",recipe = "cinnamon-sugar-doughnut-recipe"},
    },
    unit =
    {
      count = 300,
      ingredients = {{"automation-science-pack", 1},{"logistic-science-pack",1},{"chemical-science-pack",1}},
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
      {type = "unlock-recipe",recipe = "blueberries-recipe"},
      {type = "unlock-recipe",recipe = "blueberries-seeds"},
      {type = "unlock-recipe",recipe = "blueberry-batter-recipe"},
      {type = "unlock-recipe",recipe = "blueberry-batter-doughnut-recipe"},
      {type = "unlock-recipe",recipe = "blueberry-batter-doughnut-cooked-recipe"},
      {type = "unlock-recipe",recipe = "blueberry-batter-scone-recipe"},
      {type = "unlock-recipe",recipe = "blueberry-batter-scone-cooked-recipe"},
      {type = "unlock-recipe",recipe = "blueberry-batter-scone-cooked-frosted-recipe"},
      {type = "unlock-recipe",recipe = "blueberry-batter-muffin-recipe"},
      {type = "unlock-recipe",recipe = "blueberry-batter-muffin-cooked-recipe"},
    },
    unit =
    {
      count = 500,
      ingredients = {{"automation-science-pack", 1},{"logistic-science-pack",1},{"chemical-science-pack",1}},
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
      {type = "unlock-recipe",recipe = "strawberries-recipe"},
      {type = "unlock-recipe",recipe = "strawberry-seeds"},
    },
    unit =
    {
      count = 500,
      ingredients = {{"automation-science-pack", 1},{"logistic-science-pack",1},{"chemical-science-pack",1}},
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
      {type = "unlock-recipe",recipe = "chocolate-chip-batter-recipe"},
      {type = "unlock-recipe",recipe = "chocolate-chip-cookie-recipe"},
    },
    unit =
    {
      count = 300,
      ingredients = {{"automation-science-pack", 1},{"logistic-science-pack",1},{"chemical-science-pack",1},{"utility-science-pack",1}},
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
      {type = "unlock-recipe",recipe = "advanced-cake-batter-recipe"},
      {type = "unlock-recipe",recipe = "advanced-cake-batter-cake-recipe"},
      {type = "unlock-recipe",recipe = "advanced-cake-batter-cake-cooked-recipe"},
      {type = "unlock-recipe",recipe = "advanced-cake-batter-cake-cooked-frosted-recipe"},
      {type = "unlock-recipe",recipe = "advanced-cake-batter-cupcake-recipe"},
      {type = "unlock-recipe",recipe = "advanced-cake-batter-cupcake-cooked-recipe"},
      {type = "unlock-recipe",recipe = "advanced-cake-batter-cupcake-cooked-frosted-recipe"},
    },
    unit =
    {
      count = 800,
      ingredients = {{"automation-science-pack", 1},{"logistic-science-pack",1},{"chemical-science-pack",1},{"utility-science-pack",1}},
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
      ingredients = {{"automation-science-pack", 1},{"logistic-science-pack",1},{"chemical-science-pack",1},{"utility-science-pack",1}},
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
      {type = "unlock-recipe",recipe = "blueberry-pie-recipe"},
      {type = "unlock-recipe",recipe = "strawberry-pie-recipe"},
      {type = "unlock-recipe",recipe = "blueberry-pie-cooked-recipe"},
      {type = "unlock-recipe",recipe = "strawberry-pie-cooked-recipe"},
    },
    unit =
    {
      count = 500,
      ingredients = {{"automation-science-pack", 1},{"logistic-science-pack",1},{"chemical-science-pack",1},{"utility-science-pack",1}},
      time = 30
    },
  },
}



local baking_science = data.raw.technology["logistic-science-pack"];
baking_science.prerequisites = {"baking"};

local flavour_science = data.raw.technology["chemical-science-pack"];
flavour_science.prerequisites = {"cocoa","frying"};

local utility_science = data.raw.technology["utility-science-pack"];
utility_science.prerequisites = {"cinnamon","blueberries"};

local p_science = data.raw.technology["production-science-pack"];
p_science.prerequisites = {"advanced-baking","pie","chocolate-chips","ice-cream"};

local r = data.raw.technology["rocket-silo"];
table.insert(r.prerequisites,"nutrient6");
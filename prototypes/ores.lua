local resource_autoplace = require("resource-autoplace");

data:extend(
{
	{
	type = "autoplace-control",
	name = "salt",
    richness = true,
    category = "resource",
	localised_name = { "", "[entity=salt] ", { "autoplace-control-names.salt" } },
	},
	{
	type = "resource",
    name = "salt",
    icon_size = 32,
	icon = "__baketorio__/graphics/salt.png",
	flags = {"placeable-neutral"},
	map_color = {r=1.00, g=0.70, b=0.85},
	minable =
	{
	  hardness = 1,
	  mining_particle = "iron-ore-particle",
	  mining_time = 1.5,
	  result = "salt"
	},
	collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
	selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
	autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "salt",
      order = "d",
      base_density = 5,
	  base_spots_per_km2 = 1.0,
	  random_spot_size_minimum = 0.25,
      random_spot_size_maximum = 3,
      has_starting_area_placement = false,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.2,
      candidate_spot_count =22,
    },
	
    stage_counts = {1000, 600, 200, 50},
	stages =
	{
	  sheet =
	  {
		filename = "__baketorio__/graphics/salt-ore.png",
		priority = "extra-high",
        width = 76,
        height = 76,
        frame_count = 4,
        variation_count = 4,
        scale=0.5
	  }
	},
  	},
  	{
  	type = "item",
  	name = "salt",
  	icon = "__baketorio__/graphics/salt.png",
  	subgroup = "raw-material",
  	icon_size = 32;
  	stack_size = 200
  	},
  	{
	type = "autoplace-control",
	name = "trona",
    richness = true,
    category = "resource",
	localised_name = { "", "[entity=trona] ", { "autoplace-control-names.trona" } },
	},
	{
	type = "resource",
    name = "trona",
    icon_size = 32,
	icon = "__baketorio__/graphics/trona.png",
	flags = {"placeable-neutral"},
	map_color = {r=0.4, g=0.12, b=0},
	minable =
	{
	  hardness = 1,
	  mining_particle = "stone-particle",
	  mining_time = 2,
	  result = "trona",
	  required_fluid="crude-oil",
	  fluid_amount=5
	},
	collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
	selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
	autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "trona",
      order = "d",
      base_density = 8,
	  base_spots_per_km2 = 1.0,
	  random_spot_size_minimum = 0.25,
      random_spot_size_maximum = 3,
      has_starting_area_placement = false,
      regular_rq_factor_multiplier = 0.50,
      starting_rq_factor_multiplier = 0.2,
      candidate_spot_count =22,
    },
    stage_counts = {1000, 600, 200, 50},
	stages =
	{
	  sheet =
	  {
		filename = "__baketorio__/graphics/trona-ore.png",
		priority = "extra-high",
        width = 76,
        height = 76,
        frame_count = 4,
        variation_count = 4,
        scale=0.5
	  }
	},
  },
{
    type = "item",
    name = "trona",
    icon = "__baketorio__/graphics/trona.png",
    subgroup = "raw-material",
    icon_size = 32;
    stack_size = 200
}
}
)
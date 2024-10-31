-- Modifications to base assembling machine
local a = {
    type = "assembling-machine",
    name = "assembling-machine-1",
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {0, -1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {0, 1} }},
        secondary_draw_orders = { north = -1 }
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
  }

-- Add fluid boxes and flag to base assembling machine prototype
data.raw["assembling-machine"]["assembling-machine-1"].fluid_boxes = a.fluid_boxes
data.raw["assembling-machine"]["assembling-machine-1"].fluid_boxes_off_when_no_fluid_recipe = true

-- Add fluid recipes to base assembling machine prototype
table.insert(data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories, "crafting-with-fluid")

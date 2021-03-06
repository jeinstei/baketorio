data:extend{
    {
    type = "assembling-machine",
    name = "greenhouse",
    icon = "__baketorio__/graphics/greenhouse-icon.png",
    icon_size = 32,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "greenhouse"},
    max_health = 250,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    crafting_categories = {"greenhouse-recipes"},
    crafting_speed = 1,
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
    },
    energy_usage = "250kW",
    module_specification =
    {
      module_slots = 3
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    animation =
    {
      filename = "__baketorio__/graphics/greenhouse.png",
      width = 208,
      height = 208,
      frame_count = 1,
      scale=0.5,
      shift={0,-0.1}
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }},
        secondary_draw_orders = { north = -1 }
      },
      off_when_no_fluid_recipe = true
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    },
    {
      type = "assembling-machine",
      name = "organic-synthesizer",
      icon = "__baketorio__/graphics/organic-synth-item.png",
      icon_size = 32,
      flags = {"placeable-neutral", "placeable-player", "player-creation"},
      minable = {hardness = 0.2, mining_time = 0.5, result = "organic-synthesizer"},
      max_health = 250,
      corpse = "big-remnants",
      dying_explosion = "medium-explosion",
      crafting_categories = {"organic-synth-recipes"},
      crafting_speed = 1,
      collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
      selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
      energy_source =
      {
        type = "electric",
        usage_priority = "secondary-input",
      },
      energy_usage = "350kW",
      module_specification =
      {
        module_slots = 2
      },
      allowed_effects = {"consumption", "speed", "productivity", "pollution"},
      animation =
      {
        filename = "__baketorio__/graphics/organic-synthesizer.png",
        width = 208,
        height = 284,
        frame_count = 13,
        line_length = 4,
        scale=0.5,
        shift={0,-0.43}
      },
      animation1 =
      {
        filename = "__baketorio__/graphics/greenhouse.png",
        width = 208,
        height = 208,
        frame_count = 1,
        scale=0.5
      },
      open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
      close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
      vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    },
    {
      type = "assembling-machine",
      name = "nutrientizer",
      inventory_size=3,
      icon = "__baketorio__/graphics/organic-synth-item.png",
      icon_size = 32,
      flags = {"placeable-neutral", "placeable-player", "player-creation"},
      minable = {hardness = 0.2, mining_time = 0.5, result = "organic-synthesizer"},
      max_health = 250,
      corpse = "big-remnants",
      dying_explosion = "medium-explosion",
      crafting_categories = {"crafting"},
      crafting_speed = 1,
      collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
      selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
      energy_source =
      {
        type = "electric",
        usage_priority = "secondary-input",
      },
      energy_usage = "350kW",
      module_specification =
      {
        module_slots = 2
      },
      allowed_effects = {"consumption", "speed", "productivity", "pollution"},
      animation =
      {
        filename = "__baketorio__/graphics/organic-synthesizer.png",
        width = 208,
        height = 284,
        frame_count = 13,
        line_length = 4,
        scale=0.5,
        shift={0,-0.43}
      },

      open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
      close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
      vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    }
  }
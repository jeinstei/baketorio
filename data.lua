local sounds = require("__base__.prototypes.entity.sounds")

function capsule_action(health)
    return
    {
      type = "use-on-self",
      attack_parameters =
      {
        type = "projectile",
        activation_type = "consume",
        ammo_category = "capsule",
        cooldown = 30,
        range = 0,
        ammo_type =
        {
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                {
                  type = "damage",
                  damage = {type = "physical", amount = -health},
                  use_substitute = false
                },
                {
                  type = "play-sound",
                  sound = sounds.eat_fish
                }
              }
            }
          }
        }
      }
    }
end

-- Build table of productivity modules
local baketorio_prod_mods = {}
for _, v in pairs(data.raw.module) do
  if v.name:find("productivity%-module") and v.limitation then
    table.insert(baketorio_prod_mods, v.limitation)
  end
end

-- Get productivity module tables to add recipes
function baketorio_add_to_prod_mod(name)
  for _, v in pairs(baketorio_prod_mods) do
    table.insert(v,name)
  end
end

food = {};

-- Tips and Tricks note
data:extend({
  {
    type="tips-and-tricks-item-category",
    name="baketorio",
    order="d"
  },
  {
    type="tips-and-tricks-item",
    name="baketorio-nutrient-setting",
    category="baketorio",
    icon="__baketorio__/graphics/nutrient1.png",
    icon_size=32,
    image="__baketorio__/graphics/nutrient-assistant.png",
    trigger={
     type="build-entity",
     entity="assembling-machine-1"
    }
  }
}
)


require("prototypes.fluids")
require("prototypes.fluid-recipes")
require("prototypes.items")
require("prototypes.item-recipes")
-- require("prototypes.modifications")
require("prototypes.entities")
require("prototypes.misc")
require("prototypes.assembler1")
require("prototypes.dough")
require("prototypes.ores")
require("prototypes.plants")
require("prototypes.batter")
require("prototypes.technologies")
require("prototypes.nutrients")

require("prototypes.ordering")
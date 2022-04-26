function capsule_action(health)
    return
    {
      type = "use-on-self",
      attack_parameters =
      {
        type = "projectile",
        ammo_category = "capsule",
        cooldown = 120,
        range = 0,
        ammo_type =
        {
          category = "capsule",
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
                  damage = {type = "physical", amount = -health}
                },
              }
            }
          }
        }
      }
    }
end


food = {};

require("prototypes.fluids")
require("prototypes.fluid-recipes")
require("prototypes.items")
require("prototypes.item-recipes")
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
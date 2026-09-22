local sounds = require("__base__.prototypes.entity.sounds")

baketorio = {}

function baketorio.get_png(name)
    return "__baketorio__/graphics/" .. name .. ".png"
end

function baketorio.capsule_action(health)
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
                                damage = { type = "physical", amount = -health },
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

local nutrient_food_groups = { "basic", "bread", "milk", "chocolate", "fruit", "advanced" }

-- Tips and Tricks note
data:extend({
    {
        type = "tips-and-tricks-item-category",
        name = "baketorio",
        order = "d"
    },
    {
        type = "tips-and-tricks-item",
        name = "baketorio-tips-category",
        category = "baketorio",
        is_title = true,
        icon = "__baketorio__/graphics/advanced-cake-batter-cupcake-cooked.png",
        icon_size = 32,
        order = "baketorio",
        trigger = {
            type = "build-entity",
            entity = "assembling-machine-1"
        }
    },
    {
        type = "tips-and-tricks-item",
        name = "baketorio-nutrient-setting",
        category = "baketorio",
        order = "baketorio-a",
        icon = "__baketorio__/graphics/nutrient1.png",
        icon_size = 32,
        indent = 1,
        image = "__baketorio__/graphics/nutrient-assistant.png",
        trigger = {
            type = "build-entity",
            entity = "assembling-machine-1"
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
if settings.startup["baketorio-batter-fluids"].value then
    require("prototypes.batter-fluids")
else
    require("prototypes.batter")
end
require("prototypes.technologies")
require("prototypes.nutrients")

require("prototypes.ordering")

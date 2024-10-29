

data:extend(
    {
        {
            type = "item",
            name = "butter",
            icon = "__baketorio__/graphics/butter.png",
            icon_size = 32,
            subgroup = "milk",
            stack_size = 200
        },
        {
            type = "capsule",
            capsule_action=capsule_action(0),
            name = "cheese",
            icon = "__baketorio__/graphics/cheese.png",
            icon_size = 32,
            subgroup = "milk",
            stack_size = 100,
            tastiness=3
        },
        {
            type = "item",
            name = "greenhouse",
            icon = "__baketorio__/graphics/greenhouse-icon.png",
            icon_size = 32,
            subgroup = "production-machine",
            place_result = "greenhouse",
            stack_size = 50

        },
        {
            type = "item",
            name = "organic-synthesizer",
            icon = "__baketorio__/graphics/organic-synth-item.png",
            icon_size = 32,
            subgroup = "production-machine",
            place_result = "organic-synthesizer",
            stack_size = 50
        },
        {
            type = "capsule",
            capsule_action=capsule_action(0),
            name = "hardtack",
            icon = "__baketorio__/graphics/hardtack.png",
            icon_size = 32,
            subgroup = "bread",
            stack_size = 50,
            tastiness = 1
        },
        {
            type = "capsule",
            capsule_action=capsule_action(0),
            name = "salted-hardtack",
            icons = {
                {icon = "__baketorio__/graphics/hardtack.png", icon_size=32},
                {icon = "__baketorio__/graphics/salt-mod.png", icon_size=32}
            },
            icon_size = 32,
            tastiness = 1,
            subgroup = "bread",
            stack_size = 50,
        },
        {
            type = "item",
            name = "egg",
            icon = "__baketorio__/graphics/egg.png",
            icon_size = 32,
            subgroup = "ingredient",
            stack_size = 50
        },
        {
            type = "item",
            name = "chicken",
            icon = "__baketorio__/graphics/chicken.png",
            icon_size = 32,
            subgroup = "seeds",
            stack_size = 50
        },
        {
            type = "item",
            name = "cow",
            icon = "__baketorio__/graphics/cow.png",
            icon_size = 32,
            subgroup = "seeds",
            stack_size = 50
        },
        {
            type = "item",
            name = "frosting",
            icon = "__baketorio__/graphics/frosting.png",
            icon_size = 32,
            subgroup = "ingredient",
            stack_size = 50
        },
        {
            type = "item",
            name = "cocoa-powder",
            icon = "__baketorio__/graphics/cocoa-powder.png",
            icon_size = 32,
            subgroup = "ingredient",
            stack_size = 50
        },
        {
            type = "capsule",
            capsule_action=capsule_action(0),
            name = "brownie",
            tastiness = 6,
            icon = "__baketorio__/graphics/brownies.png",
            icon_size = 32,
            subgroup = "chocolate",
            stack_size = 50
        },
        {
            type = "item",
            name = "cinnamon-sugar",
            icon = "__baketorio__/graphics/cinnamon-sugar.png",
            icon_size = 32,
            subgroup = "chocolate",
            stack_size = 50
        },
        {
            type = "capsule",
            capsule_action=capsule_action(0),
            name = "cinnamon-sugar-doughnut",
            tastiness = 6,
            icon = "__baketorio__/graphics/cinnamon-sugar-doughnut.png",
            icon_size = 32,
            subgroup = "chocolate",
            stack_size = 50
        },
        {
            type = "item",
            name = "chocolate-chip-batter",
            icon = "__baketorio__/graphics/chocolate-chip-batter.png",
            icon_size = 32,
            subgroup = "chocolate",
            stack_size = 50
        },
        {
            type = "capsule",
            capsule_action=capsule_action(0),
            name = "chocolate-chip-cookie",
            tastiness = 5,
            icon = "__baketorio__/graphics/chocolate-chip-cookie.png",
            icon_size = 32,
            subgroup = "chocolate",
            stack_size = 50
        },
        {
            type = "item",
            name = "blueberry-pie",
            icon = "__baketorio__/graphics/blueberry-pie.png",
            icon_size = 32,
            subgroup = "fruit",
            stack_size = 50
        },
        {
            type = "capsule",
            capsule_action=capsule_action(0),
            name = "blueberry-pie-cooked",
            tastiness = 12,
            icon = "__baketorio__/graphics/blueberry-pie-cooked.png",
            icon_size = 32,
            subgroup = "fruit",
            stack_size = 50
        },
        {
            type = "item",
            name = "strawberry-pie",
            icon = "__baketorio__/graphics/strawberry-pie.png",
            icon_size = 32,
            subgroup = "fruit",
            stack_size = 50
        },
        {
            type = "capsule",
            capsule_action=capsule_action(0),
            name = "strawberry-pie-cooked",
            tastiness = 17,
            icon = "__baketorio__/graphics/strawberry-pie-cooked.png",
            icon_size = 32,
            subgroup = "fruit",
            stack_size = 50
        },
        {
            type = "item",
            name = "soda-ash",
            icon = "__baketorio__/graphics/soda-ash.png",
            icon_size = 32,
            subgroup = "raw-material",
            stack_size = 100
        },
        {
            type = "item",
            name = "baking-soda",
            icon = "__baketorio__/graphics/baking-soda.png",
            icon_size = 32,
            subgroup = "raw-material",
            stack_size = 100
        },
        {
            type = "capsule",
            capsule_action=capsule_action(0),
            name = "plain-ice-cream",
            tastiness=5,
            icon = "__baketorio__/graphics/plain-ice-cream.png",
            icon_size = 32,
            subgroup = "raw-material",
            stack_size = 100
        },
        {
            type = "capsule",
            capsule_action=capsule_action(0),
            name = "brownies-with-ice-cream",
            tastiness=8,
            icons = {
                {icon = "__baketorio__/graphics/brownies.png", icon_size=32},
                {icon = "__baketorio__/graphics/plain-ice-cream-sub.png", icon_size=32}
            },
            icon_size = 32,
            subgroup = "raw-material",
            stack_size = 50
        }
        -- {
        --     type = "item",
        --     name = "chocolate-ice-cream",
        --     tastiness=6,
        --     icon = "__baketorio__/graphics/chocolate-ice-cream.png",
        --     icon_size = 32,
        --     subgroup = "raw-material",
        --     stack_size = 100
        -- },
        -- {
        --     type = "item",
        --     name = "strawberry-ice-cream",
        --     tastiness=6,
        --     icon = "__baketorio__/graphics/strawberry-ice-cream.png",
        --     icon_size = 32,
        --     subgroup = "raw-material",
        --     stack_size = 100
        -- },
    }
)


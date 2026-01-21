local food = {}

for key,value in pairs(food) do
    if(value.salt_mod ~= nil) then
        data:extend( {
            type = "item",
            name = "salted-"+value.name,
            icons = {
                {icon = value.icon, icon_size=32},
                {icon = "__baketorio__/graphics/salt-mod.png", icon_size=32}
            },
            icon_size = 32,
            subgroup = value.subgroup,
            stack_size = 50
        })
        data:extend( {
            type = "recipe",
            name = "salted-" + value.name,
            category = "crafting",
            subgroup = value.subgroup,
            energy_required = 1,
            enabled = true,
            ingredients ={
                {type="item",name="flour",amount=2}
            },
            results = {
                {type="item",name="hardtack",amount=3}
            },
            icon = "__baketorio__/graphics/hardtack.png",
            icon_size = 32,
        })

    end
end

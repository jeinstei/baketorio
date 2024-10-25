function set_gui_data(elem,prop,value) 
    if (not storage.gui_data) then storage.gui_data = {} end
    if (not storage.gui_data[elem.index]) then storage.gui_data[elem.index] = {} end
    storage.gui_data[elem.index][prop] = value
end

function get_gui_data(elem,prop) 
    if (not storage.gui_data) then return false end
    if (not storage.gui_data[elem.index]) then return false end
    return storage.gui_data[elem.index][prop];
end


script.on_event(defines.events.on_gui_opened,function(event)
    local player = game.players[event.player_index]
    if(event.entity ~= nil and (event.entity.name == "assembling-machine-1" or event.entity.name == "assembling-machine-2" or event.entity.name == "assembling-machine-3")) then
        if(player == nil or player.gui.top.recipe_chooser ~= nil) then
            return;
        end
        player.gui.top.add{type = "frame",name="recipe_chooser"}
        local item1 = player.gui.top.recipe_chooser.add{type = "choose-elem-button",name="item1",elem_type="item",entity=event.entity,nchooser=true}
        local item2 = player.gui.top.recipe_chooser.add{type = "choose-elem-button",name="item2",elem_type="item",entity=event.entity,nchooser=true}
        set_gui_data(item1,"nchooser",true)
        set_gui_data(item1,"other",item2)
        set_gui_data(item1,"entity",event.entity)
        set_gui_data(item2,"nchooser",true)
        set_gui_data(item2,"other",item1)
        set_gui_data(item2,"entity",event.entity)
    end
end)

script.on_event(defines.events.on_gui_closed,function(event)
    local player = game.players[event.player_index]
    if(player == nil or player.gui.top.recipe_chooser == nil) then
        return;
    end
    player.gui.top.recipe_chooser.destroy()
end)

script.on_event(defines.events.on_gui_elem_changed,function(event)
    if(event.element ~= nil and get_gui_data(event.element,"nchooser")) then
        local i1 = nil;
        local i2 = nil;
        local filter = {
            {
                filter = "has-product-item",
                elem_filters = {
                    {
                        filter="subgroup",
                        subgroup="nutrients"
                    }
                }
            }
        }
        if(event.element.elem_value ~= nil) then
            i1 = event.element.elem_value
            filter[#filter+1] = {
                filter = "has-ingredient-item",
                mode="and",
                elem_filters = {
                    {filter="name",name=i1}
                }
            }
        end
        if(get_gui_data(event.element,"other").elem_value ~= nil) then
            i2 = get_gui_data(event.element,"other").elem_value
            filter[#filter+1] = {
                filter = "has-ingredient-item",
                mode="and",
                elem_filters = {
                    {filter="name",name=i2}
                }
            }
        end

        local list = game.get_filtered_recipe_prototypes(filter)
        for key,value in pairs(list) do
            get_gui_data(event.element,"entity").set_recipe(value.name);
            break;
        end
        
    end
end)

-- https://lua-api.factorio.com/latest/prototypes/UseItemAchievementPrototype.html
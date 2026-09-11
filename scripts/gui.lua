local lib = {}

---@type fun(elem:LuaGuiElement, prop:string, value:any):nil
lib.set_gui_data = function (elem, prop, value)
    local gui_data = storage.gui_data
    if (not gui_data) then gui_data = {} end
    if (not gui_data[elem.index]) then gui_data[elem.index] = {} end
    gui_data[elem.index][prop] = value
end

---@type fun(elem:LuaGuiElement, prop:string):any
lib.get_gui_data = function (elem, prop)
    local gui_data = storage.gui_data
    if (not gui_data) then return false end
    if (not gui_data[elem.index]) then return false end
    return gui_data[elem.index][prop];
end

---@type fun(chooser:LuaGuiElement, ingredients:table<string, int>):nil
lib.updateItemChooser = function (chooser, ingredients)
    if (not chooser) then return end
    chooser.clear()
    log("Adding items to chooser " .. chooser.name)
    local i = 0
    for k, _ in pairs(ingredients)
    do
        log("Adding item " .. k)
        chooser.add { type = "sprite-button", name = "ngen" .. i, sprite = "item/" .. k }
        i = i + 1
    end
end

---@type fun(force:LuaForce, ingredients?:table<string,int>):nil
lib.updateAllItemChooserForForce = function (force, ingredients)
    -- Update UI for all players if it is showing
    for _, v in pairs(game.players)
    do
        if v.force == force then
            if v.gui ~= nil and v.gui.top ~= nil and v.gui.top.itemChooserFrame ~= nil and v.gui.top.itemChooserFrame.itemChooser ~= nil then
                if (not ingredients) then ingredients = storage.activeNutrientIngredientsByForce[force.name] end
                lib.updateItemChooser(v.gui.top.itemChooserFrame.itemChooser,
                    ingredients)
            end
        end
    end
end

-- Sets active recipe based on items
---@type fun(force:LuaForce, items:string[]):string|nil
local getActiveRecipeFromItems = function (force, items)
    if (not items) then
        return
    end

    -- Check for both items being empty strings
    local allEmpty = true
    for _, v in ipairs(items)
    do
        if v ~= "" then
            allEmpty = false
            break
        end
    end

    -- Exit with nil if all fields are empty strings
    if allEmpty then
        return nil
    end

    local filter = {
        {
            filter = "has-product-item",
            elem_filters = {
                {
                    filter = "subgroup",
                    subgroup = "nutrients"
                }
            }
        }
    }

    for _, v in ipairs(items)
    do
        if v ~= "" then
            filter[#filter + 1] = {
                filter = "has-ingredient-item",
                mode = "and",
                elem_filters = {
                    { filter = "name", name = v }
                }
            }
        end
    end

    local list = prototypes.get_recipe_filtered(filter)
    local visibleRecipes = {}
    for k, v in pairs(list)
    do
        if force.is_visible({ type = "recipe", name = v.name }) then
            visibleRecipes[k] = true
        end
    end

    if (next(visibleRecipes) == nil) then
        log("No nutrient recipe selected for: " .. serpent.dump(items))
        return nil
    end

    for name, _ in pairs(visibleRecipes) do
        return name
    end
end

---@type fun(player:LuaPlayer)
local setRecipeBasedOnChoosers = function (player)
    local chooser = player.gui.top.itemChooserFrame.itemChooser
    local i1 = player.gui.top.recipe_chooser.item1
    local i2 = player.gui.top.recipe_chooser.item2

    local items = {
        i1.sprite:sub(6, -1),
        i2.sprite:sub(6, -1)
    }

    local recipe = getActiveRecipeFromItems(player.force, items)
    local entity = lib.get_gui_data(chooser, "entity")
    entity.set_recipe(recipe)
end

---@typ fun(player:LuaPlayer, entity:LuaEntity)
lib.onAssemblingMachineGuiOpened = function (player, entity)
    if (player == nil or player.gui.top.recipe_chooser ~= nil) then
        return
    end

    -- Ignore if nutrients not yet researched
    if player.force.technologies["nutrient1"].researched == false then return end

    player.gui.top.add { type = "frame", name = "recipe_chooser", caption = { "ui-elements.nutrigen" } }

    ---@type LuaGuiElement
    local item1
    ---@type LuaGuiElement
    local item2
    item1 = player.gui.top.recipe_chooser.add { type = "sprite-button", name = "item1", sprite = "", tooltip = { "ui-elements.nutrigen-i1" } }
    item2 = player.gui.top.recipe_chooser.add { type = "sprite-button", name = "item2", sprite = "", tooltip = { "ui-elements.nutrigen-i2" } }

    local activeNutrientIngredientsByForce = storage.activeNutrientIngredientsByForce
    if (not activeNutrientIngredientsByForce) then activeNutrientIngredientsByForce = {} end
    if activeNutrientIngredientsByForce ~= nil and (not activeNutrientIngredientsByForce[player.force.name]) then
        log("Unexpected missing inventory. Creating inventory now. Likely due to scripts or console commands.")
        activeNutrientIngredientsByForce[player.force.name] = {}
    end

    -- Add to top element
    player.gui.top.add { type = "frame", name = "itemChooserFrame", caption = "Select Your Ingredient", visible = false }

    ---@type LuaGuiElement
    local itemChooser = player.gui.top.itemChooserFrame.add { type = "table", name = "itemChooser", column_count = 6, visible = true }

    -- Update chooser table
    lib.updateItemChooser(itemChooser, activeNutrientIngredientsByForce[player.force.name])

    -- Set shared data
    lib.set_gui_data(itemChooser, "frame", player.gui.top.itemChooserFrame)
    lib.set_gui_data(itemChooser, "entity", entity)
    lib.set_gui_data(itemChooser, "buttons", { item1, item2 })
    lib.set_gui_data(itemChooser, "active", nil)
    lib.set_gui_data(item1, "nchooser", true)
    lib.set_gui_data(item1, "other", item2)
    lib.set_gui_data(item1, "chooser", itemChooser)
    lib.set_gui_data(item2, "nchooser", true)
    lib.set_gui_data(item2, "other", item1)
    lib.set_gui_data(item2, "chooser", itemChooser)
end

---@typ fun(player:LuaPlayer):nil
lib.onRecipeChooserClosed = function (player)
    if (player == nil or player.gui.top.recipe_chooser == nil) then
        return
    end
    player.gui.top.recipe_chooser.destroy()
    player.gui.top.itemChooserFrame.destroy()
end

lib.onChooserClick = function (event)
    if event.button ~= nil and event.button == defines.mouse_button_type.middle or event.button == defines.mouse_button_type.right then
        event.element.sprite = ""
        setRecipeBasedOnChoosers(game.players[event.player_index])
    else
        local chooser = lib.get_gui_data(event.element, "chooser")
        local frame = lib.get_gui_data(chooser, "frame")
        lib.set_gui_data(chooser, "active", event.element)
        frame.visible = true
    end
end

lib.onNgenItemSelectClick = function (event)
    local chooser = event.element.parent
    local active = lib.get_gui_data(chooser, "active")
    active.sprite = event.element.sprite

    setRecipeBasedOnChoosers(game.players[event.player_index])

    game.players[event.player_index].gui.top.itemChooserFrame.visible = false
end

return lib

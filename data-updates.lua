if settings.startup["baketorio-batter-fluids"].value then
    
    local fb = require("prototypes.batter-fluids")

    -- Add fluid batter items
    fb.add_fluid_items()

    -- Helper function to change ingredient or results to fluid and count
    ---@type fun(list:IngredientPrototype[]|ProductPrototype[]):int
    local check_and_set_fluid_batter = function (list)
        local fluid_count = 0
        local batter_count = 0
        local llist = list or {}
        for _, item in ipairs(llist) do
            for _, batter in ipairs(fb.batters) do
                if item.name == batter.name then
                    item.type = "fluid"
                    batter_count = batter_count + 1
                    break
                end
            end
            if item.type == "fluid" then
                fluid_count = fluid_count + 1
            end
        end
        return batter_count, fluid_count
    end

    -- Loop through all recipes and set fluid and crafting type as needed
    for k, v in pairs(data.raw["recipe"]) do

        log(k)

        if v.categories == nil or v.ingredients == nil then
            goto continue
        end

        local batter_ingredient_count, fluid_ingredient_count = check_and_set_fluid_batter(v.ingredients)
        local batter_product_count, fluid_product_count = check_and_set_fluid_batter(v.results)

        if batter_ingredient_count > 0 or batter_product_count > 0 then

            if batter_ingredient_count > 1 then
                log("Multiple fluid batters detected for " .. k)
            end

            -- Check if recipe already supports single- or multi- fluid crafting.
            local has_single_fluid_crafting = false
            local has_multiple_fluid_crafting = false
            for _, v in ipairs(v.categories) do
                if v:find("crafting-with-fluid", 1, true) == 1 then
                    has_single_fluid_crafting = true
                end
                if v:find("chemistry", 1, true) == 1 then
                    has_multiple_fluid_crafting = true
                end
            end

            -- Based on actual recipe needs, see if any category updates are needed
            local adding_fluids = false
            local is_single_fluid_crafting_expected = fluid_ingredient_count <= 1 and fluid_product_count <= 1
            local is_multiple_fluid_crafting_expected = fluid_ingredient_count > 1 or fluid_product_count > 1

            if not has_single_fluid_crafting and (is_single_fluid_crafting_expected) then
                table.insert(v.categories, "crafting-with-fluid")
                adding_fluids = true
            end

            if not has_multiple_fluid_crafting and (is_multiple_fluid_crafting_expected) then
                table.insert(v.categories, "chemistry")
                adding_fluids = true
            end
            -- If a fluid category was added, remove non-fluid category from recipe
            if adding_fluids then
                local new_categories = {}
                for _, c in ipairs(v.categories) do
                    if c ~= "crafting" then
                        table.insert(new_categories, c)
                    end
                end
                v.categories = new_categories
            end
        end
        ::continue::
    end

    for k, v in pairs(fb.batters) do
        data.raw["item"][v.name] = nil
    end
end

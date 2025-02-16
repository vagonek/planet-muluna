local rro = require("lib.remove-replace-object")
-- if mods["bzsilicon"] or mods["bztitanium"] or mods["bztin"] or mods["bzlead"] or mods["bzzirconium"] or mods["bzsilicon"] then
--     

--     for _,crusher in pairs(crushers) do
--         table.insert(data.raw["assembling-machine"][crusher].crafting_categories,"basic-crushing")
--     end

--     local recipes_original = {"electronic-circuit","advanced-circuit","electric-engine-unit","low-density-structure"}
--     local recipes = {"electronic-circuit-aluminum","advanced-circuit-aluminum","electric-engine-unit-from-carbon"}
--     for i,recipe_name in ipairs(recipes) do
--         local recipe = data.raw["recipe"][recipe_name]
--         recipe.ingrdients=table.deepcopy(data.raw["recipe"][recipes_original[i]].ingredients)
--         for _,ingredient in pairs(recipe.ingredients) do
--             if ingredient.name=="copper-cable" then
--                 ingredient.name="aluminum-cable"
--             end
--             if ingredient.name=="carbon" then
--                 ingredient.name="graphite"
--             end
--         end
--     end
-- end

if data.raw["furnace"]["basic-crusher"] then
    local crushers = {"crusher", "crusher-2"}
    for _,crusher in pairs(crushers) do
            table.insert(data.raw["assembling-machine"][crusher].crafting_categories,"basic-crushing")
        end
    for _,recipe in pairs(data.raw["recipe"]) do
        if recipe.category == "basic-crushing" then
            recipe.energy_required = recipe.energy_required / 8
        end
    end
    data.raw["furnace"]["basic-crusher"].crafting_speed = data.raw["furnace"]["basic-crusher"].crafting_speed / 8
end

if mods["bztitanium"] then
    data.raw["planet"]["muluna"].map_gen_settings.autoplace_controls["titanium-ore"] = {}
    data.raw["planet"]["muluna"].map_gen_settings.autoplace_settings["entity"]["settings"]["titanium-ore"] = {}
end
if mods["bzzirconium"] then
    data.raw["planet"]["muluna"].map_gen_settings.autoplace_controls["zircon"] = {}
    data.raw["planet"]["muluna"].map_gen_settings.autoplace_settings["entity"]["settings"]["zircon"] = {}
end

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

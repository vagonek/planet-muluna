local rro = require("lib.remove-replace-object")


local function delete_tech(deleted_tech,new_tech)
    for _,effect in pairs(data.raw["technology"][deleted_tech].effects) do
        if effect.type == "unlock-recipe" then
            if new_tech then
                rro.soft_insert(data.raw["technology"][new_tech].effects, 
                {
                    type = "unlock-recipe",
                    recipe = data.raw["recipe"][effect.recipe].name,
                }
            )
            else
                data.raw["recipe"][effect.recipe].enabled = true
            end
        end
    end
    data.raw["technology"][deleted_tech] = nil
    
    for _,technology in pairs(data.raw["technology"]) do
        rro.remove(technology.prerequisites,deleted_tech)
    end
end


if settings.startup["aps-planet"] and settings.startup["aps-planet"].value == "muluna" then
    data.raw["technology"]["electronics"].research_trigger.item="aluminum-plate"
    rro.replace_name(data.raw["recipe"]["automation-science-pack"].ingredients,"copper-plate","aluminum-plate")
    --rro.replace_name(data.raw["recipe"]["electric-furnace"].ingredients,"advanced-circuit","electronic-circuit")
    --data.raw["recipe"]["electric-furnace"].enabled = true
    --data.raw["recipe"]["electric-mining-drill"].enabled = true
    --data.raw["recipe"]["steel"].enabled = true
    delete_tech("electric-mining-drill")
    delete_tech("advanced-material-processing-2")
    delete_tech("steel-processing")
    delete_tech("advanced-circuit","electronics")
    --delete_tech("processing-unit","electronics")
    -- data.raw["recipe"]["advanced-circuit"].enabled = false
    -- rro.soft_insert(data.raw["technology"]["electronics"].effects,
    -- {
    --     type = "unlock-recipe",
    --     recipe = "advanced-circuit",
    -- })
    rro.soft_insert(data.raw["technology"]["wood-gas-processing"].effects,
    {
        type = "unlock-recipe",
        recipe = "chemical-plant",
    })
    -- rro.remove(data.raw["technology"]["muluna-silicon-processing"].unit.ingredients,{"production-science-pack",  1})
    -- rro.remove(data.raw["technology"]["muluna-silicon-processing"].unit.ingredients,{"chemical-science-pack",  1})
    rro.soft_insert(data.raw["technology"]["solar-energy"].prerequisites,"muluna-anorthite-processing")
    -- rro.remove(data.raw["technology"]["muluna-silicon-processing"].prerequisites,"production-science-pack")

    delete_tech("muluna-silicon-processing","solar-energy")
    delete_tech("electric-energy-distribution-1")
    delete_tech("sulfur-processing","wood-gas-processing")
    delete_tech("engine","steam-power")
  end
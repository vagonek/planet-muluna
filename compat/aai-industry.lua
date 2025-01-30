local rro = require("lib.remove-replace-object")
local dual_icon = require("lib.dual-item-icon").dual_icon
if mods["aai-industry"] then
    if data.raw["burner-assembling-machine"] then
        data.raw["burner-assembling-machine"].surface_conditions = {
            {
            property = "oxygen",
            min = 1,
            }
        }
    end
    
    if data.raw["burner-lab"] then
        table.insert(data.raw["burner-assembling-machine"].surface_conditions , {
            property = "oxygen",
            min = 1,
        })
    end
    
    if data.raw["burner-turbine"] then
        table.insert(data.raw["burner-turbine"].surface_conditions , {
            property = "oxygen",
            min = 1,
        })
    end
    -- rro.replace(data.raw["electric-engine-from-carbon"].ingredients ,
    -- {
    --     type = "fluid",
    --     name = "lubricant",
    --     amount = 40
    -- }


-- )

data.raw["recipe"]["electric-engine-unit-from-carbon"].icons = dual_icon("electric-engine-unit","carbon")

local small_electric_motor = table.deepcopy(data.raw["recipe"]["electric-motor"])

small_electric_motor = rro.merge(small_electric_motor, 
{
    name = "small-electric-motor-from-aluminum",
    icon = nil,
    icons = dual_icon("electric-motor","aluminum-cable"),
    --localised_name = {"recipe-name.n-from-n",{"item-name.electric-motor"},{"item-name.aluminum-cable"}}
})

rro.replace(small_electric_motor.ingredients, {type = "item", name = "copper-cable", amount = 6}, {type = "item", name = "aluminum-cable", amount = 6})

data:extend{small_electric_motor}



table.insert(data.raw["technology"]["anorthite-processing"].effects,
{
    type = "unlock-recipe",
    recipe = "small-electric-motor-from-aluminum",
})
end

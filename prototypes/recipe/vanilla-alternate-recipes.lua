local rro = require("lib.remove-replace-object")
--Muluna-specific alternative recipes for vanilla items

local motor_carbon = table.deepcopy(data.raw["recipe"]["electric-engine-unit"])

motor_carbon.name="electric-engine-unit-from-carbon"

rro.replace(motor_carbon.ingredients,
{type = "fluid", name = "lubricant", amount = 15},
{type = "item", name = "carbon", amount = 1}
)

motor_carbon.icons= {
    {
        icon=data.raw["item"]["electric-engine-unit"].icon,
        icon_size=data.raw["item"]["electric-engine-unit"].icon_size,
        scale=0.35
    },
    {
        icon=data.raw["item"]["carbon"].icon,
        icon_size=data.raw["item"]["carbon"].icon_size,
        scale=0.30,
        shift = {10,-10},
    },
}

-- local rocket_fuel_thruster_fuel = table.deepcopy(data.raw["recipe"]["rocket_fuel"])

-- rocket_fuel_thruster_fuel.name="rocket-fuel-from-thruster-fuel"


data:extend{motor_carbon}



local rro = require("lib.remove-replace-object")
--Muluna-specific alternative recipes for vanilla items

local function dual_icon(item_1,item_2)
    local icon = {
        {
            icon=data.raw["item"][item_1].icon,
            icon_size=data.raw["item"][item_1].icon_size,
            scale=0.35
        },
        {
            icon=data.raw["item"][item_2].icon,
            icon_size=data.raw["item"][item_2].icon_size,
            scale=0.30,
            shift = {10,-10},
        },
    }
    return icon
end



local motor_carbon = table.deepcopy(data.raw["recipe"]["electric-engine-unit"])

motor_carbon.name="electric-engine-unit-from-carbon"

rro.replace(motor_carbon.ingredients,
{type = "fluid", name = "lubricant", amount = 15},
{type = "item", name = "carbon", amount = 1}
)
motor_carbon.icons=dual_icon("electric-engine-unit","carbon")
-- motor_carbon.icons= {
--     {
--         icon=data.raw["item"]["electric-engine-unit"].icon,
--         icon_size=data.raw["item"]["electric-engine-unit"].icon_size,
--         scale=0.35
--     },
--     {
--         icon=data.raw["item"]["carbon"].icon,
--         icon_size=data.raw["item"]["carbon"].icon_size,
--         scale=0.30,
--         shift = {10,-10},
--     },
-- }

-- local rocket_fuel_thruster_fuel = table.deepcopy(data.raw["recipe"]["rocket_fuel"])

-- rocket_fuel_thruster_fuel.name="rocket-fuel-from-thruster-fuel"


local aluminum_rocket_fuel=table.deepcopy(data.raw["recipe"]["rocket-fuel"])
aluminum_rocket_fuel.name="rocket-fuel-aluminum"
aluminum_rocket_fuel.ingredients = {{type = "item",name = "alumina-crushed",amount = 10},{type = "item",name = "ice",amount = 2},{type = "fluid",name = "water",amount = 100}}

aluminum_rocket_fuel.icons= dual_icon("rocket-fuel","alumina")



data:extend{motor_carbon,aluminum_rocket_fuel}



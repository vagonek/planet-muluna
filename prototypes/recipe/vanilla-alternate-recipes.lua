local rro = require("lib.remove-replace-object")
--Muluna-specific alternative recipes for vanilla items

local function dual_icon(item_1,item_2)
    local icon = {}
    if data.raw["item"][item_1].icon then
        icon[1]={
            icon=data.raw["item"][item_1].icon,
            icon_size=data.raw["item"][item_1].icon_size,
            scale=0.35
        }
        if data.raw["item"][item_1].icon_size then
            icon[1].scale=icon[1].scale * 64 /data.raw["item"][item_1].icon_size
        end
    else
        icon[1]={
            icon=data.raw["item"][item_1].icons[1].icon,
            icon_size=data.raw["item"][item_1].icons[1].icon_size,
            scale=0.35
        }
    end
    if data.raw["item"][item_1].icon then
        icon[2]={
            icon=data.raw["item"][item_2].icon,
            icon_size=data.raw["item"][item_2].icon_size,
            scale=0.30,
            shift = {10,-10},
            }
            if data.raw["item"][item_2].icon_size then
                icon[2].scale=icon[2].scale* 64 /data.raw["item"][item_2].icon_size
            end
    else
        icon[2]={
            icon=data.raw["item"][item_2].icons[1].icon,
            icon_size=data.raw["item"][item_2].icons[1].icon_size,
            scale=0.30,
            shift = {10,-10},
            }
    end
    
    
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

local carbon_nanotubes_lds = table.deepcopy(data.raw["recipe"]["low-density-structure"])

carbon_nanotubes_lds.name = "low-density-structure-from-carbon"

carbon_nanotubes_lds.ingredients = {{type = "item", name = "iron-plate", amount = 5}, {type = "item", name = "alumina-crushed", amount = 5}, {type = "item", name = "carbon", amount = 20}}
carbon_nanotubes_lds.energy_required=30
carbon_nanotubes_lds.icons = dual_icon("low-density-structure","carbon")

carbon_nanotubes_lds.surface_conditions = {{
    property = "oxygen",
    min = 0,
    max = 0,
}}

local landfill_crushed_stone=table.deepcopy(data.raw["recipe"]["landfill"])
--landfill_crushed_stone.category="crafting-with-fluid"
landfill_crushed_stone.ingredients = {{type = "item",name = "stone-crushed",amount = 40},{type = "item",name = "concrete",amount = 5}}
landfill_crushed_stone.name="landfill-stone-crushed"

landfill_crushed_stone.icons=dual_icon("landfill","stone-crushed")

local bricks_crushed_stone=table.deepcopy(data.raw["recipe"]["stone-brick"])

bricks_crushed_stone.ingredients = {{type = "item",name = "stone-crushed",amount = 2}}
bricks_crushed_stone.name="stone-bricks-stone-crushed"
bricks_crushed_stone.enabled=false
bricks_crushed_stone.icons = dual_icon("stone-brick","stone-crushed")



local aluminum_green_circuit = table.deepcopy(data.raw["recipe"]["electronic-circuit"])
local aluminum_red_circuit = table.deepcopy(data.raw["recipe"]["advanced-circuit"])

rro.replace(aluminum_green_circuit.ingredients,{type = "item",name = "copper-cable",amount = 3},{type = "item",name = "aluminum-cable",amount = 3})
rro.replace(aluminum_red_circuit.ingredients,{type = "item",name = "copper-cable",amount = 4},{type = "item",name = "aluminum-cable",amount = 4})

aluminum_green_circuit.name="electronic-circuit-aluminum"
aluminum_red_circuit.name="advanced-circuit-aluminum"

aluminum_green_circuit.icons = dual_icon("electronic-circuit","aluminum-cable")
aluminum_red_circuit.icons = dual_icon("advanced-circuit","aluminum-cable")

data:extend{motor_carbon, aluminum_rocket_fuel, carbon_nanotubes_lds, landfill_crushed_stone, bricks_crushed_stone,aluminum_green_circuit,aluminum_red_circuit}



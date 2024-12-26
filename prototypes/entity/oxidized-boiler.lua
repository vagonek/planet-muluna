data_util=require("__flib__.data-util")

local water_capacity=data.raw["fluid"]["water"].heat_capacity

local heat,str=data_util.get_energy_value(water_capacity)

data.raw["fluid"]["thruster-oxidizer"].heat_capacity=tostring(heat/15) .. str
--data.raw["fluid"]["thruster-oxidizer"].default_temperature=data.raw["fluid"]["water"].default_temperature
--data.raw["fluid"]["thruster-fuel"].default_temperature=data.raw["fluid"]["water"].default_temperature

--data.raw["fluid"]["thruster-fuel"].fuel_value=
--data.raw["fluid"]["thruster-fuel"].fuel_value=data.raw["fluid"]["thruster-fuel"].fuel_value+data.raw["fluid"]["thruster-oxidizer"].fuel_value
--data.raw["fluid"]["thruster-oxidizer"].fuel_value=nil




local space_boiler=table.deepcopy(data.raw["boiler"]["boiler"])
space_boiler.name="space-boiler"
space_boiler.surface_conditions=nil
space_boiler.fluid_box.filter="thruster-oxidizer"
--space_boiler.energy_source.effectivity=64/60
space_boiler.energy_consumption = "1.8MW"
space_boiler.minable.result="space-boiler"


data:extend{space_boiler}
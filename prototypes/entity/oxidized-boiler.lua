--[[
  Fix/Enhance/Upgrade version of the original snippet.
  This script adjusts fluid properties for "thruster-oxidizer" based on water's heat capacity
  and creates a custom "space-boiler" prototype based on the default boiler.
]]

local data_util = require("__flib__.data-util")

--------------------------------------------------------------------------------
-- Step 1: Safely retrieve water fluid data and compute a scaled heat capacity
--------------------------------------------------------------------------------
local water_fluid = data.raw["fluid"]["water"]
if not water_fluid then
  -- If "water" fluid somehow doesn't exist, abort or skip this logic
  log("Warning: 'water' fluid not found. Skipping thruster-oxidizer capacity changes.")
  return
end

local water_capacity_str = water_fluid.heat_capacity or "1KJ"  -- Fallback if missing
local numeric_value, suffix = data_util.get_energy_value(water_capacity_str)
-- e.g. numeric_value = 15, suffix="KJ" or "MJ"

--------------------------------------------------------------------------------
-- Step 2: Modify "thruster-oxidizer" heat capacity, if it exists
--------------------------------------------------------------------------------
local thruster_oxidizer = data.raw["fluid"]["thruster-oxidizer"]
if thruster_oxidizer then
  -- For example, dividing water's numeric capacity by 15
  thruster_oxidizer.heat_capacity = tostring(numeric_value / 15) .. suffix

  -- Optionally set default temperature if you wish:
  -- thruster_oxidizer.default_temperature = water_fluid.default_temperature or 15

  -- If you want to define some unique or additional properties:
  -- thruster_oxidizer.base_color   = {r=0.2, g=0.5, b=0.8}
  -- thruster_oxidizer.flow_color   = {r=0.4, g=0.7, b=0.9}
  -- thruster_oxidizer.fuel_value   = "2MJ"
else
  log("Warning: 'thruster-oxidizer' fluid not found. Skipping modifications.")
end

--------------------------------------------------------------------------------
-- (Optional) Step 3: Similarly handle "thruster-fuel"
--------------------------------------------------------------------------------
-- local thruster_fuel = data.raw["fluid"]["thruster-fuel"]
-- if thruster_fuel then
--   thruster_fuel.default_temperature = water_fluid.default_temperature or 15
--   -- thruster_fuel.fuel_value = "4MJ" -- example
-- end

--------------------------------------------------------------------------------
-- Step 4: Create or modify a custom "space-boiler" based on the default "boiler"
--------------------------------------------------------------------------------
local base_boiler = data.raw["boiler"]["boiler"]
if not base_boiler then
  log("Warning: base 'boiler' prototype not found. Cannot create 'space-boiler'.")
  return
end

-- Deep copy the table so we don't mutate the original
local space_boiler = table.deepcopy(base_boiler)
space_boiler.name = "space-boiler"
space_boiler.surface_conditions = nil  -- Remove any surface restrictions
space_boiler.energy_consumption = "1.8MW"
space_boiler.minable.result = "space-boiler"

-- Example custom tweak: you could adjust fluid_box filters or effectivity:
-- space_boiler.fluid_box.filter      = "thruster-oxidizer"
-- space_boiler.energy_source.effectivity = 64/60  -- example

--------------------------------------------------------------------------------
-- Step 5: Final extension into the data stage
--------------------------------------------------------------------------------
data:extend({
  space_boiler
})

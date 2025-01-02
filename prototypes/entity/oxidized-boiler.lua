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
space_boiler.name = "space-boiler-legacy"
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


--------------------------------------------------------------------------------
-- New Space Boiler
-- Based on Hurricane's Thermal Plant

local space_boiler_new = {
  type="boiler",
  name= "space-boiler",
  icon = "__hurricane-graphics__/graphics/thermal-plant/thermal-plant-icon.png",
  flags = {"placeable-neutral", "player-creation"},
  minable = {mining_time = 0.5, result = "boiler"},
  fast_replaceable_group = "boiler",
  max_health = 600,
  corpse = "boiler-remnants",
  dying_explosion = "boiler-explosion",
  impact_category = "metal-large",
  mode = "output-to-separate-pipe",
  working_sound = base_boiler.working_sound,
  open_sound = base_boiler.open_sound,
  close_sound = base_boiler.close_sound,
  energy_source=base_boiler.energy_source,
  collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
  selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
  burning_cooldown = 20,
  fire_flicker_enabled = true,
  fire_glow_flicker_enabled = true,
  --damaged_trigger_effect = hit_effects.entity(),

  target_temperature = 65,
    fluid_box =
    {
      volume = 200,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {flow_direction = "input-output", direction = defines.direction.west, position = {-1.0, 0}},
        {flow_direction = "input-output", direction = defines.direction.east, position = {1.0, 0}}
      },
      production_type = "input",
      filter = "water"
    },
    output_fluid_box =
    {
      volume = 200,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {flow_direction = "output", direction = defines.direction.north, position = {0, -1}}
      },
      production_type = "output",
      filter = "steam"
    },
    energy_consumption = "1.8MW",
  pictures = {
    north =
      {
        structure =
        {
          layers =
          {
            {
              filename = "__hurricane-graphics__/graphics/thermal-plant/thermal-plant-hr-animation-1.png",
              priority = "extra-high",
              width = 1300,
              height = 1000,
              frame_count = 64,
              line_length = 8,
              width = 330,
              height = 410,
              animation_speed = 0.5,
              shift = util.by_pixel(0, -20),
              scale = 0.35,
            },
            -- {
            --   filename = "__hurricane-graphics__/graphics/thermal-plant/thermal-plant-hr-shadow.png",
            --   priority = "extra-high",
            --   width = 900,
            --   height = 500,
            --   scale = 0.125,
            --   shift = util.by_pixel(20.5, 9),
            --   draw_as_shadow = true
            -- }
          }
        },
        fire_glow =
        {
          filename = "__hurricane-graphics__/graphics/thermal-plant/thermal-plant-hr-emission-1.png",
          draw_as_glow = true,
          priority = "extra-high",
          frame_count = 64,
          line_length = 8,
          width = 330,
          height = 410,
          animation_speed = 0.5,
          shift = util.by_pixel(0, -20),
          scale = 0.35,
          blend_mode="additive"
        },
        fire =
        {
          filename = "__hurricane-graphics__/graphics/thermal-plant/thermal-plant-hr-emission-1.png",
          draw_as_glow = true,
          priority = "extra-high",
          frame_count = 64,
          line_length = 8,
          width = 330,
          height = 410,
          animation_speed = 0.5,
          shift = util.by_pixel(0, -20),
          scale = 0.35,
          blend_mode="additive"
        },
      },
  }
}
space_boiler_new.pictures.east=space_boiler_new.pictures.north
space_boiler_new.pictures.west=space_boiler_new.pictures.north
space_boiler_new.pictures.south=space_boiler_new.pictures.north

space_boiler_new.energy_source.light_flicker =
  {
    color = {0,0,0},
    minimum_intensity = 0.6*3,
    maximum_intensity = 0.95*3
  }


data:extend{space_boiler_new}

data.raw["generator"]["steam-engine"].fluid_box.minimum_temperature=50
data.raw["generator"]["steam-turbine"].fluid_box.minimum_temperature=50

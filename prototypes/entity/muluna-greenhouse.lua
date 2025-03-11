local width = 11-0.001
local height = 11-0.001
local gap = 0
local scale = 1.1
local greenhouse_category = {
    type="recipe-category",
    name="muluna-greenhouse-11x11",
  }

local greenhouse = {
    type="assembling-machine",
    name= "muluna-greenhouse-wood",
    icon = "__planet-muluna__/graphics/greenhouse/sprites/greenhouse-icon.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "muluna-greenhouse"},
    fast_replaceable_group = "",
    max_health = 1000,
    corpse = "boiler-remnants",
    dying_explosion = "boiler-explosion",
    impact_category = "metal-large",
    mode = "output-to-separate-pipe",
    --working_sound = base_boiler.working_sound,
    --open_sound = base_boiler.open_sound,
    --close_sound = base_boiler.close_sound,
    energy_source={
        type="electric",
        usage_priority = "primary-input",
        emissions_per_minute = {},
    },
    collision_box = {{-width/2+gap, -height/2+gap}, {width/2-gap, height/2-gap}},
    selection_box = {{-width/2, -height/2}, {width/2, height/2}},
    burning_cooldown = 20,
    --fire_flicker_enabled = true,
    --fire_glow_flicker_enabled = true,
    --damaged_trigger_effect = hit_effects.entity(),
  
    target_temperature = 65,
    fluid_boxes = {
      {
        volume = 200,
        pipe_covers = pipecoverspictures(),
        pipe_connections =
        {
          {flow_direction = "input-output", direction = defines.direction.west, position = {-5.0, 3}},
          {flow_direction = "input-output", direction = defines.direction.east, position = {5.0, 3}},
          {flow_direction = "input-output", direction = defines.direction.south, position = {-3.0, 5}},
          {flow_direction = "input-output", direction = defines.direction.north, position = {-3, -5}},
        },
        production_type = "input",
        --filter = "water"
      },
        {
          volume = 200,
          pipe_covers = pipecoverspictures(),
          pipe_connections =
          {
            --{flow_direction = "input", direction = defines.direction.west, position = {-5.0, 0}},
            --{flow_direction = "input", direction = defines.direction.east, position = {5.0, 0}},
            --{flow_direction = "input", direction = defines.direction.south, position = {-0.0, 5}},
            {flow_direction = "input", direction = defines.direction.north, position = {-0, -5}},
          },
          production_type = "input",
          --filter = "water"
        },
        
        {
            volume = 200,
            pipe_covers = pipecoverspictures(),
            --pipe_picture =  require("__space-age__.prototypes.entity.cryogenic-plant-pictures").pipe_picture,
            --always_draw_covers = true, -- fighting against FluidBoxPrototype::always_draw_covers crazy default
            pipe_connections =
            {
              {flow_direction = "input-output", direction = defines.direction.west, position = {-5.0, -3}},
              {flow_direction = "input-output", direction = defines.direction.east, position = {5.0, -3}},
              {flow_direction = "input-output", direction = defines.direction.south, position = {3.0, 5}},
            {flow_direction = "input-output", direction = defines.direction.north, position = {3, -5}},
            },
            production_type = "output",
            --filter = "steam"
        },
    },
    --fluid_boxes=data.raw["assembling-machine"]["chemical-plant"].fluid_boxes,
      -- fluid_box =
      -- {
      --   volume = 200,hemistry
      --   filter = "steam"
      -- },
    --crafting_categories = {"greenhouse-10x10"},
    crafting_categories = {"muluna-greenhouse-11x11","muluna-greenhouse"},
    crafting_speed=15, 
    energy_usage = "200kW",
    graphics_set = 
        {
          animation = {
          north =
          {
            
              layers =
              {
                {
                  filename = "__planet-muluna__/graphics/greenhouse/sprites/greenhouse-hr-animation-1.png",
                  priority = "extra-high",
                  frame_count = 64,
                  line_length = 8,
                  width = 340,
                  height = 355,
                  animation_speed = 0.5,
                  shift = util.by_pixel(0, -10),
                  scale = scale,
                },
                {
                  filename = "__planet-muluna__/graphics/greenhouse/sprites/greenhouse-hr-emission-1.png",
                  draw_as_glow = true,
                  priority = "extra-high",
                  frame_count = 64,
                  line_length = 8,
                  width = 340,
                  height = 355,
                  animation_speed = 0.5,
                  shift = util.by_pixel(0, -10),
                  scale = scale,
                  blend_mode="additive"
                },
                -- {
                --   filename = "__planet-muluna__/graphics/thermal-plant/thermal-plant-hr-shadow.png",
                --   priority = "extra-high",
                --   width = 900,
                --   height = 500,
                --   scale = 0.125,
                --   shift = util.by_pixel(20.5, 9),
                --   draw_as_shadow = true
                -- }
              }
            },
            
          },
        }
    

    
  }


data:extend{greenhouse,greenhouse_category}
local flib_bounding_box = require("__flib__/bounding-box")
local cryolab=table.deepcopy(data.raw["lab"]["biolab"])

cryolab.name="cryolab"
cryolab.selection_box=flib_bounding_box.resize(cryolab.selection_box,1)
cryolab.collision_box=flib_bounding_box.resize(cryolab.collision_box,1)
cryolab.minable = {mining_time = 0.5, result = "cryolab"}
cryolab.researching_speed=cryolab.researching_speed*3
cryolab.science_pack_drain_rate_percent=35
cryolab.energy_usage="1.5MW"
cryolab.max_health=500
cryolab.module_slots=6
cryolab.energy_source.emissions_per_minute.pollution=cryolab.energy_source.emissions_per_minute.pollution*2
cryolab.on_animation = {
    layers = {
      util.sprite_load("__space-age__/graphics/entity/biolab/biolab-anim",{
        frame_count = 32,
        scale = 0.7,
        animation_speed = 0.2,
        tint = {r=0.7,g=0.7,b=1}
      }),
      util.sprite_load("__space-age__/graphics/entity/biolab/biolab-lights",{
        frame_count = 32,
        draw_as_glow = true,
        blend_mode = "additive",
        scale = 0.7,
        animation_speed = 0.2,
        --tint = {r=0,g=0,b=0.2}
      }),
      util.sprite_load("__space-age__/graphics/entity/biolab/biolab-shadow",{
        frame_count = 32,
        scale = 0.7,
        animation_speed = 0.2,
        draw_as_shadow = true,
        --tint = {r=0,g=0,b=0.2}
      })
    }
  }
cryolab.off_animation = {
    layers = {
      util.sprite_load("__space-age__/graphics/entity/biolab/biolab-anim",{
        frame_count = 32,
        scale = 0.7,
        animation_speed = 0.2,
        tint = {r=0.7,g=0.7,b=1}
      }),
      util.sprite_load("__space-age__/graphics/entity/biolab/biolab-shadow",{
        frame_count = 32,
        scale = 0.7,
        animation_speed = 0.2,
        draw_as_shadow = true,
        --tint = {r=0,g=0,b=0.05}
      })
    }
  }

data:extend{cryolab}
--local resource_autoplace = require("resource-autoplace")
--local sounds = require("prototypes.entity.sounds")
local simulations = require("__base__.prototypes.factoriopedia-simulations")

local resource = require("__base__.prototypes.entity.resources")
data:extend {{
    type = "autoplace-control",
    category = "resource",
    name = "oxide-asteroid-chunk",
    localised_name = {"", "[item = oxide-asteroid-chunk]", {"item-name.oxide-asteroid-chunk"}},
    order = "e-0",
    richness = true
}}
data:extend {{
    type = "autoplace-control",
    category = "resource",
    name = "metallic-asteroid-chunk",
    localised_name = {"","[item = metallic-asteroid-chunk]" ,{"item-name.metallic-asteroid-chunk"}},
    order = "e-1",
    richness = true
}}
data:extend {{
    type = "autoplace-control",
    category = "resource",
    name = "carbonic-asteroid-chunk",
    localised_name = {"", "[item = carbonic-asteroid-chunk]", {"item-name.carbonic-asteroid-chunk"}},
    order = "e-2",
    richness = true
}}

-- local coral_variants = {}
-- for i = 1, 3 do
--     coral_variants[i] = {
--         filename = "__maraxsis__/graphics/icons/coral-" .. i .. ".png",
--         width = 64,
--         height = 64,
--         scale = 0.65,
--         flags = {"icon"},
--     }
-- end

local metal_ore = table.deepcopy(data.raw["resource"]["iron-ore"])
local carbon_ore = table.deepcopy(data.raw["resource"]["coal"])
local ice_ore = table.deepcopy(data.raw["resource"]["copper-ore"])

metal_ore.name = "metallic-asteroid-chunk"
carbon_ore.name = "carbonic-asteroid-chunk"
ice_ore.name = "oxide-asteroid-chunk"

metal_ore.icon = data.raw["item"]["metallic-asteroid-chunk"].icon
carbon_ore.icon = data.raw["item"]["carbonic-asteroid-chunk"].icon
ice_ore.icon = data.raw["item"]["oxide-asteroid-chunk"].icon

metal_ore.localised_name = {"item-name.metallic-asteroid-chunk"}
carbon_ore.localised_name = {"item-name.carbonic-asteroid-chunk"}
ice_ore.localised_name = {"item-name.oxide-asteroid-chunk"}


metal_ore.name = "metallic-asteroid-chunk"
carbon_ore.name = "carbonic-asteroid-chunk"
ice_ore.name = "oxide-asteroid-chunk"

ice_ore.map_color = {0.50, 0.50, 1}

ice_ore.stages =
{
  sheet =
  {
    filename = "__planet-muluna__/graphics/entities/oxide-asteroid-ore/oxide-asteroid-ore.png",
    priority = "extra-high",
    size = 128,
    frame_count = 8,
    variation_count = 8,
    scale = 0.5,
  }
}

local ice_ore_particle = table.deepcopy(data.raw["optimized-particle"]["copper-ore-particle"])

ice_ore_particle.pictures = {
    {
      filename = "__planet-muluna__/graphics/particle/ice-ore-particle/ice-ore-particle-1.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__planet-muluna__/graphics/particle/ice-ore-particle/ice-ore-particle-2.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__planet-muluna__/graphics/particle/ice-ore-particle/ice-ore-particle-3.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    },
    {
      filename = "__planet-muluna__/graphics/particle/ice-ore-particle/ice-ore-particle-4.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      scale = 0.5
    }
  }


-- local ice_ore = resource(
--     {
--       name = "ice",
--       order = "b",
--       map_color = {0.415, 0.525, 0.580},
--       mining_time = 1,
--       --walking_sound = sounds.ore,
--       --driving_sound = stone_driving_sound,
--       mining_visualisation_tint = {r = 0.895, g = 0.965, b = 1.000, a = 1.000}, -- #e4f6ffff
--       factoriopedia_simulation = simulations.factoriopedia_iron_ore,
--     },
--     {
--       base_density = 10,
--       regular_rq_factor_multiplier = 1.10,
--       starting_rq_factor_multiplier = 1.5,
--       candidate_spot_count = 62, -- To match 0.17.50 placement
--     }
--   )

metal_ore.minable.result = "metallic-asteroid-chunk"
carbon_ore.minable.result = "carbonic-asteroid-chunk"
ice_ore.minable.result = "oxide-asteroid-chunk"

metal_ore.minable.mining_time = 20
carbon_ore.minable.mining_time = 20
ice_ore.minable.mining_time = 20

metal_ore.autoplace.control = "metallic-asteroid-chunk"
carbon_ore.autoplace.control = "carbonic-asteroid-chunk"
ice_ore.autoplace.control = "oxide-asteroid-chunk"


-- ice_ore.autoplace = {
--     control = "ice",
--     default_enabled = false,
--     force = "neutral",
--     order = "z",
--     placement_density = 1,
--     probability_expression = "maraxsis_coral_ore",
--     richness_expression = [[var("control:maraxsis-coral:richness") * random_penalty(x, y, 9232 + (sqrt(x*x + y*y) / 10), 99, 1000)]],
-- }

data:extend{metal_ore,carbon_ore,ice_ore,ice_ore_particle}
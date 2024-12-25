local nauvis=data.raw["planet"]["nauvis"]
local nauvis_gen=nauvis.map_gen_settings
local map_gen={
    cliff_settings=
    {
        name = "cliff",
        control = "nauvis_cliff",
        cliff_smoothing = 0.5,
        cliff_elevation_0 = -0,
        cliff_elevation_interval = 5,
        richness = 1
      },
    autoplace_controls=
    {
        ["stone"] = {},
        ["rocks"] = {},
        ["nauvis_cliff"] = {},
        ["oxide-asteroid-chunk"] = {},
        ["metallic-asteroid-chunk"] = {},
        ["carbonic-asteroid-chunk"] = {},
      },
    autoplace_settings={
        ["tile"] =
      {
        settings =
        {
            ["muluna-dirt-1"]={},
            ["muluna-dirt-2"]={},
            ["muluna-dirt-3"]={},
            ["muluna-dirt-4"]={},
            ["muluna-dirt-5"]={},
            ["muluna-dirt-6"]={},
        }
      },
      ["decorative"] =
      {
        settings =
        {
          ["medium-rock"] = {},
          ["small-rock"] = {},
          ["tiny-rock"] = {},
          ["medium-sand-rock"] = {},
          ["small-sand-rock"] = {}
        }
      },
        ["entity"] =
      {
        settings =
        {
          ["stone"] = {},
          ["big-sand-rock"] = {},
          ["huge-rock"] = {},
          ["big-rock"] = {},
          ["oxide-asteroid-chunk"] = {},
            ["metallic-asteroid-chunk"] = {},
            ["carbonic-asteroid-chunk"] = {},
        }
      }
    }


}


local muluna= {
    type="planet",
    name="muluna",
    distance=nauvis.distance*1.05,
    draw_orbit=false,
    solar_power_in_space=nauvis.solar_power_in_space,
    auto_save_on_first_trip=true,
    order=nauvis.order .. "a",
    magnitude=nauvis.magnitude/2,
    orientation=nauvis.orientation-0.02,
    icon=nauvis.icon,
    surface_properties={
        ["solar-power"]=100,
        ["pressure"]=50,
        ["magnetic-field"]=0.01,
        ["day-night-cycle"]=nauvis.surface_properties["day-night-cycle"]*3
    },
    map_gen_settings=map_gen
}
local bot_power=0.2

muluna.surface_properties["gravity"]=muluna.surface_properties["pressure"]/100*bot_power

local muluna_connection = {
  type="space-connection",
  name="nauvis-muluna",
  from = "nauvis",
  to = "muluna",
  length = 1000

}


data:extend{muluna,muluna_connection}
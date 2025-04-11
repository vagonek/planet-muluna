data:extend{
    {
        type = "bool-setting",
        name = "override-space-connection",
        setting_type = "startup",
        default_value = false,
        order = "za",
      },
      {
        type = "bool-setting",
        name = "disable-muluna-music",
        setting_type = "startup",
        default_value = false,
        order = "zb",
      },
      {
        type = "bool-setting",
        name = "muluna-hardcore-restrict-crusher",
        setting_type = "startup",
        default_value = false,
        order = "ab",
      },
      {
        type = "bool-setting",
        name = "muluna-hardcore-restrict-asteroid-collector",
        setting_type = "startup",
        default_value = false,
        order = "ac",
      },
      {
        type = "bool-setting",
        name = "muluna-hardcore-require-helium-3-in-fusion-cell",
        setting_type = "startup",
        default_value = false,
        order = "ad",
      },
      {
        type = "bool-setting",
        name = "muluna-separate-shadows",
        setting_type = "startup",
        default_value = true,
        order = "ga",
      },
      {
        type = "int-setting",
        name = "space-science-pack-output",
        setting_type = "startup",
        default_value = 2,
        min = 1,
        max = 10,
        order = "ca",
      },
      {
        type = "double-setting",
        name = "space-science-pack-energy",
        setting_type = "startup",
        default_value = 7,
        min = 0.01,
        max = 60,
        order = "cb",
      },
    --   {
    --     type = "double-setting",
    --     name = "planet-power-consumption",
    --     setting_type = "startup",
    --     default_value = 300,
    --     minimum_value = 1,
    --     maximum_value = 1000,
    --     order = "a"
    -- },
    {
        type = "double-setting",
        name = "platform-power-consumption",
        setting_type = "startup",
        default_value = 100,
        minimum_value = 0.3,
        maximum_value = 1000,
        order = "bb"
    },
    {
      type = "bool-setting",
      name = "enable-nav-beacon",
      setting_type = "startup",
      default_value = true,
      order = "ba"
    },
    {
      type = "double-setting",
      name = "nav-beacon-update-ticks",
      setting_type="runtime-global",
      default_value = 60,
      minimum_value = 1,
      maximum_value = 360,
      order = "a",
    }
}

if mods["any-planet-start"] then
  APS.add_choice("muluna")
end

data:extend{
    {
        type = "bool-setting",
        name = "override-space-connection",
        setting_type = "startup",
        default_value = false,
        order = "aa",
      },
      {
        type = "bool-setting",
        name = "disable-muluna-music",
        setting_type = "startup",
        default_value = false,
        order = "ab",
      },
      {
        type = "int-setting",
        name = "space-science-pack-output",
        setting_type = "startup",
        default_value = 2,
        min = 1,
        max = 10,
        order = "ac",
      },
      {
        type = "double-setting",
        name = "space-science-pack-energy",
        setting_type = "startup",
        default_value = 7,
        min = 0.01,
        max = 60,
        order = "ad",
      },
}
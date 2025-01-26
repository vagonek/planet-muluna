-- Advanced space platform foundation

local space_platform_advanced = table.deepcopy(data.raw["tile"]["space-platform-foundation"])

space_platform_advanced.name = "advanced-space-platform-foundation"

space_platform_advanced.weight = space_platform_advanced.weight / 2

space_platform_advanced.minable.result = "advanced-space-platform-foundation"

--data:extend{space_platform_advanced}
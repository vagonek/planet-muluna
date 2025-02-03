local rro = require("lib.remove-replace-object")
local all = {}

local space_boiler = table.deepcopy(data.raw["item"]["boiler"])

space_boiler.name = "advanced-boiler"
space_boiler.place_result = "advanced-boiler"
space_boiler.icon="__hurricane-graphics__/graphics/thermal-plant/thermal-plant-icon.png"
space_boiler.localised_name = {"entity-name.advanced-boiler"}


local crusher_2 = table.deepcopy(data.raw["item"]["crusher"])

crusher_2.name = "crusher-2"
crusher_2.place_result = "crusher-2"
crusher_2.icon = "__planet-muluna__/graphics/icons/crusher-2.png"
crusher_2.localised_name = {"",{"item-name.crusher"}," 2"}
--local crusher_2=nil

local cryolab=table.deepcopy(data.raw["item"]["biolab"])

cryolab.name="cryolab"
cryolab.place_result= "cryolab"

cryolab.icons = {
    {
        icon=cryolab.icon,
        icon_size=cryolab.icon_size,
        scale=0.25,
        tint = {r=0.7,g=0.7,b=1}
    },
    
}

local space_platform_advanced = table.deepcopy(data.raw["item"]["space-platform-foundation"])
space_platform_advanced.place_as_tile.result = "advanced-space-platform-foundation"
space_platform_advanced.name = "advanced-space-platform-foundation"
space_platform_advanced.weight = space_platform_advanced.weight / 2

local space_chest = table.deepcopy(data.raw["item"]["steel-chest"])

space_chest=util.merge{space_chest,
    {
        name="space-chest",
        place_result="space-chest",
        icons = {
            {
            icon=space_chest.icon,
            icon_size=space_chest.icon_size,
            tint = {0.7,0.7,0.7},
            
            },
            
        },
        subgroup = "space-platform",
        order = "ca[space-chest]"
    }

}

data:extend{space_boiler,crusher_2,cryolab,space_chest}
local rro = require("lib.remove-replace-object")
local all = {}

local space_boiler = table.deepcopy(data.raw["item"]["boiler"])

space_boiler.name = "advanced-boiler"
space_boiler.place_result = "advanced-boiler"
space_boiler.icon="__planet-muluna__/graphics/thermal-plant/thermal-plant-icon.png"
space_boiler.localised_name = {"entity-name.advanced-boiler"}
space_boiler.order = "b[steam-power]-aa[advanced-boiler]"


local crusher_2 = table.deepcopy(data.raw["item"]["crusher"])

crusher_2.name = "crusher-2"
crusher_2.place_result = "crusher-2"
crusher_2.icon = "__planet-muluna__/graphics/icons/crusher-2.png"
crusher_2.localised_name = {"",{"item-name.crusher"}," 2"}
crusher_2.order = "cb[crusher-2]"
--local crusher_2=nil
if data.raw["item"]["biolab"] then
    local cryolab=table.deepcopy(data.raw["item"]["biolab"])

    cryolab.name="cryolab"
    cryolab.place_result= "cryolab"

    cryolab.icons = {
        {
            icon="__planet-muluna__/graphics/photometric-lab/photometric-lab-icon.png",
            icon_size=64,
            scale=0.25,
            --tint = {r=0.7,g=0.7,b=1}
        },
        
    }
    data:extend{cryolab}
end
    

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

local greenhouse = util.merge{table.deepcopy(data.raw["item"]["chemical-plant"]),
    {
        name = "muluna-greenhouse",
        icon = "__planet-muluna__/graphics/greenhouse/sprites/greenhouse-icon.png",
        icon_size = 64,
        --place_result = "muluna-greenhouse",
        order = "z[muluna-greenhouse]",
    }
    
}

local greenhouse_wood = util.merge{table.deepcopy(data.raw["item"]["chemical-plant"]),
    {
        name = "muluna-greenhouse-wood",
        icon = "__planet-muluna__/graphics/greenhouse/sprites/greenhouse-icon.png",
        icon_size = 64,
        place_result = "muluna-greenhouse-wood",
        order = "z[muluna-greenhouse]",
    }
    
}

data:extend{space_boiler,crusher_2,space_chest,greenhouse,greenhouse_wood}
local rro = require("lib.remove-replace-object")

local space_boiler = table.deepcopy(data.raw["item"]["boiler"])

space_boiler.name = "space-boiler"
space_boiler.place_result = "space-boiler"
space_boiler.localised_name = {"entity-name.space-boiler"}


-- local crusher_2 = table.deepcopy(data.raw["item"]["crusher"])

-- crusher_2.name = "crusher-2"
-- crusher_2.place_result = "crusher-2"
-- --crusher_2.localised_name = {"",{"item-name.crusher"}," 2"}
local crusher_2=nil

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

data:extend{space_boiler,cryolab}
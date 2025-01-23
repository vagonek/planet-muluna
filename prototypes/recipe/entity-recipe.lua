local rro = require("lib.remove-replace-object")

local space_boiler = table.deepcopy(data.raw["recipe"]["boiler"])

space_boiler.name = "space-boiler"
space_boiler.place_result = "space-boiler"
space_boiler.localised_name = {"entity-name.space-boiler"}
space_boiler.results = {{type = "item",name = "space-boiler",amount = 1}}

local crusher_2 = table.deepcopy(data.raw["recipe"]["crusher"])

crusher_2.surface_conditions=nil
crusher_2.name = "crusher-2"
--space_boiler.place_result = "space-boiler"
crusher_2.localised_name = {"",{"item-name.crusher"}," 2"}
crusher_2.ingredients = {
    {type = "item",name = "tungsten-plate",amount = 10},
    {type = "item",name = "uranium-235",amount = 10},
    {type = "item",name = "aluminum-plate",amount = 10},
    {type = "item",name = "crusher",amount = 1}
}
crusher_2.results = {{type = "item",name = "crusher-2",amount = 1}}



local cryolab = table.deepcopy(data.raw["recipe"]["biolab"])

cryolab.name="cryolab"
cryolab.category="cryogenics"
--cryolab.recipe_group="production"
--cryolab.subgroup="production-machine"

--cryolab.enabled=true
cryolab.icons=data.raw["item"]["cryolab"].icons
cryolab.localised_name={"entity-name.cryolab"}
cryolab.results = {{type = "item",name = "cryolab",amount = 1}}
cryolab.ingredients = {
    {type = "item", name = "quantum-processor", amount = 10},
    {type = "item", name = "biolab", amount = 1},
    {type = "item", name = "pipe", amount = 20},
    {type = "fluid", name = "fluoroketone-cold", amount = 100},
    {type = "item", name = "biter-egg", amount = 5},
    {type = "item", name = "pentapod-egg", amount = 5},
}
cryolab.surface_conditions = {
    {
        property = "temperature",
        max = 265,
    }
}

data:extend{space_boiler,crusher_2,cryolab}
local rro=require("lib.remove-replace-object")

local space_boiler=table.deepcopy(data.raw["item"]["boiler"])

space_boiler.name="space-boiler"
space_boiler.place_result="space-boiler"
space_boiler.localised_name={"entity-name.space-boiler"}


data:extend{space_boiler}
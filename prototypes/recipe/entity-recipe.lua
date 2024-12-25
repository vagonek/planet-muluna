local rro=require("lib.remove-replace-object")

local space_boiler=table.deepcopy(data.raw["recipe"]["boiler"])

space_boiler.name="space-boiler"
space_boiler.place_result="space-boiler"
space_boiler.localised_name={"entity-name.space-boiler"}
space_boiler.results={{type="item",name="space-boiler",amount=1}}




data:extend{space_boiler}
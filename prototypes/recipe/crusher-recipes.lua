local dual_icon = require("lib.dual-item-icon").dual_icon
local dual_icon_reversed = require("lib.dual-item-icon").dual_icon_reversed

local function crushing_icon(icon_dir,icon_size)
return {
    {
        icon = icon_dir,
        icon_size=64,
        --scale=0.3,
        shift = {0,-3},
        scale=50/128,
        draw_background = true
    },
    {
        icon = "__planet-muluna__/graphics/icons/generic-crushing.png",
        icon_size=64,
        scale=0.5,
        draw_background = true
    },
}
-- New icons
end
table.insert(data.raw["character"]["character"].crafting_categories,
"crushing"    

)

local anorthite_crushing = table.deepcopy(data.raw["recipe"]["oxide-asteroid-crushing"])
anorthite_crushing.name = "anorthite-crushing"


anorthite_crushing.icons = {
{
    icon = "__planet-muluna__/graphics/icons/anorthite-chunk.png",
    icon_size=64,
    --scale=0.3,
    shift = {0,-3},
    scale=50/128,
},
{
    icon = "__planet-muluna__/graphics/icons/asteroid-crushing.png",
    icon_size=64,
    scale=0.5,
},

}
anorthite_crushing.order="b-a-d"
anorthite_crushing.results = {{type = "item",name = "alumina",amount = 20},{type = "item", name = "anorthite-chunk", amount = 1, probability = 0.2}}
anorthite_crushing.ingredients = {{type = "item",name = "anorthite-chunk",amount = 1}}

-- anorthite_crushing.surface_conditions={
--     PlanetsLib.surface_conditions.restrict_to_surface("muluna")
-- }

local alumina_crushing=table.deepcopy(anorthite_crushing)
alumina_crushing.icons = {
    {
        icon = "__planet-muluna__/graphics/icons/scrap-metal-aluminium-1.png",
        icon_size=64,
        --scale=0.3,
        shift = {0,-3},
        scale=50/128,
    },
    {
        icon = "__planet-muluna__/graphics/icons/generic-crushing.png",
        icon_size=64,
        scale=0.5,
    },
}
alumina_crushing.name="alumina-crushing"
alumina_crushing.results = {{type = "item",name = "alumina-crushed",amount = 10},{type = "item", name = "alumina", amount = 1}}
alumina_crushing.ingredients = {{type = "item",name = "alumina",amount = 6}}

alumina_crushing.order="b-aa-a"
local stone_crushing=table.deepcopy(anorthite_crushing)

stone_crushing.results = {{type = "item",name = "stone-crushed",amount = 9},{type = "item", name = "stone", amount = 1,ignored_by_productivity=1}}
stone_crushing.ingredients = {{type = "item",name = "stone",amount = 7}}
stone_crushing.name="stone-crushing"
stone_crushing.energy_required=2
stone_crushing.order="b-aa-c"
stone_crushing.icons={
    {
        icon = data.raw.item["stone"].icon,
        icon_size=data.raw.item["stone"].icon_size,
        --scale=0.3,
        shift = {0,-3},
        scale=50/128,
    },
    {
        icon = "__planet-muluna__/graphics/icons/generic-crushing.png",
        icon_size=64,
        scale=0.5,
    },
}


local aluminum_plate = table.deepcopy(data.raw["recipe"]["iron-plate"])
aluminum_plate.ingredients = {{type = "item",name = "alumina",amount = 1}}
aluminum_plate.results = {{type = "item",name = "aluminum-plate",amount = 1}}
aluminum_plate.name = "aluminum-plate"
aluminum_plate.enabled = false

local aluminum_cable = table.deepcopy(data.raw["recipe"]["copper-cable"])

aluminum_cable.name = "aluminum-cable"
aluminum_cable.ingredients = {{type = "item",name = "aluminum-plate",amount = 1}}
aluminum_cable.auto_recycle = false

aluminum_cable.localised_name = {"item-name.aluminum-cable"}
aluminum_cable.icons = dual_icon("copper-cable","aluminum-plate")
aluminum_cable.subgroup="muluna-products"
aluminum_cable.allow_decomposition = false
aluminum_cable.allow_as_intermediate = false
--aluminum_cable.results = {{type = "item",name = "aluminum-cable",amount = 2}}

-- table.insert(data.raw["technology"]["asteroid-productivity"].effects, {
--     effect = "enable-recipe",
--     recipe = ""
-- })


local wood_crushing = table.deepcopy(anorthite_crushing)
wood_crushing.name = "wood-crushing"
wood_crushing.ingredients = {{type = "item",name = "wood",amount = 6}}
wood_crushing.results = {{type = "item",name = "wood-crushed",amount = 10},{type = "item", name = "wood", amount = 1,ignored_by_productivity=1}}
wood_crushing.icons=crushing_icon(data.raw.item["wood"].icon,data.raw.item["wood"].icon_size)
wood_crushing.order="b-aa-b"
data:extend{anorthite_crushing,alumina_crushing,stone_crushing,aluminum_plate,aluminum_cable,wood_crushing}
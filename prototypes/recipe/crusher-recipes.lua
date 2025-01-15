



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
    icon = "__planet-muluna__/graphics/icons/generic-crushing.png",
    icon_size=64,
    scale=0.5,
},

}
anorthite_crushing.order=anorthite_crushing.order .. "a"
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

local stone_crushing=table.deepcopy(anorthite_crushing)

stone_crushing.results = {{type = "item",name = "stone-crushed",amount = 9},{type = "item", name = "stone", amount = 1,ignored_by_productivity=1}}
stone_crushing.ingredients = {{type = "item",name = "stone",amount = 7}}
stone_crushing.name="stone-crushing"
stone_crushing.energy_required=2
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





-- table.insert(data.raw["technology"]["asteroid-productivity"].effects, {
--     effect = "enable-recipe",
--     recipe = ""
-- })

data:extend{anorthite_crushing,alumina_crushing,stone_crushing}
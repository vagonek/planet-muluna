local anorthite_crushing = table.deepcopy(data.raw["recipe"]["metallic-asteroid-crushing"])
anorthite_crushing.name = "anorthite-crushing"

anorthite_crushing.icons = {
{
    icon = "__planet-muluna__/graphics/icons/anorthite-chunk.png",
    icon_size=64,
    --scale=0.3,
    shift = {-3.5,-3.5},
    scale=50/128,
},
{
    icon = "__planet-muluna__/graphics/icons/generic-crushing.png",
    icon_size=64,
    scale=0.5,
},

}
anorthite_crushing.order=anorthite_crushing.order .. "a"
anorthite_crushing.localised_description={"recipe-description.placeholder"}
anorthite_crushing.results = {{type = "item",name = "alumina",amount = 20},{type = "item", name = "anorthite-chunk", amount = 1, probability = 0.2}}
anorthite_crushing.ingredients = {{type = "item",name = "anorthite-chunk",amount = 1}}


local alumina_crushing=table.deepcopy(anorthite_crushing)
alumina_crushing.icons = {
    {
        icon = "__planet-muluna__/graphics/icons/scrap-metal-aluminium-1.png",
        icon_size=64,
        --scale=0.3,
        shift = {-3.5,-3.5},
        scale=50/128,
    },
    {
        icon = "__planet-muluna__/graphics/icons/generic-crushing.png",
        icon_size=64,
        scale=0.5,
    },
}
alumina_crushing.name="alumina-crushing"
alumina_crushing.results = {{type = "item",name = "alumina-crushed",amount = 10},{type = "item", name = "alumina", amount = 1, probability = 0.2}}
alumina_crushing.ingredients = {{type = "item",name = "alumina",amount = 5}}



data:extend{anorthite_crushing,alumina_crushing}
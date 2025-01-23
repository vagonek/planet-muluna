local rro = require("lib.remove-replace-object")
--local  = require("lib.remove-replace-object")
local i_lunar_pack = table.deepcopy(data.raw["tool"]["space-science-pack"])

local r_lunar_pack = table.deepcopy(data.raw["recipe"]["space-science-pack"])

local t_lunar_pack = table.deepcopy(data.raw["technology"]["space-science-pack"])

local all = {i_lunar_pack,r_lunar_pack,t_lunar_pack}


for _,entity in pairs(all) do
    entity.name = "interstellar-science-pack"
    entity.localised_name = {"item-name.interstellar-science-pack"}
    entity.localised_description = nil
end



i_lunar_pack.name = "interstellar-science-pack"

i_lunar_pack.icon = "__planet-muluna__/graphics/icons/space-science-pack.png"
r_lunar_pack.icon = "__planet-muluna__/graphics/icons/space-science-pack.png"
data.raw["recipe"]["space-science-pack"].icon = "__planet-muluna__/graphics/icons/space-science-pack.png"
t_lunar_pack.icon = "__planet-muluna__/graphics/technology/space-science-pack.png"

t_lunar_pack.prerequisites = {
    "electromagnetic-science-pack",
    "agricultural-science-pack",
    "metallurgic-science-pack"

}
i_lunar_pack.order = "ja"

r_lunar_pack.results = {{type = "item", name = "interstellar-science-pack", amount = 3}}
r_lunar_pack.main_product = "interstellar-science-pack"
r_lunar_pack.category = "crafting-with-fluid"
r_lunar_pack.ingredients = {
    {type = "fluid", name = "helium", amount = 100},
    {type = "item", name = "rocket-fuel", amount = 3},
    {type = "item", name = "aluminum-plate", amount = 3},
    {type = "item", name = "uranium-235", amount = 3}
}


t_lunar_pack.research_trigger = nil

t_lunar_pack.unit = {}

t_lunar_pack.unit.ingredients = {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"chemical-science-pack", 1},
    {"production-science-pack", 1},
    {"utility-science-pack", 1},
    {"space-science-pack", 1},
    {"metallurgic-science-pack", 1},
    {"agricultural-science-pack", 1},
    {"electromagnetic-science-pack", 1},
    --{"cryogenic-science-pack", 1},
    --{"interstellar-science-pack",1}
}

t_lunar_pack.unit.count = 1000
t_lunar_pack.unit.time= 60

t_lunar_pack.effects = {
    {type = "unlock-recipe", recipe = "interstellar-science-pack"}
}
local r_lunar_pack_4 = table.deepcopy(r_lunar_pack)
r_lunar_pack_4.name = "interstellar-science-pack-helium-4"
r_lunar_pack.main_product = "interstellar-science-pack"
r_lunar_pack_4.ingredients = {
    {type = "fluid", name = "helium-4", amount = 100},
    {type = "item", name = "rocket-fuel", amount = 2},
    {type = "item", name = "aluminum-plate", amount = 2},
    {type = "item", name = "uranium-235", amount = 2}
}

r_lunar_pack_4.localised_name = nil



data:extend(all)
data:extend{r_lunar_pack_4}
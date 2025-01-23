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

r_lunar_pack.results = {{type = "item", name = "interstellar-science-pack", amount = 1}}
r_lunar_pack.main_product = "interstellar-science-pack"

t_lunar_pack.research_trigger = nil

t_lunar_pack.unit = {}

t_lunar_pack.unit.ingredients = data.raw["technology"]["planet-discovery-aquilo"].unit.ingredients

t_lunar_pack.unit.count = 1000
t_lunar_pack.unit.time= 60

t_lunar_pack.effects = {
    {type = "unlock-recipe", recipe = "interstellar-science-pack"}
}

data:extend(all)
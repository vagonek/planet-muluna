local rro=require("lib.remove-replace-object")


for _,tech in pairs(data.raw["technology"]) do
    if tech.prerequisites then
        rro.replace(tech.prerequisites,"space-platform-thruster","space-science-pack")
    end
    
end

data.raw["recipe"]["crusher"].subgroup = "smelting-machine"
data.raw["item"]["crusher"].subgroup = "smelting-machine"
data.raw["assembling-machine"]["crusher"].subgroup = "smelting-machine"
data.raw["item"]["crusher"].order = "ca[crusher]"


--replace_object(data.raw["technology"]["space-science-pack"].prerequisites,"space-platform-thruster","space-platform")
rro.replace(data.raw["technology"]["space-science-pack"].prerequisites,"space-platform","crusher")
table.insert(data.raw["technology"]["space-science-pack"].prerequisites,"advanced-boiler")
table.insert(data.raw["technology"]["space-science-pack"].prerequisites,"greenhouses")
-- table.insert(data.raw["technology"]["space-platform-thruster"].effects,{
--     type="unlock-space-location",
--     space_location="muluna"
-- })
rro.remove(data.raw["technology"]["space-platform-thruster"].effects,{
    type="unlock-recipe",
    recipe="ice-melting"
})

table.insert(data.raw["technology"]["space-platform-thruster"].effects,{
    type="unlock-recipe",
    recipe="rocket-part-muluna"
})
data.raw["technology"]["space-platform-thruster"].unit=nil


if mods["aai-signal-transmission"] then
    rro.replace(data.raw["technology"]["space-platform-thruster"].prerequisites,"space-science-pack","aai-signal-transmission")
    data.raw["technology"]["space-platform-thruster"].research_trigger = {
        type="build-entity",
        entity="aai-signal-receiver"
    }
    rro.replace(data.raw["technology"]["aai-signal-transmission"].prerequisites,"space-science-pack","space-platform")
    rro.remove(data.raw["technology"]["aai-signal-transmission"].unit.ingredients,{"space-science-pack",1})
else
    table.insert(data.raw["technology"]["space-platform-thruster"].prerequisites,"space-platform")
   
    data.raw["technology"]["space-platform-thruster"].research_trigger = data.raw["technology"]["space-platform"].research_trigger
    table.insert(data.raw["technology"]["space-platform-thruster"].prerequisites,"space-platform")
end

--rro.remove(data.raw["technology"]["space-platform-thruster"].unit.ingredients,{"space-science-pack",1})





local rocket_prod=data.raw["technology"]["rocket-part-productivity"]

if data.raw.technology["rocket-part-productivity"] then
    table.insert(data.raw.technology["rocket-part-productivity"].effects, {
        type = "change-recipe-productivity",
        recipe = "rocket-part-muluna",
        change = 0.1,
        hidden = true
    })
end

local rocket_prod_aquilo=table.deepcopy(rocket_prod)

rocket_prod.max_level=nil
rro.replace(rocket_prod.unit.ingredients,{"cryogenic-science-pack",1},{"space-science-pack",1})
rro.replace(rocket_prod.prerequisites,"cryogenic-science-pack","space-science-pack")
rocket_prod.unit.count=500
rocket_prod.unit.count_formula=nil
--rocket_prod.localised_name={"technology-name.rocket-part-productivity-muluna"}
rocket_prod.localised_name={"",{"technology-name.rocket-part-productivity-muluna"}," ",tostring(1)}
local science_pack = {
    "metallurgic-science-pack",
    "agricultural-science-pack",
    "electromagnetic-science-pack",
}
local planet_name = {
    "vulcanus",
    "gleba",
    "fulgora"
}

--Rocket productivity technologies
--Levels 1-2 available on Muluna
--After Level 2, rocket productivity technology becomes non-linear, 
--two more levels remain on muluna and the first three vanilla planets
--After 10 levels, remaining rocket prod comes from Aquilo, as normal.

for i = 2,4,1 do --Lunar rocket prod 2-4
    local tech = table.deepcopy(rocket_prod)
    tech.name=rocket_prod.name .. "-" .. tostring(i)
    tech.unit.count=i*rocket_prod.unit.count
    tech.localised_name={"",{"technology-name.rocket-part-productivity-muluna"}," ",tostring(i)}
    if i ~=2 then
        tech.prerequisites={rocket_prod.name .. "-" .. tostring(i-1)}
    else 
        tech.prerequisites={rocket_prod.name}
    end
    if i==4 then
        table.insert(rocket_prod_aquilo.prerequisites,tech.name)
    end
    data:extend{tech}
end

--local t2_planet_rocket_prod={}

for i,pack in ipairs(science_pack) do --T1 Planet rocket prod 1-2
    local tech= table.deepcopy(rocket_prod)
    tech.name=rocket_prod.name .. "-".. planet_name[i]
    tech.localised_name={"",{"technology-name.rocket-part-productivity-"..planet_name[i]}," ",tostring(1)}
    rro.replace(tech.prerequisites,"space-science-pack",science_pack[i])
    --table.insert(tech.prerequisites,pack)
    table.insert(tech.unit.ingredients,{science_pack[i],1})
    tech.prerequisites={"rocket-part-productivity-2",science_pack[i]}
    tech.unit.count=1000

    local tech_2=table.deepcopy(tech)
    tech_2.name=tech_2.name .. "-2"
    tech_2.unit.count=2000
    tech_2.prerequisites={tech.name}
    tech_2.localised_name={"",{"technology-name.rocket-part-productivity-"..planet_name[i]}," ",tostring(2)}
    --table.insert(t2_planet_rocket_prod,tech_2.name)
    table.insert(rocket_prod_aquilo.prerequisites,tech_2.name)
    data:extend{tech,tech_2}
end

rocket_prod_aquilo.name="rocket-part-productivity-aquilo"
rro.replace(data.raw["cargo-landing-pad"]["cargo-landing-pad"].surface_conditions,
{
    property = "gravity",
    min = 1,
},
{
    property = "gravity",
    min = 0.1,
}
)
rocket_prod_aquilo.localised_name={"technology-name.rocket-part-productivity"}
table.insert(rocket_prod_aquilo.unit.ingredients,{"space-science-pack",1})
-- for entry in ipairs(t2_planet_rocket_prod) do
--     table.insert(rocket_prod_aquilo.prerequisites,entry)
-- end

data:extend{rocket_prod_aquilo}


--Removing asteroid collector,crusher, and asteroid crushing from space platform tech
local space_platform=data.raw["technology"]["space-platform"]
-- rro.remove(space_platform.effects,{type="unlock-recipe",recipe="asteroid-collector"})
-- rro.remove(space_platform.effects,{type="unlock-recipe",recipe="crusher"})
-- rro.remove(space_platform.effects,{type="unlock-recipe",recipe="metallic-asteroid-crushing"})
-- rro.remove(space_platform.effects,{type="unlock-recipe",recipe="carbonic-asteroid-crushing"})
-- rro.remove(space_platform.effects,{type="unlock-recipe",recipe="oxide-asteroid-crushing"})

if mods["aai-signal-transmission"] then
    space_platform.effects = table.deepcopy(data.raw["technology"]["aai-signal-transmission"].effects)
    rro.remove(space_platform.effects,{type="unlock-recipe",recipe="aai-signal-receiver"})
    rro.remove(data.raw["technology"]["aai-signal-transmission"].effects,{type="unlock-recipe",recipe="aai-signal-sender"})
    data.raw["technology"]["aai-signal-transmission"].unit=nil
    data.raw["technology"]["aai-signal-transmission"].research_trigger = {
        --type="send-item-to-orbit",
        type="build-entity",
        --item="aai-signal-sender"
        entity="aai-signal-sender"
    }
else
    space_platform.effects = nil
end

data.raw["technology"]["space-science-pack"].research_trigger = {
    type="build-entity",
    entity="crusher"
}

data.raw["technology"]["space-science-pack"].localised_description={"technology-description.space-science-pack"}
data.raw["recipe"]["space-science-pack"].energy_required=settings.startup["space-science-pack-energy"].value --7 by default


--Moves rocket silo science packs down to prereqs, makes rocket silo into a trigger technology.
local techs_change={"logistic-robotics","rocket-fuel","processing-unit","advanced-material-processing-2","low-density-structure"}
for _,technology in pairs(techs_change) do
    if data.raw["technology"][technology] then
        data.raw["technology"][technology].unit.count = data.raw.technology[technology].unit.count + 200
    end
    
end

data.raw.technology["rocket-silo"].unit=nil
data.raw.technology["rocket-silo"].research_trigger={
    type="craft-item",
    item="logistic-robot",
    count=100,
}

table.insert(data.raw.technology["logistic-robotics"].effects,{
    type="unlock-recipe",
    recipe="requester-chest",
})

rro.remove(data.raw.technology["logistic-system"].effects,{
    type="unlock-recipe",
    recipe="requester-chest",
})

data.raw["technology"]["logistic-system"].unit.count=300

table.insert(data.raw["technology"]["rocket-part-productivity"].prerequisites,"production-science-pack")

table.insert(data.raw["technology"]["advanced-asteroid-processing"].prerequisites,"advanced-stone-processing")
--table.insert(data.raw["technology"]["asteroid-reprocessing"].prerequisites,"advanced-stone-processing")

table.insert(data.raw["technology"]["wood-gas-processing"].prerequisites,"greenhouses")
rro.replace(data.raw["recipe"]["wood-gasification"].ingredients, {type = "item", name = "wood", amount = 10}, {type = "item", name = "cellulose", amount = 15})
rro.replace(data.raw["recipe"]["advanced-wood-gasification"].ingredients, {type = "item", name = "wood", amount = 20}, {type = "item", name = "cellulose", amount = 30})
data.raw["technology"]["wood-gas-processing"].unit = nil
data.raw["technology"]["wood-gas-processing"].research_trigger = {
    type="mine-entity",
    entity="lunar-rock"
}
data.raw["technology"]["advanced-wood-gas-processing"].unit = {
    count = 500,
    time = 60,
    ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        --{"interstellar-science-pack",1},
    }
}
data.raw["technology"]["wood-gas-processing-to-crude-oil"].unit = {
    count = 500,
    time = 60,
    ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        --{"utility-science-pack", 1},
        {"space-science-pack", 1},
        --{"interstellar-science-pack",1},
    }
}

table.insert(data.raw["technology"]["wood-gas-processing"].effects, {
    type = "unlock-recipe",
    recipe="plastic-from-wood"
})
table.insert(data.raw["technology"]["wood-gas-processing"].effects, {
    type = "unlock-recipe",
    recipe="wood-crushing"
})
table.insert(data.raw["technology"]["wood-gas-processing"].effects, {
    type = "unlock-recipe",
    recipe="cellulose"
})
-- table.insert(data.raw["technology"]["wood-gas-processing"].effects, {
--     type = "unlock-recipe",
--     recipe="cellulose"
-- })

--table.insert(data.raw["technology"]["advanced-wood-gas-processing"].prerequisites,"interstellar-science-pack")
--table.insert(data.raw["technology"]["wood-gas-processing-to-crude-oil"].prerequisites,"interstellar-science-pack")

data.raw["recipe"]["wood-greenhouse"].energy_required=10*60
data.raw["recipe"]["wood-seed-greenhouse"].energy_required=10*60
data.raw["recipe"]["wood-greenhouse"].surface_conditions={{property = "oxygen",min=1}}
data.raw["recipe"]["jellynut-seed-greenhouse"].energy_required=5*60
data.raw["recipe"]["yumako-seed-greenhouse"].energy_required=5*60
rro.remove(data.raw["technology"]["wood-gas-processing"].effects,{type = "unlock-recipe", recipe = "greenhouse"})
rro.remove(data.raw["technology"]["agriculture"].effects,{type = "unlock-recipe", recipe = "greenhouse"})
data.raw["recipe"]["greenhouse"] = nil
data.raw["item"]["I-greenhouse"] = nil
data.raw["assembling-machine"]["E-greenhouse"].minable = {mining_time = 0.5}
data.raw["assembling-machine"]["E-greenhouse"].localised_name = {"entity-name.n-deprecated",{"entity-name.E-greenhouse"}}
local seed_recipes = {"jellynut","yumako"}

for _,seed in pairs(seed_recipes) do
    data.raw["recipe"][seed.."-seed-greenhouse"].surface_conditions = {{property = "oxygen",min=1}}--,{property = "pressure", min = 2000, max = 2000}}
end


--data.raw["item"]["E-greenhouse"]=nil
-- data.raw["recipe"]["greenhouse"].enabled = false

-- table.insert(data.raw["technology"]["tree-seeding"].effects, {
--     type = "unlock-recipe",
--     recipe="greenhouse"
-- })

data.raw["tool"]["space-science-pack"].default_import_location = "muluna"

data.raw["item"]["copper-cable"].localised_name = {"item-name.copper-cable"}


rro.soft_insert(data.raw["technology"]["coal-liquefaction"].effects, {type = "unlock-recipe", recipe = "coal-synthesis"})

if settings.startup["muluna-hardcore-restrict-crusher"].value == true then
    data.raw["recipe"]["crusher"].surface_conditions = {{property = "oxygen", max = 0, min = 0},{property = "gravity", max = 0.1, min = 0.1}}
    table.insert(data.raw["recipe"]["crusher"].ingredients, {type = "item", name = "aluminum-plate", amount = 10})
end

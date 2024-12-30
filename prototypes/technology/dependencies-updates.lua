local rro=require("lib.remove-replace-object")


for _,tech in pairs(data.raw["technology"]) do
    if tech.prerequisites then
        rro.replace(tech.prerequisites,"space-platform-thruster","space-science-pack")
    end
    
end

rro.replace(data.raw["technology"]["space-platform-thruster"].prerequisites,"space-science-pack","aai-signal-transmission")
--replace_object(data.raw["technology"]["space-science-pack"].prerequisites,"space-platform-thruster","space-platform")
rro.replace(data.raw["technology"]["space-science-pack"].prerequisites,"space-platform","crusher")
table.insert(data.raw["technology"]["space-science-pack"].prerequisites,"space-boiler")
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
data.raw["technology"]["space-platform-thruster"].research_trigger = {
    type="build-entity",
    entity="aai-signal-receiver"
}

rro.replace(data.raw["technology"]["aai-signal-transmission"].prerequisites,"space-science-pack","space-platform")
rro.remove(data.raw["technology"]["aai-signal-transmission"].unit.ingredients,{"space-science-pack",1})
--rro.remove(data.raw["technology"]["space-platform-thruster"].unit.ingredients,{"space-science-pack",1})



local rocket_prod=data.raw["technology"]["rocket-part-productivity"]
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
data.raw["technology"]["space-science-pack"].research_trigger = {
    type="build-entity",
    entity="crusher"
}





local rro = require("lib.remove-replace-object")
for k, type in ipairs({"furnace"}) do
    for i,entity in ipairs(data.raw[type]) do
        if entity.surface_conditions then
            for j,property in ipairs(entity.surface_conditions) do
                if property.property == "pressure" and property.min == 10 then
                    property.min = 55
                end
            end 
        end
        
    end
end

local ten_pressure_condition =
{
  {
    property = "oxygen",
    min = 1
  }
}


data.raw["recipe"]["thruster-fuel"].surface_conditions = nil
data.raw["recipe"]["thruster-oxidizer"].surface_conditions = nil
data.raw["recipe"]["advanced-thruster-fuel"].surface_conditions = nil
data.raw["recipe"]["advanced-thruster-oxidizer"].surface_conditions = nil

data.raw["fluid-turret"]["flamethrower-turret"].surface_conditions = ten_pressure_condition
data.raw["furnace"]["stone-furnace"].surface_conditions = ten_pressure_condition
data.raw["mining-drill"]["burner-mining-drill"].surface_conditions = ten_pressure_condition
data.raw["furnace"]["steel-furnace"].surface_conditions = ten_pressure_condition
data.raw["boiler"]["boiler"].surface_conditions = ten_pressure_condition
--data.raw["roboport"]["roboport"].surface_conditions = ten_pressure_condition
data.raw["inserter"]["burner-inserter"].surface_conditions = ten_pressure_condition


data.raw["assembling-machine"]["crusher"].surface_conditions = nil
--  {
--     {property = "gravity",
--     min = 0,
--     max = 0.1,
--     }   
-- }

local rocket_part_muluna = table.deepcopy(data.raw["recipe"]["rocket-part"])
rocket_part_muluna.name = "rocket-part-muluna"
rocket_part_muluna.surface_conditions = {
    {property = "gravity",
    max = 5,
    }   
}

rocket_part_muluna.results = {{type = "item", name = "rocket-part", amount = 1}}

rocket_part_muluna.localised_name = {"item-name.rocket-part"}


-- data.raw["recipe"]["rocket-part"].surface_conditions = {
--     {property = "gravity",
--     min = 5.01,
--     }
-- }

data.raw.recipe["rocket-part"].ingredients =
{
  {type = "item", name = "processing-unit", amount = 2},
  {type = "item", name = "low-density-structure", amount = 2},
  {type = "item", name = "rocket-fuel", amount = 2}
}
if mods["maraxsis"] then
    data.raw.recipe["rocket-part"].ingredients =
    {
    {type = "item", name = "processing-unit", amount = 2},
    {type = "item", name = "low-density-structure", amount = 2},
    {type = "item", name = "rocket-fuel", amount = 2}
    }
end




data:extend{rocket_part_muluna}

for _, silo in pairs(data.raw["rocket-silo"]) do
    if silo.fixed_recipe == "rocket-part" then
        silo.fixed_recipe = nil
        silo.disabled_when_recipe_not_researched = true
    end
end

data.raw.recipe["space-science-pack"].surface_conditions = {
    {property = "gravity",
    min = 0.1,
    max = 0.1,
    },
    {property = "oxygen",
    min = 0,
    max = 0,
    },
}

rro.replace(data.raw["technology"]["planet-discovery-vulcanus"].prerequisites,"space-science-pack","asteroid-collector")
rro.replace(data.raw["technology"]["planet-discovery-gleba"].prerequisites,"space-science-pack","asteroid-collector")
rro.replace(data.raw["technology"]["planet-discovery-fulgora"].prerequisites,"space-science-pack","asteroid-collector")

data.raw.recipe["space-science-pack"].results[1].amount = 1


for _,pack in pairs(data.raw["tool"]) do
    local recipe = data.raw["recipe"][pack.name]
    if recipe then
        if recipe.surface_conditions == nil then
            recipe.surface_conditions = {
                {property = "oxygen",
                    min = 1,
                },
            }
        end
    end
end

for _,tech in pairs(data.raw["technology"]) do --Adds placeholder icon to technologies without icon
    if tech.icon == nil then
        tech.icon = data.raw["technology"]["space-science-pack"].icon
    end
end

if not(mods["maraxsis"]) then
    data:extend {{
        type = "item-subgroup",
        name = "maraxsis-atmosphere-barreling",
        order = "ff",
        group = "intermediate-products",
    }}
    
    for recipe, category in pairs {
        ["empty-maraxsis-atmosphere-barrel"] = "chemistry",
        ["maraxsis-atmosphere-barrel"] = "chemistry",
        --["empty-maraxsis-liquid-atmosphere-barrel"] = "cryogenics",
        --["maraxsis-liquid-atmosphere-barrel"] = "cryogenics",
    } do
        local recipe = data.raw.recipe[recipe]
        recipe.hidden_in_factoriopedia = false
        recipe.category = category
        recipe.subgroup = "maraxsis-atmosphere-barreling"
    end
    data.raw.recipe["empty-maraxsis-atmosphere-barrel"].results[1].temperature = 25
    
end

local planets = {
    "arrakis",
    "tiber"
}

for _,planet in pairs(planets) do
    if data.raw["technology"]["planet-discovery-"..planet] then
        rro.replace(data.raw["technology"]["planet-discovery-"..planet].prerequisites,"space-science-pack","asteroid-collector")
    end
    
end

--data.raw["tool"]["space-science-pack"].localised_name = {"item-name.lunar-science-pack"}
--data.raw["technology"]["space-science-pack"].localised_name = {"item-name.lunar-science-pack"}
--data.raw["technology"]["space-science-pack"].localised_description = {"technology-description.lunar-science-pack"}

data.raw["tool"]["space-science-pack"].icon = "__planet-muluna__/graphics/icons/space-science-pack.png"
data.raw["recipe"]["space-science-pack"].icon = "__planet-muluna__/graphics/icons/space-science-pack.png"
data.raw["tool"]["space-science-pack"].icons = nil



local nauvis = data.raw["planet"]["nauvis"]
if mods["Tiered-Solar-System"] then
    data.raw["planet"]["muluna"].orientation = nauvis.orientation-0.01
    data.raw["planet"]["muluna"].distance = nauvis.distance*0.90
-- else
--     data.raw["planet"]["muluna"].orbit.orientation = nauvis.orientation-0.02
--     data.raw["planet"]["muluna"].orbit.distance = nauvis.distance*1.0
end

for _,silo in pairs(data.raw["rocket-silo"]) do
    silo.crafting_speed = silo.crafting_speed/2
end

if mods["maraxsis"] then
    for _,tech in pairs(data.raw["technology"]) do
        if string.find(tech.name,"rocket-part-productivity-",0,true) then
            table.insert(tech.effects,{
                type = "change-recipe-productivity",
                recipe = "maraxsis-rocket-part",
                change = 0.1,
                hidden = false
            })
        end
    end 
    
    for _,ingredient in pairs(data.raw["recipe"]["maraxsis-rocket-part"].ingredients) do
        ingredient.amount = ingredient.amount*2
    end
    
end

table.insert(data.raw["technology"]["space-platform"].effects,{
    type = "unlock-recipe",
    recipe = "cargo-bay"
})

require("compat.orbital-ion-cannon")

local one_gravity_condition =
{
  {
    property = "gravity",
    min = 0.1
  }
}

data.raw["spider-vehicle"]["spidertron"].surface_conditions = one_gravity_condition
data.raw["legacy-curved-rail"]["legacy-curved-rail"].surface_conditions = one_gravity_condition
data.raw["legacy-straight-rail"]["legacy-straight-rail"].surface_conditions = one_gravity_condition
data.raw["locomotive"]["locomotive"].surface_conditions = one_gravity_condition
data.raw["cargo-wagon"]["cargo-wagon"].surface_conditions = one_gravity_condition
data.raw["fluid-wagon"]["fluid-wagon"].surface_conditions = one_gravity_condition
data.raw["artillery-wagon"]["artillery-wagon"].surface_conditions = one_gravity_condition
data.raw["train-stop"]["train-stop"].surface_conditions = one_gravity_condition
data.raw["rail-signal"]["rail-signal"].surface_conditions = one_gravity_condition
data.raw["rail-chain-signal"]["rail-chain-signal"].surface_conditions = one_gravity_condition
data.raw["curved-rail-b"]["curved-rail-b"].surface_conditions = one_gravity_condition
data.raw["curved-rail-a"]["curved-rail-a"].surface_conditions = one_gravity_condition
data.raw["half-diagonal-rail"]["half-diagonal-rail"].surface_conditions = one_gravity_condition
data.raw["straight-rail"]["straight-rail"].surface_conditions = one_gravity_condition

data.raw["rail-ramp"]["rail-ramp"].surface_conditions = one_gravity_condition
data.raw["elevated-straight-rail"]["elevated-straight-rail"].surface_conditions = one_gravity_condition
data.raw["elevated-half-diagonal-rail"]["elevated-half-diagonal-rail"].surface_conditions = one_gravity_condition
data.raw["elevated-curved-rail-a"]["elevated-curved-rail-a"].surface_conditions = one_gravity_condition
data.raw["elevated-curved-rail-b"]["elevated-curved-rail-b"].surface_conditions = one_gravity_condition
data.raw["rail-support"]["rail-support"].surface_conditions = one_gravity_condition

--Overrides any mods which add their own techs to space platform thruster as a prereq.
--Moves prereq to asteroid collector, which is roughly equivalent to space platform thruster's place in the vanilla tech tree.
local new_prereqs={}
for _,technology in pairs(data.raw["technology"]["space-platform-thruster"].prerequisites) do
    
    if technology ~= "afterburner" and technology ~= "aai-signal-transmission" then
        --rro.remove(data.raw["technology"]["space-platform-thruster"].prerequisistes,technology)
        table.insert(data.raw["technology"]["asteroid-collector"].prerequisites,technology)
    else
        table.insert(new_prereqs,technology)
    end

end
data.raw["technology"]["space-platform-thruster"].prerequisites = new_prereqs

if data.raw["tool"]["alien-science-pack"] then
    data.raw["tool"]["alien-science-pack"].order="fa[alien-science-pack]"
end
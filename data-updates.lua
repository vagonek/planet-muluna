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
if data.raw["assembling-machine"]["crusher-2"] then
    data.raw["assembling-machine"]["crusher-2"].surface_conditions = nil
end

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
data.raw.recipe["interstellar-science-pack"].surface_conditions = data.raw.recipe["space-science-pack"].surface_conditions

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
    "tiber",
    "nauvis",
}

for _,planet in pairs(planets) do
    if data.raw["technology"]["planet-discovery-"..planet] then
        rro.replace(data.raw["technology"]["planet-discovery-"..planet].prerequisites,"space-science-pack","asteroid-collector")
        rro.replace(data.raw["technology"]["planet-discovery-"..planet].prerequisites,"space-platform-thruster","asteroid-collector")
    end
    
end

table.insert(data.raw["technology"]["planet-discovery-aquilo"].prerequisites,"interstellar-science-pack")
--table.insert(data.raw["technology"]["promethium-science-pack"].prerequisites,"interstellar-science-pack")
--data.raw["tool"]["space-science-pack"].localised_name = {"item-name."}
--data.raw["technology"]["space-science-pack"].localised_name = {"item-name.lunar-science-pack"}
--data.raw["technology"]["space-science-pack"].localised_description = {"technology-description.lunar-science-pack"}


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




if data.raw["technology"]["rocket-fuel-productivity"] then
    table.insert(data.raw["technology"]["rocket-fuel-productivity"].effects,{
        type = "change-recipe-productivity",
        recipe = "rocket-fuel-aluminum",
        change = 0.1,
        hidden = false
    })
end


if data.raw["technology"]["asteroid-productivity"] then
    table.insert(data.raw["technology"]["asteroid-productivity"].effects,{
        type = "change-recipe-productivity",
        recipe = "anorthite-crushing",
        change = 0.1,
        hidden = false
    })
end

for i = 1,10,1 do --For compatibility with Roc's hardcore tech tree.
    if data.raw["technology"]["asteroid-productivity-"..tostring(i)] then
        table.insert(data.raw["technology"]["asteroid-productivity-"..tostring(i)].effects,{
            type = "change-recipe-productivity",
            recipe = "anorthite-crushing",
            change = 0.1,
            hidden = false
        })
    end
    if data.raw["technology"]["rocket-fuel-productivity-"..tostring(i)] then
        table.insert(data.raw["technology"]["rocket-fuel-productivity-"..tostring(i)].effects,{
            type = "change-recipe-productivity",
            recipe = "rocket-fuel-aluminum",
            change = 0.1,
            hidden = false
        })   
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



if data.raw["tool"]["alien-science-pack"] then
    data.raw["tool"]["alien-science-pack"].order="fa[alien-science-pack]"
end

if data.raw.planet["lignumis"] == nil then
    data.raw.planet["nauvis"].localised_description={"planetslib-templates.planet-description-one-moon",{"space-location-description.nauvis"},"[planet=muluna]"}
else
    data.raw.planet["lignumis"].localised_description={"planetslib-templates.moon-description",{"space-location-description.lignumis"},"[planet=nauvis]"}
    data.raw.planet["nauvis"].localised_description={"planetslib-templates.planet-description-two-moons",{"space-location-description.nauvis"},"[planet=muluna]","[planet=lignumis]"}
end

require("prototypes.entity.cryolab")

for _,lab in pairs(data.raw["lab"]) do
    if lab.name ~= "cerys-lab" then
        table.insert(lab.inputs,"interstellar-science-pack")
    end
end


--Modifies values of gas fluids in Maraxsis entities to follow Factorio 2.0's convention of gas fluid units having 1/10 the matter of liquid fluid units(As in water vs. steam)
if mods["maraxsis"] then
    data.raw["recipe"]["maraxsis-water"].ingredients = {
        {type="fluid",name="maraxsis-hydrogen",amount=2000},
        {type="fluid",name="maraxsis-oxygen",amount=1000},
    }
    data.raw["recipe"]["maraxsis-hydrolox-rocket-fuel"].ingredients = {
        {type="fluid",name="maraxsis-hydrogen",amount=2000},
        {type="fluid",name="maraxsis-oxygen",amount=2000},
    }
    rro.replace(data.raw["recipe"]["maraxsis-deepsea-research-utility-science-pack"].ingredients,
    {type="fluid",name="maraxsis-hydrogen",amount=200},
    {type="fluid",name="maraxsis-hydrogen",amount=2000}
    )
    
    rro.replace(data.raw["recipe"]["maraxsis-deepsea-research-production-science-pack"].ingredients,
    {type="fluid",name="maraxsis-oxygen",amount=100},
    {type="fluid",name="maraxsis-oxygen",amount=1000}
    )
    rro.replace(data.raw["recipe"]["maraxsis-salt"].results,
    {type="fluid",name="maraxsis-oxygen",amount=100},
    {type="fluid",name="maraxsis-oxygen",amount=1000}
    )
    rro.replace(data.raw["recipe"]["maraxsis-salt"].results,
    {type="fluid",name="maraxsis-hydrogen",amount=200},
    {type="fluid",name="maraxsis-hydrogen",amount=2000}
    )
    data.raw["fluid"]["maraxsis-hydrogen"].fuel_value="225kJ"
    data.raw["item"]["maraxsis-hydrogen-barrel"].fuel_value="11.3MJ"
    
end

require("compat.modules-t4")
require("compat.corrundum")
require("compat.maraxsis")
require("compat.tenebris")

local parent_planet = "nauvis"
if mods["any-planet-start"] then 
    local parent_planet = settings.startup["aps-planet"].value
end

PlanetsLib:update
    {
        type = "planet",
        name = "muluna",
        asteroid_spawn_definitions = data.raw["planet"][parent_planet].asteroid_spawn_definitions,
        
    }

if data.raw["technology"]["planet-discovery-maraxsis"] then
    table.insert(data.raw["technology"]["planet-discovery-maraxsis"].prerequisites,"interstellar-science-pack")
end


table.insert(data.raw["recipe"]["fusion-power-cell"].ingredients, {type = "item", name = "helium-3-barrel", amount = 1})

table.insert(data.raw["technology"]["fusion-reactor"].prerequisites, "helium-enrichment")

local techs_interstellar = {
    "planet-discovery-aquilo", "planet-discovery-maraxsis", "planet-discovery-tenebris", "promethium-science-pack",
    "research-productivity", "maraxsis-promethium-productivity", "research-speed-infinite", "fusion-reactor", "railgun"
}

for _,tech in pairs(techs_interstellar) do
    if data.raw["technology"][tech] then
        table.insert(data.raw["technology"][tech].unit.ingredients,{"interstellar-science-pack",1})
    end
    
end

local space_science_pack_advanced = table.deepcopy(data.raw["recipe"]["space-science-pack"])

space_science_pack_advanced.surface_conditions = PlanetsLib.restrict_to_surface("space-platform")

data:extend{space_science_pack_advanced}
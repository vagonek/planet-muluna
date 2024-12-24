
for k, type in ipairs({"furnace"}) do
    for i,entity in ipairs(data.raw[type]) do
        if entity.surface_conditions then
            for j,property in ipairs(entity.surface_conditions) do
                if property.property=="pressure" and property.min==10 then
                    property.min=55
                end
            end 
        end
        
    end
end

local ten_pressure_condition =
{
  {
    property = "pressure",
    min = 55
  }
}





data.raw["fluid-turret"]["flamethrower-turret"].surface_conditions = ten_pressure_condition
data.raw["furnace"]["stone-furnace"].surface_conditions = ten_pressure_condition
data.raw["mining-drill"]["burner-mining-drill"].surface_conditions = ten_pressure_condition
data.raw["furnace"]["steel-furnace"].surface_conditions = ten_pressure_condition
data.raw["boiler"]["boiler"].surface_conditions = ten_pressure_condition
--data.raw["roboport"]["roboport"].surface_conditions = ten_pressure_condition
data.raw["inserter"]["burner-inserter"].surface_conditions = ten_pressure_condition


data.raw["assembling-machine"]["crusher"].surface_conditions = {
    {property="gravity",
    min=0,
    max=0.1,
    }   
}

local rocket_part_muluna=table.deepcopy(data.raw["recipe"]["rocket-part"])
rocket_part_muluna.name="rocket-part-muluna"
rocket_part_muluna.surface_conditions = {
    {property="gravity",
    max=5,
    }   
}

rocket_part_muluna.results = {{type="item", name="rocket-part", amount=1}}

rocket_part_muluna.localised_name={"item-name.rocket-part"}


-- data.raw["recipe"]["rocket-part"].surface_conditions = {
--     {property="gravity",
--     min=5.01,
--     }
-- }

data.raw.recipe["rocket-part"].ingredients =
{
  {type = "item", name = "processing-unit", amount = 2},
  {type = "item", name = "low-density-structure", amount = 2},
  {type = "item", name = "rocket-fuel", amount = 2}
}

rocket_part_muluna.enabled=true

data:extend{rocket_part_muluna}

for _, silo in pairs(data.raw["rocket-silo"]) do
    if silo.fixed_recipe == "rocket-part" then
        silo.fixed_recipe = nil
        silo.disabled_when_recipe_not_researched = true
    end
end

data.raw.recipe["space-science-pack"].surface_conditions = {
    {property="gravity",
    min=0.1,
    max=0.1,
    },
    {property="pressure",
    min=50,
    max=50,
    },
}

data.raw.recipe["space-science-pack"].results[1].amount=1


for _,pack in pairs(data.raw["tool"]) do
    local recipe = data.raw["recipe"][pack.name]
    if recipe.surface_conditions == nil then
        recipe.surface_conditions={
            {property="gravity",
                min=0.2,
                --max=0.1,
            },
            {property="pressure",
                min=55,
                --max=50,
            },
        }
    end
end
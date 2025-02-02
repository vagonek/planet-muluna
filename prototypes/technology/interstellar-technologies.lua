local rro = require("lib.remove-replace-object")
-- Runs once during data and once during data-updates
-- This is done in each step to:
-- Data stage: To allow other mods to propogate changes from this code to their mod's technologies.
-- Data-updates stage: To add science packs to technologies that might not exist by this mod's data stage.


local techs_interstellar = {
    "planet-discovery-aquilo", "planet-discovery-maraxsis", "planet-discovery-tenebris", "promethium-science-pack",
    "research-productivity", "maraxsis-promethium-productivity", "research-speed-infinite", "fusion-reactor", "railgun", "planet-discovery-naufulglebunusilo",
    "platinum-thruster", "space-steam-production", "maraxsis-abyssal-diving-gear", "railgun-damage-1", "railgun-shooting-speed-1",
    "orbital-ion-cannon-mk2","orbital-ion-cannon-mk2-upgrade",
    "planet-discovery-secretas", "spaceship-scrap-recycling-productivity",
    
}

local techs_asteroid = {"trace-oxide-processing","trace-carbonic-processing","trace-metallic-processing",
    "promethium-advanced-processing"}

for _,tech in pairs(techs_interstellar) do
    if data.raw["technology"][tech] then
        rro.soft_insert(data.raw["technology"][tech].unit.ingredients,{"interstellar-science-pack",1}) --Add science pack if it doesn't already exist.
        rro.soft_insert(data.raw["technology"][tech].prerequisites,"interstellar-science-pack") --Add science pack if it doesn't already exist.
    end
    
end

for _,tech in pairs(techs_asteroid) do
    if data.raw["technology"][tech] then
        rro.soft_insert(data.raw["technology"][tech].unit.ingredients,{"interstellar-science-pack",1}) --Add science pack if it doesn't already exist.
        rro.soft_insert(data.raw["technology"][tech].prerequisites,"crusher-2") --Add science pack if it doesn't already exist.
    end
    
end
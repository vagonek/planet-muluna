local rro = require("lib.remove-replace-object")
-- Runs once during data and once during data-updates
-- This is done in each step to:
-- Data stage: To allow other mods to propogate changes from this code to their mod's technologies.
-- Data-updates stage: To add science packs to technologies that might not exist by this mod's data stage.


local techs_interstellar = {
    "planet-discovery-aquilo", "planet-discovery-maraxsis", "planet-discovery-tenebris", "promethium-science-pack",
    "research-productivity", "maraxsis-promethium-productivity", "research-speed-infinite", "fusion-reactor", "railgun", "planet-discovery-naufulglebunusilo",
    "platinum-thruster"
}

for _,tech in pairs(techs_interstellar) do
    if data.raw["technology"][tech] then
        rro.soft_insert(data.raw["technology"][tech].unit.ingredients,{"interstellar-science-pack",1}) --Add science pack if it doesn't already exist.
    end
    
end
if mods["bztitanium"] or mods["bzcarbon"] or mods["bztin"] or mods["bzlead"] or mods["bzzirconium"] or mods["bzsilicon"] then
    require("prototypes.recipe.vanilla-alternate-recipes")
end

require("prototypes.technology.interstellar-technologies")

local rro = require("lib.remove-replace-object")

--Overrides any mods which add their own techs to space platform thruster as a prereq.
--Moves prereq to asteroid collector, which is roughly equivalent to space platform thruster's place in the vanilla tech tree.
local new_prereqs={}


for _,silo in pairs(data.raw["rocket-silo"]) do
    silo.crafting_speed = silo.crafting_speed/2
    if silo.module_slots then 
        silo.module_slots = silo.module_slots * 2
    end
end


for _,technology in pairs(data.raw["technology"]["space-platform-thruster"].prerequisites) do
    
    if technology ~= "afterburner" and technology ~= "aai-signal-transmission" and technology ~= "space-platform" then
        --rro.remove(data.raw["technology"]["space-platform-thruster"].prerequisistes,technology)
        rro.soft_insert(data.raw["technology"]["asteroid-collector"].prerequisites,technology)
    else
        rro.soft_insert(new_prereqs,technology)
    end

end
data.raw["technology"]["space-platform-thruster"].prerequisites = new_prereqs



--Doubles the change associated with infinite rocket part productivity technology.
--Also adds support in case Hardcore is installed.
if data.raw["technology"]["rocket-part-productivity-aquilo"] then
    for _,effect in pairs(data.raw["technology"]["rocket-part-productivity-aquilo"].effects) do 
        effect.change = effect.change * 2
    end
    --game.print("Error: Technology \"rocket-part-productivity-aquilo\" deleted by another mod. Please report this error to MeteorSwarm.")
end

for i = 1,10,1 do 
    if data.raw["technology"]["rocket-part-productivity-aquilo-"..tostring(i)] then
        for _,effect in pairs(data.raw["technology"]["rocket-part-productivity-aquilo-"..tostring(i)].effects) do 
            effect.change = effect.change * 2
        end
        --game.print("Error: Technology \"rocket-part-productivity-aquilo\" deleted by another mod. Please report this error to MeteorSwarm.")
    end
end





if data.raw["technology"]["planet-discovery-nauvis"] then
    rro.replace(data.raw["technology"]["planet-discovery-nauvis"].prerequisites,"space-platform-thruster","asteroid-collector")
end

data.raw["lab"]["cryolab"].inputs = data.raw["lab"]["biolab"].inputs

-- if mods["metal-and-stars"] then
--     data.raw["technology"]["space-chest"] = nil
-- end

data.raw["recipe"]["copper-cable"].localised_name={"recipe-name.copper-cable"}

require("compat.aai-industry")

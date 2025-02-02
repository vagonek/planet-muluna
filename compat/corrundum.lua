local rro = require("lib.remove-replace-object")
if data.raw["technology"]["planet-discovery-corrundum"] then
    rro.replace(data.raw["technology"]["planet-discovery-corrundum"].prerequisites,"space-science-pack","asteroid-collector")
    if data.raw["boiler"]["red-boiler"] then
        data.raw["boiler"]["red-boiler"].surface_conditions = {
            {
                property="oxygen",
                min=1,
            }
        }
    end
end
-- if data.raw["technology"]["platinum-thruster"] then
--     rro.soft_insert(data.raw["technology"]["platinum-thruster"].prerequisites,"interstellar-science-pack")
-- end


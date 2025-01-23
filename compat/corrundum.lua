if data.raw["technology"]["planet-discovery-corrundum"] then
    --table.insert(data.raw["technology"]["planet-discovery-corrundum"].prerequisites,"interstellar-science-pack")
    if data.raw["boiler"]["red-boiler"] then
        data.raw["boiler"]["red-boiler"].surface_conditions = {
            {
                property="oxygen",
                min=1,
            }
        }
    end
end


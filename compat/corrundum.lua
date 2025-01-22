if data.raw["boiler"]["red-boiler"] then
    data.raw["boiler"]["red-boiler"].surface_conditions = {
        {
            property="oxygen",
            min=1,
        }
    }
end
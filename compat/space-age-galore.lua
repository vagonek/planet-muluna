if data.raw["recipe"]["vgal-uranium-235-space-science-pack"] then
    data.raw["recipe"]["vgal-uranium-235-space-science-pack"].surface_conditions = 
    data.raw["recipe"]["space-science-pack"].surface_conditions
    data.raw["recipe"]["vgal-uranium-235-space-science-pack"].results[1].amount = 
    data.raw["recipe"]["space-science-pack"].results[1].amount*10
end
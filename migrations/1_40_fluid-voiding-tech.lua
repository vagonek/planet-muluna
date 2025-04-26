for _,force in pairs(game.forces) do 
    if force.technologies["asteroid-collector"].researched == true then
        force.technologies["muluna-gas-venting"].researched = true
        --force.technologies["thruster-fuel"].researched = true
        -- if force.technologies["metallurgic-science-pack"].researched == true then
        --     force.technologies["rocket-part-productivity-vulcanus"].researched = true
        --     force.technologies["rocket-part-productivity-vulcanus-2"].researched = true
        -- end

        -- if force.technologies["planet-discovery-aquilo"].researched == true then
        --     --force.technologies["interstellar-science-pack"].researched = true
        --     force.technologies["advanced-space-science-pack"].researched = true
        --     force.technologies["thruster-fuel-productivity"].researched = true
        --     force.technologies["thruster-fuel-productivity"].level = 6
        -- end
    end
end
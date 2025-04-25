for _,force in pairs(game.forces) do 
    if force.technologies["planet-discovery-muluna"].researched == true then
        if force.technologies["wood-gas-processing"].researched == true then
            force.technologies["muluna-greenhouses"].researched = true
            force.technologies["muluna-wood-cultivation"].researched = true
            --force.technologies["muluna-anorthite-processing"].researched = true
        end

        if force.technologies["muluna-anorthite-processing"].researched == true then
            force.technologies["muluna-alumina-processing"].researched = true
            force.technologies["muluna-aluminum-processing"].researched = true
            force.technologies["muluna-alice-propellant"].researched = true
        end

        if force.technologies["oxide-asteroid-crushing"].researched == true then
            force.technologies["muluna-oxygen"].researched = true
            
        end

        if force.technologies["carbonic-asteroid-crushing"].researched == true then
            force.technologies["muluna-advanced-boiler"].researched = true
            
        end

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
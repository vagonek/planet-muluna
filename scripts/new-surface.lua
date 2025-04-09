local Public = {}

local function random_place(surface,entity)

    local x = math.random(-128,128)
    local y = math.random(-128,128)
    local entity = {name = entity, position = {x,y}, force = "neutral"}
    if surface.can_place_entity(entity) == false then
        entity.position[1] = entity.position[1] + math.random(-8,8)
        entity.position[2] = entity.position[2] + math.random(-8,8) 
    end
    surface.create_entity(entity)
end

function Public.on_new_surface(muluna_index)
-- 3 crushers
-- 10 solar panels
-- 10 medium poles
-- 10 accumulators
-- game.print(muluna_index)
-- if game.planets["muluna"].surface then
--     game.print(game.planets["muluna"].surface.index)
-- end

    if game.planets["muluna"].surface and game.planets["muluna"].surface.index == muluna_index then
        -- game.print("Muluna created")
        local muluna = game.planets["muluna"].surface
        
        for i = 1,4 do
            random_place(muluna,"crusher")
        end
        for i = 1,4 do
            random_place(muluna,"electric-furnace")
        end
        for i = 1,20 do
            random_place(muluna,"solar-panel")
        end
        for i = 1,10 do
            random_place(muluna,"medium-electric-pole")
        end
        for i = 1,10 do
            random_place(muluna,"lunar-rock")
        end
        -- for i = 1,10 do
        --     random_place(muluna,"accumulator")
        -- end
        
    end




end

return Public
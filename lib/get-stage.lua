local Public = {}

function Public.get_stage() 
    --based on lib.lua in Maraxsis
    local stage
    if data and data.raw and not data.raw.item["iron-plate"] then
        stage = "settings"
    elseif data and data.raw then
        stage = "data"
    elseif script then
        stage = "control"
    else
        error("Could not determine load order stage.")
    end

end

return Public
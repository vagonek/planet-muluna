local Public = {}

function Public.dual_icon(item_1,item_2)
    local icon = {}
    if data.raw["item"][item_1].icon then
        icon[1]={
            icon=data.raw["item"][item_1].icon,
            icon_size=data.raw["item"][item_1].icon_size,
            scale=0.35
        }
        if data.raw["item"][item_1].icon_size then
            icon[1].scale=icon[1].scale * 64 /data.raw["item"][item_1].icon_size
        end
    else
        icon[1]={
            icon=data.raw["item"][item_1].icons[1].icon,
            icon_size=data.raw["item"][item_1].icons[1].icon_size,
            scale=0.35
        }
    end
    if data.raw["item"][item_1].icon then
        icon[2]={
            icon=data.raw["item"][item_2].icon,
            icon_size=data.raw["item"][item_2].icon_size,
            scale=0.30,
            shift = {10,-10},
            }
            if data.raw["item"][item_2].icon_size then
                icon[2].scale=icon[2].scale* 64 /data.raw["item"][item_2].icon_size
            end
    else
        icon[2]={
            icon=data.raw["item"][item_2].icons[1].icon,
            icon_size=data.raw["item"][item_2].icons[1].icon_size,
            scale=0.30,
            shift = {10,-10},
            }
    end
    
    
    return icon
end




return Public
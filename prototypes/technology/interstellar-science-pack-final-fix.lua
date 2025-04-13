-- This section replaces the interstellar science pack technology with multiple technologies 
-- with the collective effect being that you unlock the interstellar science pack upon unlocking two planetary science packs.
-- Technologies that require at least two interplanetary science packs will have these new technologies added to their prereqs, and
-- technologies with one interplanetary science pack have their prerequisite removed.
local rro = require("lib.remove-replace-object")



local function dynamic_interstellar_pack_icon(pack1,pack2)
    return {
        {
            icon = "__muluna-graphics__/graphics/technology/space-science-pack.png",
            icon_size = 256,
        },
        {
            icon = data.raw["tool"][pack1].icon,
            icon_size = data.raw["tool"][pack1].icon_size,
            shift = {35,-35},
            scale=0.75,
        },
        {
            icon = data.raw["tool"][pack2].icon,
            icon_size=data.raw["tool"][pack2].icon_size,
            --scale=0.3,
            shift = {-35,-35},
            scale=0.75,
        },

    }

end

local function dynamic_interstellar_pack_tech_name(pack1,pack2)
    return "interstellar-science-pack".. "-" .. pack1 .. "-" .. pack2
end

local function dynamic_interstellar_pack_tech(pack1,pack2)
    local new_pack = table.deepcopy(data.raw["technology"]["interstellar-science-pack"])
    new_pack = util.merge{new_pack,
    {
        name = dynamic_interstellar_pack_tech_name(pack1,pack2),
        icons = dynamic_interstellar_pack_icon(pack1,pack2),
        localised_description = {"technology-description.interstellar-science-pack"}
    },
    
    }   
    new_pack.icon = nil
    rro.soft_insert(new_pack.prerequisites, pack1)
    rro.soft_insert(new_pack.prerequisites, pack2)
    return new_pack
end

local science_packs = {}
local possible_science_packs = 
{
    "metallurgic-science-pack",
    "agricultural-science-pack",
    "electromagnetic-science-pack",
    "electrochemical-science-pack",
    --"janus-time-science-pack",
    "slp-sun-pack",
    "nanite-science-pack",
    --"insulation-science-pack",
    "battlefield-science-pack",
}

for _,pack in pairs(possible_science_packs) do 
    if data.raw["tool"][pack] then
        table.insert(science_packs,pack)
    end
end

local endgame_techs = {
    "maraxsis-promethium-productivity",
    "research-speed-infinite",
    "science-pack-productivity",
}

for i = 1, #science_packs - 1 do
    for j = i + 1, #science_packs do
        local item1 = science_packs[i]
        local item2 = science_packs[j]
        assert(item1 ~= nil, item2 ~= nil,item1 .. item2)
        local has_as_prerequisite = false
        
        for _,tech in pairs(data.raw["technology"]) do
            if tech.unit and rro.contains(tech.unit.ingredients,{"interstellar-science-pack",1}) then
                if not rro.contains(endgame_techs,tech.name) 
                    and tech.ensure_all_packs_from_vanilla_lab == nil 
                    and rro.contains(tech.unit.ingredients,{item1,1}) 
                    and rro.contains(tech.unit.ingredients,{item2,1}) then
                    rro.soft_insert(tech.prerequisites,dynamic_interstellar_pack_tech_name(item1,item2))
                    has_as_prerequisite = true
                end
                rro.remove(tech.prerequisites,"interstellar-science-pack")
            end
            if tech.unit and rro.contains(tech.unit.ingredients,{"interstellar-science-pack",1})  and (tech.prerequisites == {} or tech.prerequisites == nil) then
                tech.prerequisites = {}
                tech.prerequisites = {"space-science-pack"}
                if rro.contains(tech.unit.ingredients,{"utility-science-pack",1}) then
                    rro.soft_insert(tech.prerequisites,"utility-science-pack")
                end
                if rro.contains(tech.unit.ingredients,{"production-science-pack",1}) then
                    rro.soft_insert(tech.prerequisites,"production-science-pack")
                end
            end
        end
        if has_as_prerequisite then data:extend{dynamic_interstellar_pack_tech(item1,item2)} end
    end
end

data.raw["technology"]["interstellar-science-pack"] = nil
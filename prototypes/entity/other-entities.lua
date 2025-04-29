if settings.startup["muluna-hardcore-remove-steam-furnaces"].value == false then
    for _,name in pairs({"steel-furnace","stone-furnace"}) do

    local steam_furnace = table.deepcopy(data.raw["furnace"][name])

    steam_furnace = util.merge{steam_furnace ,
        {
            name = "muluna-steam-".. name,
        }




    }

    steam_furnace.minable.result = "muluna-steam-".. name
    steam_furnace.surface_conditions = nil
    -- data:extend{
    --     type = "fuel-category",
    --     name = "steam",

    -- }

    steam_furnace.energy_source = {
        type = 'fluid',
        --fuel_categories = { fluid_name },
        maximum_temperature = 500,
        --burns_fluid = burns,
        scale_fluid_usage = true,
        effectivity = 0.35,
        fluid_box = {
            production_type = "input",
            filter = "steam",
            volume = 50,
            base_area = 1,
            height = 2,
            base_level = -1,
            pipe_connections = {
                { flow_direction = "input-output", direction = defines.direction.east, position = {0.59, -0.5}},
                { flow_direction = "input-output", direction = defines.direction.west, position = {-0.59, -0.5}}
            },
            --pipe_picture = images.pipe_picture,
            --pipe_covers = images.pipe_covers,
        }
    }

    local recipe = table.deepcopy(data.raw["recipe"][name])
    recipe.name = "muluna-steam-".. name
    recipe.ingredients = {
        {type = "item", name = name, amount = 1},
        {type = "item", name = "pipe", amount = 4},
    }
    recipe.results = {{type = "item", name = "muluna-steam-".. name, amount = 1}}
    if name == "stone-furnace" then recipe.enabled = true


    else 
        table.insert(data.raw["technology"]["advanced-material-processing"].effects,
        {
            type = "unlock-recipe",
            recipe = "muluna-steam-".. name
        }
    )
    end



    local item = table.deepcopy(data.raw["item"][name])
    local steam_icon = {
        icon = data.raw["fluid"]["steam"].icon,
        icon_size = data.raw["fluid"]["steam"].icon_size,
        scale = 0.25,
        shift = {10,-10},
        draw_background = true,
    }
    if item.icons then
        table.insert(item.icons,steam_icon)
    else
        item.icons = {
            {
                icons = data.raw["item"][name].icons,
                icon = data.raw["item"][name].icon,
                icon_size = 64,
            },
            steam_icon
        }
    end

    item.name = "muluna-steam-".. name
    item.place_result = "muluna-steam-".. name
    item.order = item.order .. "a"

    data:extend{steam_furnace,recipe,item}

    end

    -- data:extend{
    --     util.merge{),
    --     {
    --         name = "muluna-steam-".. name,
    --         ingredients = {
    --             {}
    --         }
    --     }
    --     }
    -- }
end
local steam_furnace = table.deepcopy(data.raw["furnace"]["steel-furnace"])

steam_furnace = util.merge{steam_furnace ,
    {
        name = "muluna-steam-steel-furnace",
    }




}

steam_furnace.minable.result = "muluna-steam-steel-furnace"
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
    effectivity = 0.25,
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

local recipe = table.deepcopy(data.raw["recipe"]["steel-furnace"])
recipe.name = "muluna-steam-steel-furnace"
recipe.ingredients = {
    {type = "item", name = "steel-furnace", amount = 1},
    {type = "item", name = "pipe", amount = 4},
}
recipe.results = {{type = "item", name = "muluna-steam-steel-furnace", amount = 1}}

table.insert(data.raw["technology"]["advanced-material-processing"].effects,
    {
        type = "unlock-recipe",
        recipe = "muluna-steam-steel-furnace"
    }
)

local item = table.deepcopy(data.raw["item"]["steel-furnace"])

item.icons = {
    {
        icon = data.raw["item"]["steel-furnace"].icon,
        icon_size = 64,
    },
    {
        icon = data.raw["fluid"]["steam"].icon,
        icon_size = data.raw["fluid"]["steam"].icon_size,
        scale = 0.25,
        shift = {10,-10},
        draw_background = true,
    }
}

item.name = "muluna-steam-steel-furnace"
item.place_result = "muluna-steam-steel-furnace"
item.order = item.order .. "a"

data:extend{steam_furnace,recipe,item}

-- data:extend{
--     util.merge{),
--     {
--         name = "muluna-steam-steel-furnace",
--         ingredients = {
--             {}
--         }
--     }
--     }
-- }
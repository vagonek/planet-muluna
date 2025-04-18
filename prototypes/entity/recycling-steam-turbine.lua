local rro = require("lib.remove-replace-object")

local turbine =data.raw["generator"]["steam-turbine"]
local fusion_generator = data.raw["fusion-generator"]["fusion-generator"]

local recycling_turbine=util.merge{table.deepcopy(fusion_generator),

    {
        name = "muluna-cycling-steam-turbine",
        max_fluid_usage = 1,
    }

}

recycling_turbine.input_fluid_box = util.merge{table.deepcopy(recycling_turbine.input_fluid_box),
    {
        filter = "steam",
        minimum_temperature=165,
        maximum_temperature=1000,
    }
    

}

recycling_turbine.output_fluid_box = util.merge{table.deepcopy(recycling_turbine.output_fluid_box),
    {
        filter = "cooled-steam",
        temperature = 100,
    }
    
}

recycling_turbine.energy_source.output_flow_limit = "6MW"




-- recycling_turbine.input_fluid_box.filter = "steam"
-- recycling_turbine.output_fluid_box.filter = "water"
recycling_turbine.minable.result = "muluna-cycling-steam-turbine"

local cooled_steam = util.merge{table.deepcopy(data.raw["fluid"]["steam"]),
    {
        name = "cooled-steam",
        default_temperature = 100,
    }


}





data:extend{recycling_turbine,cooled_steam}


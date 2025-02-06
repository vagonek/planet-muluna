

--_G.maraxsis = require "scripts.constants"
--muluna={}
--require("lib.control-stage")
local sd = require("scripts.project-seadragon")


--muluna.finalize_events()

-- script.on_nth_tick(60,function(event)
--     local map_gen_settings = game.planets.muluna.surface.map_gen_settings
--     --map_gen_settings.autoplace_settings.entity.settings["anorthite-chunk"] == nil
--     if map_gen_settings.autoplace_settings.entity.settings["anorthite-chunk"] == nil then
--       map_gen_settings.autoplace_controls["anorthite-chunk"] = {}
--       map_gen_settings.autoplace_settings.entity.settings["anorthite-chunk"] = {}
--       game.planets.muluna.surface.map_gen_settings = map_gen_settings
--       game.planets.muluna.surface.regenerate_entity("anorthite-chunk")
--     end
-- end) 

script.on_event(defines.events.on_built_entity, function(event)
    sd.on_built_rocket_silo(event)
end)





if script.active_mods["gvv"] then require("__gvv__.gvv")() end
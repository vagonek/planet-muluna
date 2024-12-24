
--Shamelessly taken from Maraxsis 
script.on_event(defines.events.on_built_entity, function(event)
    local entity = event.entity
    if not entity.valid then return end
    
    local prototype = entity.name == "entity-ghost" and entity.ghost_prototype or entity.prototype
    
    if prototype.type ~= "rocket-silo" then return end
    if not prototype.crafting_categories["rocket-building"] then return end

    if entity.get_recipe() then return end
    if entity.surface.name == "muluna" then
        
        entity.recipe_locked = false
        entity.set_recipe("rocket-part-muluna")
        entity.recipe_locked = true
    else
        entity.recipe_locked = false
        entity.set_recipe("rocket-part")
        entity.recipe_locked = true
    end
end)

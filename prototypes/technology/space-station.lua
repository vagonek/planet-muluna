local function technology_icon_constant_planet(technology_icon,icon_size)
    local icons =
    {
      {
        icon = technology_icon,
        icon_size = 1482,
      },
      {
        icon = "__core__/graphics/icons/technology/constants/constant-planet.png",
        icon_size = 128,
        scale = 0.5,
        shift = {50, 50}
      }
    }
    return icons
  end

data:extend{
    -- {
    --     type = "technology",
    --     name = "planet-discovery-muluna",
    --     unit= {
    --         count = 500,
    --         time = 60,
    --         ingredients = data.raw["technology"]["rocket-silo"].unit.ingredients
    --     },
    --     prerequisites = {
    --         "space-science-pack"
    --     },
    --     effects = {
    --         {
    --             type = "unlock-space-location",
    --             space_location = "muluna"
    --         }
    --     },
        
    -- },
    {
        type = "technology",
        name = "asteroid-collector",
        localised_name = {"entity-name.asteroid-collector"},
        localised_description = {"entity-description.asteroid-collector"},
        unit= {
            count = 300,
            time = 60,
            ingredients = data.raw["technology"]["planet-discovery-vulcanus"].unit.ingredients
        },
        effects = {
            {
                type = "unlock-recipe",
                recipe = "asteroid-collector"
            }
        },
        prerequisites = {
            "space-science-pack"
        },
        icon = "__planet-muluna__/graphics/technology/asteroid-collector(ai-upscaled).png",
        icon_size=256,
    },
    -- {
    --     type = "technology",
    --     name = "cargo-bay",
    --     localised_name = {"entity-name.cargo-bay"},
    --     unit = {
    --         count = 100,
    --         time = 60,
    --         ingredients = data.raw["technology"]["planet-discovery-vulcanus"].unit.ingredients
    --     },
    --     effects = {
    --         {
    --             type = "unlock-recipe",
    --             recipe = "cargo-bay"
    --         }
    --     },
    --     prerequisites = {
    --         "space-science-pack"
    --     },
    --     icon = data.raw["item"]["cargo-bay"].icon
    -- },
    {
        type = "technology",
        name = "crusher",
        research_trigger = {
            type = "mine-entity",
            entity = "metallic-asteroid-chunk"
        },
        localised_name = {"item-name.crusher"},
        localised_description = {"entity-description.crusher"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "crusher"
            },
            {
                type = "unlock-recipe",
                recipe = "metallic-asteroid-crushing"
            },
            
            {
                type = "unlock-recipe",
                recipe = "carbonic-asteroid-crushing"
            },
            {
                type = "unlock-recipe",
                recipe = "electric-engine-unit-from-carbon"
            },
            
        },
        prerequisites = {
             "planet-discovery-muluna"
        },
        icons = {
            {
                icon = "__planet-muluna__/graphics/technology/comminution.png",
                icon_size = 968,
            },  
        }
    },
    {
        type = "technology",
        name = "advanced-stone-processing",
        unit= {
            count = 200,
            time = 30,
            ingredients = data.raw["technology"]["productivity-module-2"].unit.ingredients
        },
        effects = {
            {
                type = "unlock-recipe",
                recipe = "stone-crushing"
            },
            {
                type = "unlock-recipe",
                recipe = "landfill-stone-crushed"
            },
            {
                type = "unlock-recipe",
                recipe = "stone-bricks-stone-crushed"
            },
        },
        icons = {
            {
                icon = "__planet-muluna__/graphics/technology/comminution.png",
                icon_size = 968,
            },  
            {
                icon = data.raw["item"]["stone"].icon,
                icon_size=data.raw["item"]["stone"].icon_size,
                --scale=0.3,
                shift = {45,45},
                scale=0.75,
            },
            
        },
        prerequisites = {
            "space-science-pack"
        },
    },
    {
        type = "technology",
        name = "space-boiler",
        research_trigger = {
            type = "mine-entity",
            entity = "oxide-asteroid-chunk"
        },
        localised_name = {"entity-name.space-boiler"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "space-boiler"
            },
            {
                type = "unlock-recipe",
                recipe = "oxide-asteroid-crushing"
            },
            {
                type = "unlock-recipe",
                recipe = "ice-melting"
            },
        },
        prerequisites = {
            "crusher"
        },
        icon = data.raw["technology"]["steam-power"].icon,
        icon_size = data.raw["technology"]["steam-power"].icon_size,
    },
    {
        type = "technology",
        name = "anorthite-processing",
        research_trigger = {
            type = "mine-entity",
            entity = "anorthite-chunk"
        },
        effects = {
            {
                type = "unlock-recipe",
                recipe = "anorthite-crushing"
            },
            {
                type = "unlock-recipe",
                recipe = "alumina-crushing"
            },
            {
                type = "unlock-recipe",
                recipe = "rocket-fuel-aluminum"
            },
            {
                type = "unlock-recipe",
                recipe = "aluminum-plate"
            },
            {
                type = "unlock-recipe",
                recipe = "aluminum-cable",
            },
            {
                type = "unlock-recipe",
                recipe = "low-density-structure-from-carbon",
            },
            {
                type = "unlock-recipe",
                recipe = "electronic-circuit-aluminum",
            },
            {
                type = "unlock-recipe",
                recipe = "advanced-circuit-aluminum",
            },
        },
        prerequisites = {
            "crusher"
        },
        icons = {
            {
                icon = "__planet-muluna__/graphics/technology/comminution.png",
                icon_size = 968,
            },  
            {
                icon = "__planet-muluna__/graphics/icons/anorthite-chunk.png",
                icon_size=64,
                --scale=0.3,
                shift = {45,45},
                scale=0.75,
            },
            
        }
    },
    {
        type = "technology",
        name = "planet-discovery-muluna",
        research_trigger = {
            type = "build-entity",
            entity = "thruster"
        },
        effects = {
            {
                type = "unlock-space-location",
                space_location = "muluna"
            }
        },
        prerequisites = {
            "space-platform-thruster"
        },
        icons = PlanetsLib.technology_icons_moon("__planet-muluna__/graphics/moon-icon.png",1482),
        localised_description={"space-location-description.muluna"},
        -- icons = {
        --     {
        --         icon = data.raw["planet"]["muluna"].icon,
        --         icon_size = data.raw["planet"]["muluna"].icon_size,
        --     }
        -- }
        
    },
    {
        type = "technology",
        name = "cryolab",
        localised_name = {"entity-name.cryolab"},
        --localised_description = {"entity-description.asteroid-collector"},
        unit= {
            count = 5000,
            time = 60,
            ingredients = --Normally, I would base these costs on vanilla technologies to increase tolerance of other mods, but since this tech is intended to 
                {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"space-science-pack", 1},
                    {"metallurgic-science-pack", 1},
                    {"agricultural-science-pack", 1},
                    {"electromagnetic-science-pack", 1},
                    {"cryogenic-science-pack", 1},
                    {"interstellar-science-pack",1}
              },
        },
        effects = {
            {
                type = "unlock-recipe",
                recipe = "cryolab"
            }
        },
        prerequisites = {
            "biolab","quantum-processor"
        },
        icons = {
            {
                icon=data.raw["technology"]["biolab"].icon,
                icon_size=data.raw["technology"]["biolab"].icon_size,
                tint = {r=0.7,g=0.7,b=1}
            },
        }
        --icon = "__planet-muluna__/graphics/technology/asteroid-collector(ai-upscaled).png",
        --icon_size=256,
    },
    {
        type = "technology",
        name = "helium-enrichment",
        --localised_name = {"entity-name.cryolab"},
        --localised_description = {"entity-description.asteroid-collector"},
        unit= {
            count = 500,
            time = 60,
            ingredients = --Normally, I would base these costs on vanilla technologies to increase tolerance of other mods, but since this tech is intended to 
                {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"space-science-pack", 1},
                    {"metallurgic-science-pack", 1},
                    {"agricultural-science-pack", 1},
                    {"electromagnetic-science-pack", 1},
                    {"cryogenic-science-pack", 1},
                    {"interstellar-science-pack",1}
              },
        },
        effects = {
            {
                type = "unlock-recipe",
                recipe = "interstellar-science-pack-helium-4"
            },
            {
                type = "unlock-recipe",
                recipe = "helium-separation"
            },
            {
                type = "unlock-recipe",
                recipe = "kovarex-helium-enrichment"
            },
        },
        prerequisites = {
            "interstellar-science-pack"
        },
        icons = {
            {
                icon="__planet-muluna__/graphics/technology/molecule-noble-gas.png",
                icon_size=644,
                tint = {r=0.7,g=0.7,b=1}
            },
        }
        --icon = "__planet-muluna__/graphics/technology/asteroid-collector(ai-upscaled).png",
        --icon_size=256,
    },
    {
        type = "technology",
        name = "thruster-fuel-productivity",
        --icons = {
            --{
                icon=data.raw["technology"]["space-platform-thruster"].icon,
                icon_size=data.raw["technology"]["space-platform-thruster"].icon_size,
                --tint = {r=0.7,g=0.7,b=1}
            --},
        --},
        max_level = "infinite",
        prerequisites = {"interstellar-science-pack"},
        upgrade = true,
        unit = {
            count_formula = "2000*1.5^(L-1)",
            time = 60,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
                {"space-science-pack", 1},
                {"interstellar-science-pack",1},
            }
        },
        effects = {
            {
                type = "change-recipe-productivity",
                recipe = "thruster-oxidizer",
                change = 0.1,
            },
            {
                type = "change-recipe-productivity",
                recipe = "thruster-fuel",
                change = 0.1,
            },
            {
                type = "change-recipe-productivity",
                recipe = "advanced-thruster-oxidizer",
                change = 0.1,
            },
            {
                type = "change-recipe-productivity",
                recipe = "advanced-thruster-fuel",
                change = 0.1,
            },
        },
    }
    -- {
    --     type = "technology",
    --     name = "crusher-2",
    --     unit= {
    --         count = 10000,
    --         time = 60,
    --         ingredients = data.raw["technology"]["promethium-science-pack"].unit.ingredients
    --     },
    --     effects = {
    --         {
    --             type = "unlock-recipe",
    --             recipe="crusher-2"
    --         }
    --     },
    --     prerequisites = {
    --         "promethium-science-pack"
    --     },
    --     icons = {
    --         {
    --             icon = "__planet-muluna__/graphics/technology/comminution.png",
    --             icon_size = 968,
    --         },  
    --         {
    --             icon = data.raw["item"]["uranium-ore"].icon,
    --             icon_size=data.raw["item"]["uranium-ore"].icon_size,
    --             --scale=0.3,
    --             shift = {45,45},
    --             scale=0.75,
    --         },
            
    --     },
    --     localised_name={"",{"item-name.crusher"}," 2"},
    --     --localised_description={"space-location-description.muluna"},
    --     -- icons = {
    --     --     {
    --     --         icon = data.raw["planet"]["muluna"].icon,
    --     --         icon_size = data.raw["planet"]["muluna"].icon_size,
    --     --     }
    --     -- }
        
    -- }

}


local iron_ore=data.raw["item"]["iron-ore"]
data:extend{{
    type="item",
    name="alumina",
    icon="__planet-muluna__/graphics/icons/scrap-metal-aluminium-1.png",
    stack_size=iron_ore.stack_size,
    order="a[alumina]",
    subgroup="muluna-products",
    group="intermediate-products",
    weight=iron_ore.weight,
},
{
    type="item",
    name="alumina-crushed",
    icons={
        {
            icon="__planet-muluna__/graphics/icons/scrap-metal-aluminium-1.png",
            scale=0.25,
            shift={0.25,0}
        },
        {
            icon="__planet-muluna__/graphics/icons/scrap-metal-aluminium-3.png",
            scale=0.25,
            shift={0,0.25}
        },
        {
            icon="__planet-muluna__/graphics/icons/scrap-metal-aluminium-2.png",
            scale=0.25,
            shift={0,-0.25}
        },
        {
            icon="__planet-muluna__/graphics/icons/scrap-metal-aluminium-2.png",
            scale=0.25,
            shift={-0.25,0}
        },
    },
    stack_size=iron_ore.stack_size*2,
    order="b[alumina-crushed]",
    subgroup="muluna-products",
    --recipe_group="intermediate-products",
    weight=iron_ore.weight*2/3,
},
{
    type="item", --Intended to be compatible with Bio-industries, whenever it gets updated to 2.0
    name="stone-crushed",
    icon="__planet-muluna__/graphics/icons/crushed-stone.png", --icon from bio-industries crushed stone
    icon_size=32,
    -- icons ={
    --     {
            
    --     }
        
    -- },
    
    stack_size=data.raw.item["stone"].stack_size*2,
    order="c[stone-crushed]",
    subgroup="muluna-products",
    group=data.raw.item["stone"].group,
    weight=data.raw.item["stone"].weight/2,
},
{
    type="item",
    name="aluminum-plate",
    icon="__planet-muluna__/graphics/icons/metal-plate-aluminium.png",
    icon_size=64,
    -- icons ={
    --     {
            
    --     }
        
    -- },
    
    stack_size=data.raw.item["iron-plate"].stack_size,
    order=data.raw.item["iron-plate"].order,
    subgroup="muluna-products",
    group=data.raw.item["iron-plate"].group,
    weight=data.raw.item["iron-plate"].weight,
},
{
    type="item",
    name="aluminum-cable",
    icon="__planet-muluna__/graphics/icons/aluminum-cable.png",
    icon_size=64,
    -- icons ={
    --     {
            
    --     }
        
    -- },
    
    stack_size=data.raw.item["copper-cable"].stack_size,
    order=data.raw.item["copper-cable"].order,
    subgroup="muluna-products",
    group=data.raw.item["copper-cable"].group,
    weight=data.raw.item["copper-cable"].weight,
},
{
    type="item",
    name="cellulose",
    icons={
        {
            icon="__planet-muluna__/graphics/icons/scrap-metal-aluminium-1.png",
            --scale=0.25,
            --shift={0.25,0}
            tint = {1,0.8,0.4}
        },
        {
            icon="__planet-muluna__/graphics/icons/scrap-metal-aluminium-2.png",
            --scale=0.25,
            --shift={0.25,0}
            tint = {1,0.8,0.4}
        },
        {
            icon="__planet-muluna__/graphics/icons/scrap-metal-aluminium-3.png",
            --scale=0.25,
            --shift={0.25,0}
            tint = {1,0.8,0.4}
        },
        {
            icon="__planet-muluna__/graphics/icons/scrap-metal-aluminium-1.png",
            --scale=0.25,
            --shift={0.25,0}
            tint = {1,0.8,0.4}
        },
        
    },
    stack_size=iron_ore.stack_size*4,
    order="b[cellulose]",
    subgroup="muluna-products",
    --recipe_group="intermediate-products",
    weight=iron_ore.weight*1/2,
    fuel_value = "1MJ",
    fuel_category=data.raw["item"]["wood"].fuel_category,
},
{
    type="item",
    name="wood-crushed",
    icons={
        {
            icon="__planet-muluna__/graphics/icons/scrap-metal-aluminium-1.png",
            --scale=0.25,
            --shift={0.25,0}
            tint = {1,0.8,0.4}
        },
    },
    stack_size=iron_ore.stack_size*4,
    order="b[cellulose]",
    subgroup="muluna-products",
    --recipe_group="intermediate-products",
    weight=iron_ore.weight*1/2,
    fuel_value = "1MJ",
    fuel_category=data.raw["item"]["wood"].fuel_category,
},
}
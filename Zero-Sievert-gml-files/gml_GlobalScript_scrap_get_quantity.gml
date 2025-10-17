function scrap_get_quantity(arg0, arg1)
{
    var _item_quantity = arg1.quantity;
    var _item_weight = item_get_weight(arg1.item);
    var _item_value = item_get_value(arg1.item);
    var _item_dur = loot_get_durability(arg1) / 100;
    var _forge_multiplier = 1;
    
    if (!is_in_hub())
        _forge_multiplier = 0.5;
    
    switch (arg0)
    {
        case "none":
            return 0;
            break;
        
        case "material":
            var _skill_multiplier = 1;
            
            if (skill_hunter_obtained("scraplord"))
                _skill_multiplier += struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("scraplord")), variable_get_hash("scrapped_material_multiplier"));
            
            return _item_quantity * ceil(_item_value * _item_dur * 0.002 * global.sk_k[UnknownEnum.Value_68] * _skill_multiplier * _forge_multiplier);
            break;
        
        case "food":
            var _skill_multiplier = 1;
            
            if (skill_hunter_obtained("scraplord"))
                _skill_multiplier += struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("scraplord")), variable_get_hash("scrapped_material_multiplier"));
            
            return _item_quantity * ceil(_item_value * 0.01 * global.sk_k[UnknownEnum.Value_68] * _skill_multiplier * _forge_multiplier);
            break;
        
        case "med":
            var _skill_multiplier = 1;
            
            if (skill_hunter_obtained("scraplord"))
                _skill_multiplier += struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("scraplord")), variable_get_hash("scrapped_material_multiplier"));
            
            return _item_quantity * ceil(_item_value * 0.002 * global.sk_k[UnknownEnum.Value_68] * _skill_multiplier * _forge_multiplier);
            break;
        
        case "weapon":
            var _skill_multiplier = 1;
            
            if (skill_hunter_obtained("scraplord"))
                _skill_multiplier += struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("scraplord")), variable_get_hash("scrapped_material_multiplier"));
            
            return _item_quantity * ceil(_item_value * _item_dur * 0.004 * global.sk_k[UnknownEnum.Value_68] * _skill_multiplier * _forge_multiplier);
            break;
        
        case "armor":
            var _skill_multiplier = 1;
            
            if (skill_hunter_obtained("scraplord"))
                _skill_multiplier += struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("scraplord")), variable_get_hash("scrapped_material_multiplier"));
            
            return _item_quantity * ceil(_item_value * _item_dur * 0.002 * global.sk_k[UnknownEnum.Value_68] * _skill_multiplier * _forge_multiplier);
            break;
        
        case "ammo":
            var _skill_multiplier = 1;
            
            if (skill_hunter_obtained("scraplord"))
                _skill_multiplier += struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("scraplord")), variable_get_hash("scrapped_material_multiplier"));
            
            return ceil(50 * _item_quantity * _item_weight * global.sk_k[UnknownEnum.Value_68] * _skill_multiplier * _forge_multiplier);
            break;
        
        default:
            trace_error("Scrap type \"", arg0, "\" not recognised");
            return 0;
            break;
    }
}

enum UnknownEnum
{
    Value_68 = 68
}

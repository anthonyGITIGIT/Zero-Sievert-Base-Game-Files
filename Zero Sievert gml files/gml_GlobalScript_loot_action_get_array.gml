function loot_action_get_array(arg0)
{
    var _array = [];
    var _item = arg0.item;
    
    switch (item_get_category(_item))
    {
        case "consumable":
            array_push_unique(_array, "Consume");
            break;
        
        case "medication":
        case "repair_weapon":
        case "repair_armor":
        case "injector":
        case "book":
        case "upgrade_base_kit":
        case "book_r":
        case "base_storage_use":
        case "grenade":
            array_push_unique(_array, "Use");
            break;
        
        case "weapon":
            array_push_unique(_array, "Unload");
            
            for (var i = 0; i < array_length(global.moddable_pos_in_raid); i++)
            {
                var _pos = global.moddable_pos_in_raid[i];
                
                if (loot_weapon_get_position_moddable(arg0, _pos))
                {
                    if (item_exists(loot_mod_cont_get(struct_get_from_hash(arg0, variable_get_hash("mods")), _pos)))
                    {
                        var _detach_type = get_detach_type_from_mod_pos(_pos);
                        array_push_unique(_array, _detach_type);
                    }
                }
            }
            
            break;
    }
    
    if (_item == "natale_luci_kit" || _item == "weather_kit")
        array_push_unique(_array, "Use");
    
    if ((is_in_hub() || base_module_get_level(UnknownEnum.Value_8) > 2) && item_get_scrap(_item) != "none")
        array_push_unique(_array, "Scrap");
    
    return _array;
}

enum UnknownEnum
{
    Value_8 = 8
}

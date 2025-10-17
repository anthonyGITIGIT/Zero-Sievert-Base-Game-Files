function player_loadout_get_loot(arg0, arg1, arg2 = true)
{
    switch (arg1)
    {
        case UnknownEnum.Value_1:
            arg1 = "weapon slot 1";
            break;
        
        case UnknownEnum.Value_2:
            arg1 = "weapon slot 2";
            break;
        
        case UnknownEnum.Value_11:
            arg1 = "armor slot";
            break;
        
        case UnknownEnum.Value_10:
            arg1 = "backpack slot";
            break;
        
        case UnknownEnum.Value_12:
            arg1 = "headset slot";
            break;
        
        case UnknownEnum.Value_4:
            arg1 = "quick slot 1";
            break;
        
        case UnknownEnum.Value_5:
            arg1 = "quick slot 2";
            break;
        
        case UnknownEnum.Value_6:
            arg1 = "quick slot 3";
            break;
        
        case UnknownEnum.Value_7:
            arg1 = "quick slot 4";
            break;
        
        case UnknownEnum.Value_8:
            arg1 = "quick slot 5";
            break;
        
        case UnknownEnum.Value_9:
            arg1 = "quick slot 6";
            break;
        
        default:
            if (!is_string(arg1) && !is_undefined(arg1))
                trace_error("Slot (", arg1, ") invalid");
            
            break;
    }
    
    with (arg0)
    {
        var _loot = variable_struct_get(loot_in_slot, arg1);
        
        if (is_struct(_loot) && _loot.quantity <= 0)
        {
            trace("Warning! Caught situation where loot had zero quantity in player's loadout (\"", arg1, "\" = ", _loot, ")");
            variable_struct_remove(loot_in_slot, arg1);
            _loot = undefined;
        }
        
        return (arg2 && _loot == undefined) ? new class_loot() : _loot;
    }
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_4 = 4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12
}

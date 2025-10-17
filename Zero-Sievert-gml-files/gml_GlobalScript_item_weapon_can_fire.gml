function item_weapon_can_fire(arg0, arg1)
{
    if (!item_exists(arg0))
        return false;
    
    if (!item_weapon_get_moddable(arg0))
        return true;
    
    var _i = 0;
    
    repeat (array_length(global.mod_pos_data_array))
    {
        var _mod_pos = global.mod_pos_data_array[_i];
        
        if (item_weapon_pos_get_needed(arg0, _mod_pos))
        {
            if (!loot_mod_cont_exists(arg1, _mod_pos))
                return false;
        }
        
        _i++;
    }
    
    return true;
}

function item_mod_fits_weapon(arg0, arg1)
{
    if (!item_fits_category(arg0, "w_mod"))
        return false;
    
    if (!item_fits_category(arg1, "weapon"))
        return false;
    
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("weapon_mod"));
    
    if (!is_struct(_struct))
        return false;
    
    if (_struct.weapon_all)
    {
        if (item_mod_get_type(arg0) == "scope")
        {
            if (item_weapon_pos_get_moddable(arg1, "scope"))
                return true;
            else
                return false;
        }
    }
    
    if (_struct.weapon_all)
        return true;
    
    var _array = _struct.weapon_id;
    var _i = 0;
    
    repeat (array_length(_array))
    {
        if (_array[_i] == arg1)
            return true;
        
        _i++;
    }
    
    return false;
}

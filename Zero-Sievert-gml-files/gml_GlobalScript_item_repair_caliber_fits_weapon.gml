function item_repair_caliber_fits_weapon(arg0, arg1)
{
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("repair"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .repair data");
    
    var _array = struct_get_from_hash(_struct, variable_get_hash("caliber"));
    
    if (!is_array(_array))
        return false;
    
    var _weapon_caliber = item_weapon_get_caliber(arg1);
    var _i = 0;
    
    repeat (array_length(_array))
    {
        if (_array[_i] == _weapon_caliber)
            return true;
        
        _i++;
    }
    
    return false;
}

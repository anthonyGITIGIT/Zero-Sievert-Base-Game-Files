function item_mod_fits_position(arg0, arg1)
{
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("weapon_mod"));
    
    if (!is_struct(_struct))
        return false;
    
    var _array = _struct.position;
    var _i = 0;
    
    repeat (array_length(_array))
    {
        if (_array[_i] == arg1)
            return true;
        
        _i++;
    }
    
    return false;
}

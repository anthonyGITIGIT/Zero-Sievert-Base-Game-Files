function item_grenade_get_damage_max(arg0)
{
    if (!item_fits_category(arg0, "grenade"))
        return 0;
    
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("grenade"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .grenade data");
    
    return _struct.damage_max;
}

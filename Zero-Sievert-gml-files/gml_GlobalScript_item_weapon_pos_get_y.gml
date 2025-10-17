function item_weapon_pos_get_y(arg0, arg1)
{
    if (!item_fits_category(arg0, "weapon"))
        return 0;
    
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("weapon"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .weapon data");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("mods"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .weapon.mods data");
    
    _struct = variable_struct_get(_struct, arg1);
    
    if (!is_struct(_struct))
        return 0;
    
    return _struct.y;
}

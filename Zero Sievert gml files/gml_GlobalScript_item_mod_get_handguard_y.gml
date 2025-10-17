function item_mod_get_handguard_y(arg0, arg1)
{
    if (!item_exists(arg0))
        return 0;
    
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("weapon_mod"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .weapon_mod data");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("handguard"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .weapon_mod.handguard data");
    
    _struct = variable_struct_get(_struct, arg1);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .weapon_mod.handguard.", arg1, " data");
    
    return _struct.y;
}

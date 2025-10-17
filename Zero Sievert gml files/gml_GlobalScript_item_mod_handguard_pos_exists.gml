function item_mod_handguard_pos_exists(arg0, arg1)
{
    if (!item_fits_category(arg0, "w_mod"))
        return false;
    
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("weapon_mod"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .weapon_mod data");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("handguard"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .weapon_mod.handguard data");
    
    return variable_struct_exists(_struct, arg1);
}

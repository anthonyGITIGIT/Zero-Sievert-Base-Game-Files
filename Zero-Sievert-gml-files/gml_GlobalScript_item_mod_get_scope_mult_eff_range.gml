function item_mod_get_scope_mult_eff_range(arg0)
{
    if (!item_exists(arg0))
        return false;
    
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("weapon_mod"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .weapon_mod data");
    
    var _value = struct_get_from_hash(_struct, variable_get_hash("scope_mult_eff_range"));
    
    if (_value == undefined)
        trace_error("Item \"", arg0, "\" has no .scope_mult_eff_range data");
    
    return _struct.scope_mult_eff_range;
}

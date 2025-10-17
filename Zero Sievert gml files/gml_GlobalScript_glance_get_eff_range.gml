function glance_get_eff_range(arg0)
{
    var _struct = variable_struct_get(global.weapon_glance_stat, arg0);
    
    if (!is_struct(_struct))
        trace_error("Glance type \"", arg0, "\" not recognised");
    
    var _eff_range = struct_get_from_hash(_struct, variable_get_hash("eff_range"));
    
    if (!is_array(_eff_range))
        trace_error("Glance type \"", arg0, "\" has no .eff_range data");
    
    return _eff_range;
}

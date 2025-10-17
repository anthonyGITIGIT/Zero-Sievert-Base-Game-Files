function glance_get_mult_eff_range_aiming(arg0)
{
    var _struct = variable_struct_get(global.weapon_glance_stat, arg0);
    
    if (!is_struct(_struct))
        trace_error("Glance type \"", arg0, "\" not recognised");
    
    var _mult_eff_range_aiming = struct_get_from_hash(_struct, variable_get_hash("mult_eff_range_aiming"));
    
    if (_mult_eff_range_aiming == undefined)
        trace_error("Glance type \"", arg0, "\" has no .mult_eff_range_aiming data");
    
    return _mult_eff_range_aiming;
}

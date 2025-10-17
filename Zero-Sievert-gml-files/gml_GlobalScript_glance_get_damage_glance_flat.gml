function glance_get_damage_glance_flat(arg0)
{
    var _struct = variable_struct_get(global.weapon_glance_stat, arg0);
    
    if (!is_struct(_struct))
        trace_error("Glance type \"", arg0, "\" not recognised");
    
    var _scope_flat_amount = struct_get_from_hash(_struct, variable_get_hash("damage_glance_flat"));
    
    if (_scope_flat_amount == undefined)
        trace_error("Glance type \"", arg0, "\" has no .damage_glance_flat data");
    
    return _scope_flat_amount;
}

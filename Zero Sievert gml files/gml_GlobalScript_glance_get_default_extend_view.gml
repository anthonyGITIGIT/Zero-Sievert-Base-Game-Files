function glance_get_default_extend_view(arg0)
{
    var _struct = variable_struct_get(global.weapon_glance_stat, arg0);
    
    if (!is_struct(_struct))
        trace_error("Glance type \"", arg0, "\" not recognised");
    
    var _default_extend_view = struct_get_from_hash(_struct, variable_get_hash("default_extend_view"));
    
    if (_default_extend_view == undefined)
        trace_error("Glance type \"", arg0, "\" has no .default_extend_view data");
    
    return _default_extend_view;
}

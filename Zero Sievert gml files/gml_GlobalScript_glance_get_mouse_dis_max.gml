function glance_get_mouse_dis_max(arg0)
{
    var _struct = variable_struct_get(global.weapon_glance_stat, arg0);
    
    if (!is_struct(_struct))
        trace_error("Glance type \"", arg0, "\" not recognised");
    
    var _mouse_dis_max = struct_get_from_hash(_struct, variable_get_hash("mouse_dis_max"));
    
    if (_mouse_dis_max == undefined)
        trace_error("Glance type \"", arg0, "\" has no .mouse_dis_max data");
    
    return _mouse_dis_max;
}

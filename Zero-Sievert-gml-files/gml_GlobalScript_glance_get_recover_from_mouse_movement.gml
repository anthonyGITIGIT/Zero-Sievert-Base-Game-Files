function glance_get_recover_from_mouse_movement(arg0)
{
    var _struct = variable_struct_get(global.weapon_glance_stat, arg0);
    
    if (!is_struct(_struct))
        trace_error("Glance type \"", arg0, "\" not recognised");
    
    var _recover_from_mouse_movement = struct_get_from_hash(_struct, variable_get_hash("recover_from_mouse_movement"));
    
    if (_recover_from_mouse_movement == undefined)
        trace_error("Glance type \"", arg0, "\" has no .recover_from_mouse_movement data");
    
    return _recover_from_mouse_movement;
}

function glance_get_player_ignore_mult_max(arg0)
{
    var _struct = variable_struct_get(global.weapon_glance_stat, arg0);
    
    if (!is_struct(_struct))
        trace_error("Glance type \"", arg0, "\" not recognised");
    
    var _mouse_dis_min = struct_get_from_hash(_struct, variable_get_hash("player_ignore_mult_max"));
    
    if (_mouse_dis_min == undefined)
        trace_error("Glance type \"", arg0, "\" has no .player_ignore_mult_max data");
    
    return _mouse_dis_min;
}

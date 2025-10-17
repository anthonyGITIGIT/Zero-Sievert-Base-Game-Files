function npc_get_sweet_angle(arg0)
{
    var _struct = variable_struct_get(global.npc_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("NPC \"", arg0, "\" not recognised");
    
    var _sweet_angle = struct_get_from_hash(_struct, variable_get_hash("sweet_angle"));
    
    if (_sweet_angle == undefined)
        trace_error("NPC \"", arg0, "\" has no .sweet_angle data");
    
    _sweet_angle = npc_get_general(arg0, _sweet_angle, "sweet_angle");
    return _sweet_angle;
}

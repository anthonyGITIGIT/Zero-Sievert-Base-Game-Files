function npc_get_alert_visual_distance(arg0)
{
    var _struct = variable_struct_get(global.npc_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("NPC \"", arg0, "\" not recognised");
    
    var _distance = struct_get_from_hash(_struct, variable_get_hash("alert_visual_distance"));
    
    if (_distance == undefined)
        trace_error("NPC \"", arg0, "\" has no .alert_visual_distance data");
    
    _distance = npc_get_general(arg0, _distance, "alert_visual_distance");
    return _distance;
}

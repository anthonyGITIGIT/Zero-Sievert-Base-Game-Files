function npc_get_alert_min_distance(arg0)
{
    var _struct = variable_struct_get(global.npc_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("NPC \"", arg0, "\" not recognised");
    
    var _distance = struct_get_from_hash(_struct, variable_get_hash("alert_min_distance"));
    
    if (_distance == undefined)
        trace_error("NPC \"", arg0, "\" has no .alert_min_distance data");
    
    _distance = npc_get_general(arg0, _distance, "alert_min_distance");
    return _distance;
}

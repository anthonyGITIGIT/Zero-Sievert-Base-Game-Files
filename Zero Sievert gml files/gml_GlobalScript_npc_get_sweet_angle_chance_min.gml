function npc_get_sweet_angle_chance_min(arg0)
{
    var _struct = variable_struct_get(global.npc_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("NPC \"", arg0, "\" not recognised");
    
    var _value = struct_get_from_hash(_struct, variable_get_hash("sweet_angle_chance_min"));
    
    if (_value == undefined)
        trace_error("NPC \"", arg0, "\" has no .sweet_angle_chance_min data");
    
    _value = npc_get_general(arg0, _value, "sweet_angle_chance_min");
    return _value;
}

function npc_get_spd_alerted(arg0)
{
    var _struct = variable_struct_get(global.npc_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("NPC \"", arg0, "\" not recognised");
    
    var _value = struct_get_from_hash(_struct, variable_get_hash("spd_alerted"));
    
    if (_value == undefined)
        trace_error("NPC \"", arg0, "\" has no .spd_alerted data");
    
    _value = npc_get_general(arg0, _value, "spd_alerted");
    _value *= current_move_speed_multiplier;
    return _value;
}

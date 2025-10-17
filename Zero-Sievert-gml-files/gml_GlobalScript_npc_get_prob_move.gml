function npc_get_prob_move(arg0)
{
    var _struct = variable_struct_get(global.npc_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("NPC \"", arg0, "\" not recognised");
    
    var _value = struct_get_from_hash(_struct, variable_get_hash("prob_move"));
    
    if (_value == undefined)
        trace_error("NPC \"", arg0, "\" has no .prob_move data");
    
    _value = npc_get_general(arg0, _value, "prob_move");
    return _value;
}

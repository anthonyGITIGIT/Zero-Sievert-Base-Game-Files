function npc_get_speaker_id(arg0, arg1 = false)
{
    if (!arg1)
        trace_error("Do not use this function!\nInstead read the .npc_speaker_id variable for the instance");
    
    var _struct = variable_struct_get(global.npc_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("NPC \"", arg0, "\" not recognised");
    
    var _value = struct_get_from_hash(_struct, variable_get_hash("speaker_id"));
    
    if (_value == undefined)
        trace_error("NPC \"", arg0, "\" has no .speaker_id data");
    
    _value = npc_get_general(arg0, _value, "speaker_id");
    return _value;
}

function npc_get_preset(arg0)
{
    var _struct = variable_struct_get(global.npc_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("NPC \"", arg0, "\" not recognised");
    
    var _value = struct_get_from_hash(_struct, variable_get_hash("npc_preset"));
    
    if (_value == undefined)
        trace_error("NPC \"", arg0, "\" has no .npc_preset data");
    
    return _value;
}

function npc_get_chest_dropped(arg0)
{
    var _struct = variable_struct_get(global.npc_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("NPC \"", arg0, "\" not recognised");
    
    var _value = struct_get_from_hash(_struct, variable_get_hash("chest_dropped"));
    
    if (_value == undefined)
        trace_error("NPC \"", arg0, "\" has no .chest_dropped data");
    
    if (!is_array(_value))
        _value = npc_get_general(arg0, _value, "chest_dropped");
    
    if (is_array(_value))
        return _value[irandom(array_length(_value) - 1)];
    
    return _value;
}

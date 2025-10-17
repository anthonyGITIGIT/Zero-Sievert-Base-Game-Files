function preset_get_value(arg0, arg1)
{
    var _struct = variable_struct_get(global.npc_preset, arg0);
    
    if (!is_struct(_struct))
        trace_error("Preset \"", arg0, "\" not recognised");
    
    var _value = variable_struct_get(_struct, arg1);
    
    if (_value == undefined)
        trace_error("Preset \"", arg0, "\" has no .", arg1, " data");
    
    _value = preset_general_get_value(arg1, _value);
    return _value;
}

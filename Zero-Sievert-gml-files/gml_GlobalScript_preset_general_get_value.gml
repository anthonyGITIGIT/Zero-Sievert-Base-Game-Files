function preset_general_get_value(arg0, arg1)
{
    var _struct_general = struct_get_from_hash(global.npc_preset, variable_get_hash("general"));
    var _struct_value = variable_struct_get(_struct_general, arg0);
    
    if (_struct_value == undefined)
        trace_error("Preset general \"", " has no .", arg0, " data");
    
    if (_struct_value != "{use_preset}")
    {
        if (is_struct(_struct_value))
        {
            var _general_name_value = variable_struct_get(_struct_value, arg1);
            
            if (_general_name_value != undefined)
                return _general_name_value;
        }
        else
        {
            return _struct_value;
        }
    }
    
    return arg1;
}

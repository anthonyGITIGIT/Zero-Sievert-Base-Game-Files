function difficulty_reset(arg0, arg1)
{
    var _difficulty_def = variable_struct_get(global.__difficulty_data, arg0);
    
    if (!is_struct(_difficulty_def))
        trace_error("Difficulty \"", arg0, "\" not recognised");
    
    var _preset = variable_struct_get(global.__difficulty_preset_data, arg1);
    
    if (!is_struct(_preset))
        trace_error("Difficulty preset \"", arg1, "\" not found");
    
    difficulty_set(arg0, variable_struct_get(_preset, arg0) ?? _difficulty_def.__default);
}

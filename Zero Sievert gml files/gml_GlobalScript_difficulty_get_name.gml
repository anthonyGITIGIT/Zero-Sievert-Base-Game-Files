function difficulty_get_name(arg0)
{
    var _difficulty_def = variable_struct_get(global.__difficulty_data, arg0);
    
    if (!is_struct(_difficulty_def))
        trace_error("Difficulty \"", arg0, "\" not recognised");
    
    return language_get_string(_difficulty_def.__friendlyName);
}

function settings_get_max(arg0)
{
    var _settings_def = variable_struct_get(global.__settings_data, arg0);
    
    if (!is_struct(_settings_def))
        trace_error("Setting \"", arg0, "\" not recognised");
    
    return _settings_def.__max;
}

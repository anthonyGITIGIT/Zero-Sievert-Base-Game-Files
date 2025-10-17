function settings_apply(arg0)
{
    var _settings_def = variable_struct_get(global.__settings_data, arg0);
    
    if (!is_struct(_settings_def))
        trace_error("Setting \"", arg0, "\" not recognised");
    
    with (_settings_def)
    {
        if (is_method(__callback))
            __callback(db_read_ext(__db_alias, __db_section, __name, __default));
    }
}

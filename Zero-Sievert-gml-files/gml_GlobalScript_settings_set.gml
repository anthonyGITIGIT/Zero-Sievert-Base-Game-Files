function settings_set(arg0, arg1)
{
    var _settings_def = variable_struct_get(global.__settings_data, arg0);
    
    if (!is_struct(_settings_def))
        trace_error("Setting \"", arg0, "\" not recognised");
    
    with (_settings_def)
    {
        if (arg1 != db_read_ext(__db_alias, __db_section, __name, __default))
        {
            db_open(__db_alias);
            db_write(__db_section, __name, arg1);
            db_close();
            
            if (is_method(__callback))
                __callback(arg1);
        }
    }
}

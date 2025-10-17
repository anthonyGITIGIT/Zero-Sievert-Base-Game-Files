function difficulty_reset_all(arg0)
{
    trace("Difficulty: Resetting all settings to preset \"", arg0, "\"");
    var _old_save_on_close;
    
    if (!global.__difficulty_sandbox)
    {
        _old_save_on_close = db_get_save_on_close("shared");
        db_set_save_on_close("shared", false);
    }
    
    var _names_array = variable_struct_get_names(global.__difficulty_data);
    var _i = 0;
    
    repeat (array_length(_names_array))
    {
        difficulty_reset(_names_array[_i], arg0);
        _i++;
    }
    
    uiGetData().difficulty_name = arg0;
    
    if (!global.__difficulty_sandbox)
        db_set_save_on_close("shared", _old_save_on_close);
}

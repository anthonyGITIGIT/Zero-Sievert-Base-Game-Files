function db_close(arg0 = false)
{
    if (is_struct(global.database_current) && !arg0)
    {
        if (global.database_current.allow_save && global.database_current.changed && global.database_current.save_on_close)
        {
            __db_trace("Detected change to database \"", global.database_alias, "\"");
            db_save_if_changed(global.database_alias);
        }
    }
    
    global.database_alias = undefined;
    global.database_current = undefined;
    global.database_data_root = undefined;
}

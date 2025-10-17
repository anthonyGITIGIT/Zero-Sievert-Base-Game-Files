function db_set_filename(arg0, arg1)
{
    var _database = variable_struct_get(global.database_struct, arg0);
    
    if (!is_struct(_database))
    {
        __db_error("Database \"", arg0, "\" has not been created with db_create()");
        exit;
    }
    
    var _unload = _database.filename != arg1;
    __db_trace("Set database \"", arg0, "\" filename to \"", arg1, "\"");
    _database.filename = arg1;
    
    if (_unload)
    {
        __db_trace("Database \"", arg0, "\" unloaded due to filename change");
        _database.loaded = false;
    }
}

function db_save_if_changed(arg0)
{
    static _buffer = buffer_create(1024, buffer_grow, 1);
    
    var _database = variable_struct_get(global.database_struct, arg0);
    
    if (!is_struct(_database))
    {
        __db_error("Database \"", arg0, "\" has not been created with db_create()");
        exit;
    }
    
    if (!_database.allow_save)
    {
        __db_error("Trying to save unsaveable database \"", arg0, "\"");
        exit;
    }
    
    var _filename = _database.filename;
    
    if (_filename == undefined)
    {
        __db_error("Database \"", arg0, "\" has not has its filename set");
        exit;
    }
    
    if (!_database.changed)
        exit;
    
    _database.changed = false;
    db_force_save(arg0);
}

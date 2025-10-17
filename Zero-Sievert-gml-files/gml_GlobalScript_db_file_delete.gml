function db_file_delete(arg0)
{
    var _database = variable_struct_get(global.database_struct, arg0);
    
    if (!is_struct(_database))
    {
        __db_error("Database \"", arg0, "\" has not been created with db_create()");
        exit;
    }
    
    var _filename = _database.filename;
    
    if (_filename == undefined)
    {
        __db_error("Database \"", arg0, "\" has not has its filename set");
        exit;
    }
    
    file_delete(global.database_savedata_root + _filename);
    __db_trace("Deleted \"", _filename, "\"");
    db_cloud_wipe(_filename);
}

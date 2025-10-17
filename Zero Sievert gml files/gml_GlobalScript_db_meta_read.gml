function db_meta_read(arg0, arg1, arg2)
{
    var _database = variable_struct_get(global.database_struct, arg0);
    
    if (!is_struct(_database))
    {
        __db_error("Database \"", arg0, "\" has not been created with db_create()");
        exit;
    }
    
    if (!_database.loaded && _database.allow_load)
    {
        __db_error("\"", arg0, "\" has not been loaded");
        exit;
    }
    
    var _metadata_struct = _database.metadata;
    return variable_struct_get(_metadata_struct, arg1) ?? arg2;
}

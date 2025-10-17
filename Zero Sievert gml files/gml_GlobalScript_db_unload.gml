function db_unload(arg0)
{
    var _database = variable_struct_get(global.database_struct, arg0);
    
    if (!is_struct(_database))
    {
        __db_error("Database \"", arg0, "\" has not been created with db_create()");
        exit;
    }
    
    __db_trace("Unloading database \"", arg0, "\"");
    _database.loaded = false;
    _database.metadata = {};
    
    if (_database.is_group)
    {
        var _i = 0;
        
        repeat (array_length(_database.group_names))
        {
            variable_struct_set(_database.data, _database.group_names[_i], {});
            _i++;
        }
    }
    else
    {
        _database.data = {};
    }
}

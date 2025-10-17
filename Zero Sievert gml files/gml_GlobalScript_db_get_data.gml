function db_get_data(arg0)
{
    var _database = variable_struct_get(global.database_struct, arg0);
    
    if (!is_struct(_database))
    {
        __db_error("Database \"", arg0, "\" has not been created with db_create()");
        exit;
    }
    
    var _root_struct = _database.data;
    
    if (_database.is_group)
        _root_struct = variable_struct_get(_root_struct, arg0);
    
    return _root_struct;
}

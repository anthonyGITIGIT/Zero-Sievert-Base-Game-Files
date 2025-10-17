function db_read_ext(arg0, arg1, arg2, arg3)
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
    
    var _root_struct = _database.data;
    
    if (_database.is_group && arg0 != _database.alias)
        _root_struct = variable_struct_get(_root_struct, arg0);
    
    var _section_struct = variable_struct_get(_root_struct, arg1);
    
    if (!is_struct(_section_struct))
        return arg3;
    
    if (!variable_struct_exists(_section_struct, arg2))
        return arg3;
    
    return variable_struct_get(_section_struct, arg2);
}

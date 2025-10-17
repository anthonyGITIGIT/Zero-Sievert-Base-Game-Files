function db_group_setup(arg0, arg1)
{
    var _database = variable_struct_get(global.database_struct, arg0);
    
    if (!is_struct(_database))
    {
        __db_error("Database \"", arg0, "\" has not been created with db_create()");
        exit;
    }
    
    _database.is_group = true;
    _database.group_names = arg1;
    variable_struct_set(_database.data, arg0, {});
    var _i = 0;
    
    repeat (array_length(arg1))
    {
        var _alias = arg1[_i];
        variable_struct_set(_database.data, _alias, {});
        variable_struct_set(global.database_struct, _alias, _database);
        _i++;
    }
    
    __db_trace("Set database \"", arg0, "\" group to ", arg1);
}

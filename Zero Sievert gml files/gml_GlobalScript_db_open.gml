function db_open(arg0)
{
    if (global.database_alias != undefined)
        __db_error("Please call db_close() before db_open()");
    
    global.database_current = variable_struct_get(global.database_struct, arg0);
    
    if (!is_struct(global.database_current))
        __db_error("Database \"", arg0, "\" has not been created with db_create()");
    
    global.database_alias = arg0;
    global.database_data_root = global.database_current.data;
    
    if (global.database_current.is_group && arg0 != global.database_current.alias)
    {
        global.database_data_root = variable_struct_get(global.database_data_root, arg0);
        
        if (!is_struct(global.database_data_root))
            __db_error("Database \"", arg0, "\" has not been set up with db_group_setup()");
    }
}

function db_read(arg0, arg1, arg2)
{
    if (global.database_current == undefined)
    {
        __db_error("Please call db_open() before db_read()");
        exit;
    }
    
    if (!global.database_current.loaded && global.database_current.allow_load)
    {
        __db_error("\"", global.database_alias, "\" has not been loaded");
        exit;
    }
    
    var _root_struct = global.database_data_root;
    var _section_struct = variable_struct_get(_root_struct, arg0);
    
    if (!is_struct(_section_struct))
        return arg2;
    
    if (!variable_struct_exists(_section_struct, arg1))
        return arg2;
    
    return variable_struct_get(_section_struct, arg1);
}

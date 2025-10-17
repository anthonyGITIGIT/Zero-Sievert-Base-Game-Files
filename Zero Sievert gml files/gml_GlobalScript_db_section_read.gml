function db_section_read(arg0)
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
    return variable_struct_exists(_root_struct, arg0) ? variable_struct_get(_root_struct, arg0) : {};
}

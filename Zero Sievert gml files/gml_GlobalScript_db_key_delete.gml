function db_key_delete(arg0, arg1)
{
    if (global.database_current == undefined)
    {
        __db_error("Please call db_open() before db_write()");
        exit;
    }
    
    var _root_struct = global.database_data_root;
    var _section_struct = variable_struct_get(_root_struct, arg0);
    
    if (!is_struct(_section_struct))
        exit;
    
    variable_struct_remove(_section_struct, arg1);
}

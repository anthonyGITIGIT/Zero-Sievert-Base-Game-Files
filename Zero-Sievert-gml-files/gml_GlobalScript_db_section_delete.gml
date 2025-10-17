function db_section_delete(arg0)
{
    if (global.database_current == undefined)
    {
        __db_error("Please call db_open() before db_write()");
        exit;
    }
    
    var _root_struct = global.database_data_root;
    
    if (variable_struct_exists(_root_struct, arg0) && global.database_current.autoscan_for_changes)
        global.database_current.changed = true;
    
    variable_struct_remove(_root_struct, arg0);
}

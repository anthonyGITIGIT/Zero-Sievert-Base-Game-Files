function db_section_write(arg0, arg1)
{
    if (global.database_current == undefined)
    {
        __db_error("Please call db_open() before db_write()");
        exit;
    }
    
    var _root_struct = global.database_data_root;
    
    if (global.database_current.autoscan_for_changes)
        global.database_current.changed = true;
    
    variable_struct_set(_root_struct, arg0, arg1);
}

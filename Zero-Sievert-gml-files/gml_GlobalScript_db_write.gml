function db_write(arg0, arg1, arg2)
{
    if (global.database_current == undefined)
    {
        __db_error("Please call db_open() before db_write()");
        exit;
    }
    
    var _root_struct = global.database_data_root;
    var _section_struct = variable_struct_get(_root_struct, arg0);
    
    if (!is_struct(_section_struct))
    {
        if (global.database_current.autoscan_for_changes)
            global.database_current.changed = true;
        
        _section_struct = {};
        variable_struct_set(_root_struct, arg0, _section_struct);
    }
    
    var _old_value = variable_struct_get(_section_struct, arg1);
    
    if (_old_value != arg2)
    {
        if (global.database_current.autoscan_for_changes)
            global.database_current.changed = true;
        
        variable_struct_set(_section_struct, arg1, arg2);
    }
}

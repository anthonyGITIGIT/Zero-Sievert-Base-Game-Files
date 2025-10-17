function db_set_autoscan_for_changes(arg0, arg1)
{
    var _database = variable_struct_get(global.database_struct, arg0);
    
    if (!is_struct(_database))
    {
        __db_error("Database \"", arg0, "\" has not been created with db_create()");
        exit;
    }
    
    __db_trace("Database \"", _database.alias, "\" scan for changes = ", arg1);
    return _database.autoscan_for_changes;
}

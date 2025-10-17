function db_create(arg0, arg1, arg2, arg3, arg4, arg5)
{
    if (variable_struct_exists(global.database_struct, arg0))
    {
        __db_trace("Database \"", arg0, "\" already exists");
        exit;
    }
    
    var _database = 
    {
        alias: arg0,
        metadata: {},
        data: {},
        is_group: false,
        group_names: [],
        autoscan_for_changes: true,
        changed: false,
        save_on_close: true,
        filename: undefined,
        loaded: false,
        create_backups: arg1,
        allow_load: arg2,
        allow_save: arg3,
        pretty_output: arg4,
        cloud: arg5,
        save_hash: undefined
    };
    array_push(global.database_array, arg0);
    variable_struct_set(global.database_struct, arg0, _database);
}

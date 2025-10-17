function db_force_save(arg0)
{
    static _buffer = buffer_create(1024, buffer_grow, 1);
    
    var _database = variable_struct_get(global.database_struct, arg0);
    
    if (!is_struct(_database))
    {
        __db_error("Database \"", arg0, "\" has not been created with db_create()");
        exit;
    }
    
    if (!_database.allow_save)
    {
        __db_error("Trying to save unsaveable database \"", arg0, "\"");
        exit;
    }
    
    var _filename = _database.filename;
    
    if (_filename == undefined)
    {
        __db_error("Database \"", arg0, "\" has not has its filename set");
        exit;
    }
    
    if (_database.create_backups)
        db_create_backup(_filename, "backup/backup_");
    
    __db_trace("Saving database \"", arg0, "\" to \"", _filename, "\"");
    var _payload = 
    {
        data: _database.data,
        format: "json",
        timestamp: string_format(date_current_datetime(), 0, 10),
        save_version: concat(concat(1, ".", 2, ".", 24), " development"),
        version_major: 1,
        version_minor: 2,
        version_patch: 24
    };
    buffer_seek(_buffer, buffer_seek_start, 0);
    
    if (_database.pretty_output)
        SnapBufferWriteJSON(_buffer, _payload, true, true, true);
    else
        buffer_write(_buffer, buffer_text, json_stringify(_payload));
    
    var _result = buffer_save_ext(_buffer, global.database_savedata_root + _filename, 0, buffer_tell(_buffer));
    __db_trace("result = ", _result);
    
    if (db_cloud_enabled() && _database.cloud)
    {
        _database.save_hash = buffer_md5(_buffer, 0, buffer_tell(_buffer));
        __db_trace("Attempting to push to Steam Cloud");
        var _json_string = buffer_peek(_buffer, 0, buffer_string);
        _result = steam_file_write(_filename, _json_string, string_length(_json_string));
        __db_trace("result = ", _result);
        
        if (global.strict_steam_mode && _result <= 0)
            show_message("Steam Cloud write failed");
    }
}

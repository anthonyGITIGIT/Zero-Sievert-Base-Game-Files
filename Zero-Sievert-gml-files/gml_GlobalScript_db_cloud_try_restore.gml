function db_cloud_try_restore(arg0, arg1 = 0)
{
    if (db_cloud_enabled())
    {
        __db_trace("Checking if \"", arg0, "\" exists in Steam Cloud");
        
        if (steam_file_exists(arg0))
        {
            var _restore = false;
            var _steam_text = undefined;
            
            if (file_exists(global.database_savedata_root + arg0))
            {
                __db_trace("\"", arg0, "\" exists locally");
                
                switch (arg1)
                {
                    case 0:
                        if (global.database_was_previously_using_cloud_saves == undefined)
                        {
                            __db_trace("Mode=0: Unknown cloud state");
                            _steam_text = steam_file_read(arg0);
                            var _steam_hash = md5_string_utf8(_steam_text);
                            var _buffer = buffer_load(global.database_savedata_root + arg0);
                            var _local_text = buffer_read(_buffer, buffer_string);
                            var _local_hash = md5_string_utf8(_local_text);
                            buffer_delete(_buffer);
                            
                            if (_local_hash != _steam_hash)
                            {
                                __db_trace("Mode=0 & hash collision: Alerting user");
                                global.database_cloud_conflict = 2;
                            }
                            else
                            {
                                __db_trace("Mode=0: Restoring from cloud");
                                _restore = true;
                            }
                        }
                        else if (global.database_was_previously_using_cloud_saves == false)
                        {
                            __db_trace("Mode=0: Not using cloud save previously. Alerting user");
                            global.database_cloud_conflict = 2;
                        }
                        else
                        {
                            __db_trace("Mode=0. Using cloud save previously. Restoring from cloud");
                            _restore = true;
                        }
                        
                        break;
                    
                    case 1:
                        __db_trace("Mode=1: Backing up local file then restoring \"", global.database_savedata_root + arg0, "\" from cloud");
                        _restore = true;
                        break;
                    
                    case 2:
                        __db_trace("Mode=2: Sending local file to Steam Cloud");
                        __db_trace("Attempting to push to Steam Cloud");
                        var _buffer = buffer_load(global.database_savedata_root + arg0);
                        var _local_text = buffer_read(_buffer, buffer_string);
                        buffer_delete(_buffer);
                        var _result = steam_file_write(arg0, _local_text, string_length(_local_text));
                        __db_trace("result = ", _result);
                        
                        if (global.strict_steam_mode && _result <= 0)
                            show_message("Steam Cloud write failed");
                        
                        break;
                }
            }
            else
            {
                _restore = true;
            }
            
            if (_restore)
            {
                if (file_exists(global.database_savedata_root + arg0))
                {
                    __db_trace("Backing up \"", global.database_savedata_root + arg0, "\"");
                    db_create_backup(arg0, "backup/backup_");
                }
                else
                {
                    __db_trace("\"", global.database_savedata_root + arg0, "\" doesn't exist locally");
                }
                
                __db_trace("Restoring \"", global.database_savedata_root + arg0, "\" from Steam Cloud");
                
                if (_steam_text == undefined)
                    _steam_text = steam_file_read(arg0);
                
                var _buffer = buffer_create(string_byte_length(_steam_text), buffer_fixed, 1);
                buffer_write(_buffer, buffer_text, _steam_text);
                buffer_save(_buffer, global.database_savedata_root + arg0);
                buffer_delete(_buffer);
            }
        }
        else
        {
            __db_trace("\"", arg0, "\" doesn't exist in cloud, not restoring");
        }
    }
}

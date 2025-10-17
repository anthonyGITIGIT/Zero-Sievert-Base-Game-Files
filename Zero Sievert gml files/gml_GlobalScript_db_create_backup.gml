function db_create_backup(arg0, arg1)
{
    var _new_filename = arg1 + "5" + "_" + arg0;
    file_delete(global.database_savedata_root + _new_filename);
    var _i = 5;
    
    repeat (4)
    {
        var _old_filename = arg1 + string(_i - 1) + "_" + arg0;
        _new_filename = arg1 + string(_i) + "_" + arg0;
        
        if (file_exists(global.database_savedata_root + _old_filename))
            file_copy(global.database_savedata_root + _old_filename, global.database_savedata_root + _new_filename);
        
        _i--;
    }
    
    _new_filename = arg1 + "1_" + arg0;
    
    if (file_exists(global.database_savedata_root + arg0))
        file_copy(global.database_savedata_root + arg0, global.database_savedata_root + _new_filename);
}

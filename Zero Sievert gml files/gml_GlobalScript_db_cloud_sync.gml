function db_cloud_sync(arg0, arg1 = 0)
{
    if (db_cloud_enabled())
    {
        __db_trace("Trying to sync \"", arg0, "\"");
        
        if (1 && steam_file_exists(arg0))
            db_cloud_try_restore(arg0, arg1);
        else
            db_cloud_clean_up(arg0, arg1);
    }
}

function db_cloud_wipe(arg0)
{
    if (db_cloud_enabled())
    {
        __db_trace("Removing \"", arg0, "\" from Steam Cloud");
        steam_file_delete(arg0);
        file_delete(global.database_savedata_root + arg0);
    }
}

function db_cloud_sync_all(arg0 = 0)
{
    db_cloud_sync("settings_shared.json", arg0);
    var _index = 1;
    
    repeat (3)
    {
        db_cloud_sync("save_shared_" + string(_index) + ".dat", arg0);
        _index++;
    }
}

function settings_set_write_to_disk(arg0)
{
    global.__settings_write_to_disk = arg0;
    db_set_save_on_close("local settings", arg0);
    db_set_save_on_close("shared settings", arg0);
    
    if (global.__settings_write_to_disk)
    {
        db_save_if_changed("local settings");
        db_save_if_changed("shared settings");
    }
}

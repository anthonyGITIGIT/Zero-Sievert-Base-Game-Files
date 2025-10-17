var _event_id = ds_map_find_value(async_load, "id");

if (_event_id == workshop_id_connection)
{
    var _type = ds_map_find_value(async_load, "event_type");
    
    if (_type == "ugc_create_item")
    {
        workshop_id = ds_map_find_value(async_load, "published_file_id");
        status = UnknownEnum.Value_1;
        show_debug_message("Note: Steam gave this mod the ID: " + string(workshop_id));
        var _folder_path = ugc_get_folder() + "\\" + folder;
        var _meta_file = _folder_path + "\\" + "meta.ini";
        
        if (file_exists(_meta_file))
        {
            ini_open(_meta_file);
            ini_write_string("leave blank", "workshop_id", workshop_id);
            ini_write_real("leave blank", "author_id", steam_get_user_account_id());
            ini_close();
        }
    }
    else if (_type == "ugc_update_item")
    {
        show_debug_message("Note: Updating mod with the ID: " + string(workshop_id));
    }
}

enum UnknownEnum
{
    Value_1 = 1
}

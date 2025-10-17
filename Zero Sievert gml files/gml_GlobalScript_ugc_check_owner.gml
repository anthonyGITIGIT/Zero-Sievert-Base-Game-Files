function ugc_check_owner(arg0)
{
    var _folder_path = ugc_get_folder() + "\\" + arg0;
    
    if (!directory_exists(_folder_path))
        return -1;
    
    var _meta_file = _folder_path + "\\" + "meta.ini";
    
    if (!file_exists(_meta_file))
        return -2;
    
    ini_open(_meta_file);
    var _meta_steam_id = ini_read_string("leave blank", "steam_id", -1);
    ini_close();
    
    if (_meta_steam_id == -1)
        return true;
    
    if (_meta_steam_id != steam_get_name_safe())
        return -3;
    
    return true;
}

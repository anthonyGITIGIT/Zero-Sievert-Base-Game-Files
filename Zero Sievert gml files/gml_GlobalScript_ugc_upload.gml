function ugc_upload(arg0)
{
    var _check = steam_ok();
    
    if (_check.value <= 0)
    {
        scr_draw_text_with_box("Cannot upload: " + string(language_get_string(_check.error)));
        return -1;
    }
    
    _check = ugc_pre_check(arg0);
    
    if (_check.value != UnknownEnum.Value_0)
    {
        scr_draw_text_with_box("Cannot upload: " + string(language_get_string(_check.error)));
        return -2;
    }
    
    _check = ugc_check_owner(arg0);
    
    if (_check != true)
    {
    }
    
    var _workshop_id = undefined;
    var _folder_path = ugc_get_folder() + "\\" + arg0;
    var _meta_file = _folder_path + "\\" + "meta.ini";
    
    if (file_exists(_meta_file))
    {
        ini_open(_meta_file);
        
        if (ini_section_exists("leave blank") && ini_key_exists("leave blank", "workshop_id"))
        {
            _workshop_id = real(ini_read_string("leave blank", "workshop_id", "0"));
            
            if (_workshop_id == 0)
                _workshop_id = undefined;
        }
        
        ini_close();
    }
    
    instance_create_depth(0, 0, 0, ugc_steamworks_uploader, 
    {
        folder: arg0,
        workshop_id: _workshop_id
    });
    return true;
}

enum UnknownEnum
{
    Value_0
}

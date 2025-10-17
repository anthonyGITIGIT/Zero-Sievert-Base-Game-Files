function UiModDelete(arg0)
{
    show_debug_message("Starting delete:");
    show_debug_message(arg0);
    var _this_folder = UiModGetSingleFolder(arg0);
    var _to_path = ugc_get_folder() + "\\" + _this_folder + "\\";
    show_debug_message("folder:");
    show_debug_message(_this_folder);
    modding_utility_changeOn(_this_folder, false);
    
    if (!directory_exists(_to_path))
        _to_path = UIModGetMods_Data(arg0).file_path + "\\";
    
    var _meta_path = _to_path + "meta.ini";
    var _workshop_id = undefined;
    
    if (directory_exists(_to_path) && file_exists(_meta_path))
    {
        ini_open(_meta_path);
        _workshop_id = ini_read_string("leave blank", "workshop_id", undefined);
        ini_close();
        
        if (is_undefined(_workshop_id))
        {
            if (file_exists("installed_mods.json"))
            {
                var _buffer = buffer_load("installed_mods.json");
                _mods_folder_info = json_parse(buffer_read(_buffer, buffer_text));
                buffer_delete(_buffer);
                
                if (is_array(_mods_folder_info))
                {
                    var _count_of_mods = array_length(_mods_folder_info);
                    
                    for (var i = 0; i < _count_of_mods; i++)
                    {
                        var _this = _mods_folder_info[i];
                        
                        if (struct_exists(_this, "workshop_id") && struct_exists(_this, "folder"))
                        {
                            if (_to_path == _this.folder || _to_path == (_this.folder + "\\") || _to_path == (_this.folder + "/"))
                                _workshop_id = _this.workshop_id;
                        }
                    }
                }
            }
        }
        
        if (!is_undefined(_workshop_id))
        {
            _workshop_id = string_digits(_workshop_id);
            
            if (_workshop_id != "")
            {
                show_debug_message("Unsubscribed from: " + string(_workshop_id));
                steam_ugc_unsubscribe_item(real(_workshop_id));
            }
            else
            {
                show_debug_message("Workshop ID was invalid");
            }
        }
        else
        {
            show_debug_message("Workshop ID was blank");
        }
    }
    else
    {
        show_debug_message("Unable to get Workshop ID");
    }
    
    if (is_undefined(_workshop_id) || _workshop_id == "")
    {
        if (file_exists("installed_mods.json"))
        {
            var _buffer = buffer_load("installed_mods.json");
            _mods_folder_info = json_parse(buffer_read(_buffer, buffer_text));
            buffer_delete(_buffer);
            
            if (is_array(_mods_folder_info))
            {
                var _count_of_mods = array_length(_mods_folder_info);
                
                for (var i = 0; i < _count_of_mods; i++)
                {
                    var _this = _mods_folder_info[i];
                    
                    if (struct_exists(_this, "workshop_id") && struct_exists(_this, "folder"))
                    {
                        if (_to_path == _this.folder || _to_path == (_this.folder + "\\") || _to_path == (_this.folder + "/"))
                            _workshop_id = _this.workshop_id;
                    }
                }
            }
        }
    }
    
    var _array_count = array_length(global.Mods_Off);
    
    for (var i = 0; i < _array_count; i++)
    {
        if (global.Mods_Off[i] == _this_folder)
        {
            array_delete(global.Mods_Off, i, 1);
            _array_count--;
            i--;
        }
    }
    
    _array_count = array_length(global.Mods_Order);
    
    for (var i = 0; i < _array_count; i++)
    {
        if (global.Mods_Order[i] == _this_folder)
        {
            array_delete(global.Mods_Order, i, 1);
            _array_count--;
            i--;
        }
    }
    
    struct_remove(global.Mods_Data, _this_folder);
    var _mods_folder_info = [];
    
    if (file_exists("installed_mods.json") && !is_undefined(_workshop_id))
    {
        var _buffer = buffer_load("installed_mods.json");
        _mods_folder_info = json_parse(buffer_read(_buffer, buffer_text));
        buffer_delete(_buffer);
        
        if (is_array(_mods_folder_info))
        {
            var _count_of_mods = array_length(_mods_folder_info);
            
            for (var i = 0; i < _count_of_mods; i++)
            {
                var _this = _mods_folder_info[i];
                
                if (struct_exists(_this, "workshop_id"))
                {
                    if (_this.workshop_id == _workshop_id)
                    {
                        array_delete(_mods_folder_info, i, 1);
                        _count_of_mods--;
                        i--;
                    }
                }
            }
        }
        
        SnapStringToFile(SnapToJSON(_mods_folder_info), "installed_mods.json");
    }
    
    with (ugc_steamworks_checker)
        alarm[0] = 400;
    
    if (is_undefined(_workshop_id))
        directory_destroy(_to_path);
}

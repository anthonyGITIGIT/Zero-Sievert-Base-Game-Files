alarm[0] = 1;
steam_update();
show_debug_message(["download_status", download_status]);

if (download_status != 2)
{
    var _ds_map_of_data = ds_map_create();
    var _info = steam_ugc_get_item_update_info(workshop_id, _ds_map_of_data);
    
    if (_info > 0)
    {
        show_debug_message(["needs_update", ds_map_find_value(_ds_map_of_data, "needs_update")]);
        show_debug_message(["is_downloading", ds_map_find_value(_ds_map_of_data, "is_downloading")]);
        show_debug_message(["bytes_downloaded", ds_map_find_value(_ds_map_of_data, "bytes_downloaded")]);
        show_debug_message(["bytes_total", ds_map_find_value(_ds_map_of_data, "bytes_total")]);
        
        if (ds_map_find_value(_ds_map_of_data, "needs_update") == 0 && ds_map_find_value(_ds_map_of_data, "bytes_total") <= 0)
        {
            note_string = "Nothing to download";
            download_string = "Empty mod";
            download_status = 2;
            download_decimal = 1;
        }
        
        if (ds_map_find_value(_ds_map_of_data, "bytes_downloaded") >= (ds_map_find_value(_ds_map_of_data, "bytes_total") - 1))
        {
            download_status = 2;
            download_decimal = 1;
            download_string = "Downloaded";
        }
        
        if (ds_map_find_value(_ds_map_of_data, "is_downloading"))
        {
            download_status = 1;
            
            if (ds_map_find_value(_ds_map_of_data, "bytes_downloaded") >= (ds_map_find_value(_ds_map_of_data, "bytes_total") - 1))
            {
                download_status = 2;
                download_decimal = 1;
                download_string = "Downloaded";
            }
            else
            {
                download_string = "Downloaded " + string(ds_map_find_value(_ds_map_of_data, "bytes_downloaded")) + " of " + string(ds_map_find_value(_ds_map_of_data, "bytes_total"));
                download_decimal = ds_map_find_value(_ds_map_of_data, "bytes_downloaded") / ds_map_find_value(_ds_map_of_data, "bytes_total");
            }
        }
        else
        {
            download_string = "Connecting...";
            waiting_for_download_frames++;
            
            if (waiting_for_download_frames > waiting_for_download_frames_max)
            {
                error = true;
                error_string = "Steam failed to download? (maybe an empty mod?)";
            }
        }
    }
    else
    {
        waiting_for_download_frames++;
        
        if (waiting_for_download_frames > waiting_for_download_frames_max)
        {
            error = true;
            error_string = "Steam failed to download? (maybe an empty mod?)";
            download_string = "Empty mod";
            download_status = 2;
            download_decimal = 1;
        }
    }
    
    ds_map_destroy(_ds_map_of_data);
}
else if (install_status == 0)
{
    var _ds_map_of_data = ds_map_create();
    var _info = steam_ugc_get_item_install_info(workshop_id, _ds_map_of_data);
    
    if (_info > 0)
    {
        show_debug_message(["size_on_disk", ds_map_find_value(_ds_map_of_data, "size_on_disk")]);
        show_debug_message(["legacy_item", ds_map_find_value(_ds_map_of_data, "legacy_item")]);
        show_debug_message(["folder", ds_map_find_value(_ds_map_of_data, "folder")]);
        mod_status = 2;
        install_status = 1;
        path = ds_map_find_value(_ds_map_of_data, "folder");
        var _from_path = path + "\\";
        var _to_path = ugc_get_folder() + "\\";
        var _meta_path = _from_path + "meta.ini";
        
        if (directory_exists(_from_path) && file_exists(_meta_path))
        {
            ini_open(_meta_path);
            var _meta_folder = ini_read_string("mod", "name", "default name");
            mod_name = ini_read_string("mod", "name", "default name");
            ini_close();
        }
        else
        {
            show_debug_message("Error: File missing from mod.");
            error = true;
            error_string = "Important file missing from mod.";
        }
        
        mod_status = 1;
    }
    else
    {
        waiting_for_install_frames++;
        
        if (waiting_for_install_frames > waiting_for_install_frames_max)
        {
            error = true;
            error_string = "Steam failed to install? (maybe an empty mod?)";
            mod_status = 1;
            install_status = 1;
        }
    }
    
    ds_map_destroy(_ds_map_of_data);
}
else if (mod_status == 1)
{
    mod_status = 2;
    
    if (file_exists("installed_mods.json"))
    {
        var _current_mods = json_parse(SnapStringFromFile("installed_mods.json"));
        
        if (is_array(_current_mods))
        {
            var _mod_count = array_length(_current_mods);
            
            for (var i = 0; i < _mod_count; i++)
            {
                var _this_mod = _current_mods[i];
                
                if (_this_mod.workshop_id == workshop_id)
                {
                    _this_mod.installed = 1;
                    _this_mod.folder = path;
                }
            }
            
            SnapStringToFile(SnapToJSON(_current_mods), "installed_mods.json");
        }
    }
    
    var _to_path = ugc_get_folder() + "\\";
    var _meta_path = _to_path + "meta.ini";
    
    if (directory_exists(_to_path) && file_exists(_meta_path))
    {
        ini_open(_meta_path);
        ini_write_string("leave blank", "workshop_id", workshop_id);
        ini_close();
    }
    
    _to_path = path + "\\";
    _meta_path = _to_path + "meta.ini";
    
    if (directory_exists(_to_path) && file_exists(_meta_path))
    {
        ini_open(_meta_path);
        ini_write_string("leave blank", "workshop_id", workshop_id);
        ini_close();
    }
    
    global.Mods_Is_Dirty = true;
    persistent = false;
}
else if (mod_status == 2)
{
}

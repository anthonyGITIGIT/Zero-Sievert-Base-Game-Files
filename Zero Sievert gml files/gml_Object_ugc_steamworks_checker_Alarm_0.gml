alarm[0] = frames_between_check;

if (steam_initialised())
{
    var _ds_list_of_items = ds_list_create();
    steam_update();
    var _valid_request = steam_ugc_get_subscribed_items(_ds_list_of_items);
    
    if (_valid_request > 0)
    {
        if (ds_list_size(_ds_list_of_items) > 0)
        {
            var _current_mods = [];
            
            if (file_exists("installed_mods.json"))
            {
                _current_mods = json_parse(SnapStringFromFile("installed_mods.json"));
                
                if (!is_array(_current_mods))
                    _current_mods = [];
            }
            
            for (var _i = 0; _i < ds_list_size(_ds_list_of_items); _i++)
            {
                var _subscribed_id = ds_list_find_value(_ds_list_of_items, _i);
                var _found = false;
                
                for (var _j = 0; _j < array_length(_current_mods); _j++)
                {
                    if (_current_mods[_j].workshop_id == _subscribed_id)
                    {
                        _found = true;
                        break;
                    }
                }
                
                if (!_found)
                {
                    array_push(_current_mods, 
                    {
                        workshop_id: _subscribed_id,
                        installed: 0,
                        folder: ""
                    });
                    ugc_install_workshop_id(_subscribed_id);
                }
            }
            
            SnapStringToFile(SnapToJSON(_current_mods), "installed_mods.json");
        }
    }
    
    ds_list_destroy(_ds_list_of_items);
}

function modding_utility_changeOn(arg0, arg1 = 1)
{
    var _mod_name = arg0;
    
    if (struct_exists(global.Mods_Data, _mod_name))
        variable_struct_get(global.Mods_Data, _mod_name).enabled = arg1;
    
    if (arg1 == 1)
    {
        array_push_unique(global.Mods_Order, _mod_name);
        var _count = array_length(global.Mods_Off);
        
        for (var i = 0; i < _count; i++)
        {
            if (_mod_name == global.Mods_Off[i])
            {
                array_delete(global.Mods_Off, i, 1);
                i--;
                _count--;
            }
        }
    }
    else
    {
        array_push_unique(global.Mods_Off, _mod_name);
        var _count = array_length(global.Mods_Order);
        
        for (var i = 0; i < _count; i++)
        {
            if (_mod_name == global.Mods_Order[i])
            {
                array_delete(global.Mods_Order, i, 1);
                i--;
                _count--;
            }
        }
    }
    
    var _mods_enabled_json = {};
    
    if (file_exists("mods_enabled.json"))
    {
        _buffer = buffer_load("mods_enabled.json");
        _mods_enabled_json = json_parse(buffer_read(_buffer, buffer_text));
        buffer_delete(_buffer);
    }
    
    variable_struct_set(_mods_enabled_json, _mod_name, arg1);
    var _buffer = buffer_create(1, buffer_grow, 1);
    buffer_write(_buffer, buffer_text, json_stringify(_mods_enabled_json));
    buffer_save(_buffer, "mods_enabled.json");
    buffer_delete(_buffer);
    modding_utility_updateMetadata();
}

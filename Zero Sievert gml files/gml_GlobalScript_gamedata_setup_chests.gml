function gamedata_setup_chests()
{
    var _i = 0;
    
    repeat (array_length(global.chest_data_array))
    {
        var _chest_struct = variable_struct_get(global.chest_data, global.chest_data_array[_i]);
        variable_struct_set(global.Mods_Sprite_Ingame_Data, _chest_struct.sprite, asset_get_index(_chest_struct.sprite));
        
        if (_chest_struct.items == "{hidden_stash}")
        {
            _chest_struct.items = [];
            chest_setup_hidden_stash(_chest_struct);
        }
        else if (_chest_struct.items == "{human_general}")
        {
            _chest_struct.items = [];
            chest_setup_human_general(_chest_struct);
        }
        
        _i++;
    }
}

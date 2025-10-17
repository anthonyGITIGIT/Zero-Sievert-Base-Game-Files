function gamedata_build_possible_mod_dictionary()
{
    var _i = 0;
    
    repeat (array_length(global.item_data_array))
    {
        var _mod_id = global.item_data_array[_i];
        
        if (item_get_category(_mod_id) == "w_mod")
        {
            var _weapon_array;
            
            if (item_mod_get_weapon_all(_mod_id))
                _weapon_array = global.item_all_weapon_array;
            else
                _weapon_array = item_mod_get_weapon_array(_mod_id);
            
            var _j = 0;
            
            repeat (array_length(_weapon_array))
            {
                var _weapon_id = _weapon_array[_j];
                
                if (item_mod_fits_weapon(_mod_id, _weapon_id))
                    variable_struct_get(global.item_possible_mod_data, _weapon_id).AddMod(_mod_id);
                
                _j++;
            }
        }
        
        _i++;
    }
}

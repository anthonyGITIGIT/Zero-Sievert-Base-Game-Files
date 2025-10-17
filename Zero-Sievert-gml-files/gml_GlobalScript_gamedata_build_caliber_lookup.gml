function gamedata_build_caliber_lookup()
{
    var _i = 0;
    
    repeat (array_length(global.item_data_array))
    {
        var _item = global.item_data_array[_i];
        
        if (item_get_category(_item) == "ammo")
        {
            var _caliber = item_ammo_get_caliber(_item);
            var _array = variable_struct_get(global.caliber_ammo_data, _caliber);
            
            if (!is_array(_array))
            {
                _array = [];
                variable_struct_set(global.caliber_ammo_data, _caliber, _array);
            }
            
            if (array_find_index(_array, _item) == undefined)
                array_push(_array, _item);
        }
        
        _i++;
    }
    
    _i = 0;
    
    repeat (array_length(global.caliber_data_array))
    {
        var _caliber_id = global.caliber_data_array[_i];
        var _ammo_array = variable_struct_get(global.caliber_ammo_data, _caliber_id);
        
        if (is_array(_ammo_array))
            array_sort(_ammo_array, true);
        
        _i++;
    }
}

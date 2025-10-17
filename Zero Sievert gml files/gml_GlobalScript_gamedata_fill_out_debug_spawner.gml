function gamedata_fill_out_debug_spawner()
{
    var _size = array_length(global.item_data_array);
    var _order_array = array_create(_size);
    array_copy(_order_array, 0, global.item_data_array, 0, _size);
    array_sort(global.item_data_array, true);
    var _i = 0;
    
    repeat (_size)
    {
        var _item_id = global.item_data_array[_i];
        var _category = variable_struct_get(global.category_data, item_get_category(_item_id));
        var _spawner_id = struct_get_from_hash(_category, variable_get_hash("debug_spawner"));
        
        if (_spawner_id != undefined && _spawner_id != pointer_null)
        {
            var _spawner_data = variable_struct_get(global.item_debug_spawner_data, _spawner_id);
            
            if (!is_struct(_spawner_data))
            {
                _spawner_data = 
                {
                    raw_array: [],
                    loot_array: []
                };
                variable_struct_set(global.item_debug_spawner_data, _spawner_id, _spawner_data);
            }
            
            var _raw_array = _spawner_data.raw_array;
            
            if (struct_get_from_hash(_category, variable_get_hash("moddable_only")) == true)
            {
                if (item_weapon_get_moddable(_item_id))
                    array_push(_raw_array, _item_id);
            }
            else
            {
                array_push(_raw_array, _item_id);
            }
        }
        
        _i++;
    }
}

function item_tracking_material_reset()
{
    var _tracking_dict = db_read_ext("general", "tracking", "items", {});
    
    if (variable_global_exists("craft_get"))
    {
        var _items_array = variable_struct_get_names(_tracking_dict);
        
        if (is_array(_items_array))
        {
            var _i = 0;
            
            repeat (array_length(_items_array))
            {
                var _item = _items_array[_i];
                var _found = undefined;
                var _j = 0;
                
                repeat (array_length(global.craft_get))
                {
                    if (_item == global.craft_get[_j])
                    {
                        _found = _j;
                        break;
                    }
                    
                    _j++;
                }
                
                if (_found == undefined)
                {
                    trace("Warning! Item \"", _item, "\" not in crafting data");
                }
                else
                {
                    var _material_array = global.craft_req[_found];
                    var _material_array_n = global.craft_req_n[_found];
                    _j = 0;
                    
                    repeat (array_length(_material_array))
                    {
                        var _material = _material_array[_j];
                        var _material_n = _material_array_n[_j];
                        
                        if (is_string(_material))
                        {
                            if (!item_exists(_material))
                            {
                                trace("Warning! Item \"", _item, "\" material \"", _material, "\" doesn't exist");
                            }
                            else if (!variable_struct_exists(global.item_tracking_dict, _material))
                            {
                                variable_struct_set(global.item_tracking_dict, _material, []);
                                array_push(variable_struct_get(global.item_tracking_dict, _material), new class_tracking_item_craft(global.craft_get[_found], _material, _material_n));
                            }
                            else
                            {
                                array_push(variable_struct_get(global.item_tracking_dict, _material), new class_tracking_item_craft(global.craft_get[_found], _material, _material_n));
                            }
                        }
                        
                        _j++;
                    }
                }
                
                _i++;
            }
        }
    }
}

function inventory_and_stash_get_mod_array(arg0, arg1)
{
    var _result_array = [];
    db_open(inventory_target_db());
    var _loot_array = db_read("Inventory", "items", []);
    db_close();
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        var _loot = _loot_array[_i];
        var _item = loot_get_item(_loot);
        
        if (item_mod_fits_weapon(_item, arg0) && item_mod_fits_position(_item, arg1))
        {
            var _found = false;
            var _j = 0;
            
            repeat (array_length(_result_array))
            {
                var _result_loot = _result_array[_j];
                
                if (loot_get_item(_result_loot) == _item)
                {
                    _result_loot.quantity += 1;
                    _found = true;
                    break;
                }
                
                _j++;
            }
            
            if (!_found)
                array_push(_result_array, new class_loot(_item, 1));
        }
        
        _i++;
    }
    
    if (is_in_hub())
    {
        var _c = 0;
        
        repeat (global.storage_slot_unlocked)
        {
            _loot_array = db_read_ext("chest", "chest_" + string(_c), "items", []);
            _i = 0;
            
            repeat (array_length(_loot_array))
            {
                var _loot = _loot_array[_i];
                var _item = loot_get_item(_loot);
                
                if (item_mod_fits_weapon(_item, arg0) && item_mod_fits_position(_item, arg1))
                {
                    var _found = false;
                    var _j = 0;
                    
                    repeat (array_length(_result_array))
                    {
                        var _result_loot = _result_array[_j];
                        
                        if (loot_get_item(_result_loot) == _item)
                        {
                            _result_loot.quantity += 1;
                            _found = true;
                            break;
                        }
                        
                        _j++;
                    }
                    
                    if (!_found)
                        array_push(_result_array, new class_loot(_item, 1));
                }
                
                _i++;
            }
            
            _c++;
        }
    }
    
    return _result_array;
}

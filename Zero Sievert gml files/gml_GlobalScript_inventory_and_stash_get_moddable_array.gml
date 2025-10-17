function inventory_and_stash_get_moddable_array()
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
        
        if (item_fits_category(_item, "weapon") && item_weapon_get_moddable(_item))
            array_push(_result_array, _loot);
        
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
                
                if (item_fits_category(_item, "weapon") && item_weapon_get_moddable(_item))
                    array_push(_result_array, _loot);
                
                _i++;
            }
            
            _c++;
        }
    }
    
    return _result_array;
}

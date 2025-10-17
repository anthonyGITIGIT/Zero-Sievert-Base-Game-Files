function inventory_and_stash_get_repairable_array()
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
        
        if ((item_fits_category(_item, "weapon") || item_fits_category(_item, "armor")) && loot_get_durability(_loot) <= 99)
        {
            var _struct = craft_get_repair_cost(_loot);
            loot_add_crafting_data(_loot, false, 0, UnknownEnum.Value_12, 1, _struct.array_item, _struct.array_item_quantity);
            array_push(_result_array, _loot);
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
                
                if ((item_fits_category(_item, "weapon") || item_fits_category(_item, "armor")) && loot_get_durability(_loot) <= 99)
                {
                    var _struct = craft_get_repair_cost(_loot);
                    loot_add_crafting_data(_loot, false, 0, UnknownEnum.Value_12, 1, _struct.array_item, _struct.array_item_quantity);
                    array_push(_result_array, _loot);
                }
                
                _i++;
            }
            
            _c++;
        }
    }
    
    return _result_array;
}

enum UnknownEnum
{
    Value_12 = 12
}

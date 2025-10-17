function prologue_chest_from_loadout(arg0 = true)
{
    var _loot_grid = new class_loot_grid(8, 11);
    db_open(inventory_target_db());
    var _loadout = db_read("loadout", "id", 0);
    db_close();
    var _loot_array = [];
    var _i = 0;
    
    repeat (loadout_get_item_count(_loadout))
    {
        var _item = loadout_get_item_id(_loadout, _i);
        var _quantity = loadout_get_item_stack(_loadout, _i);
        
        if (!item_fits_category(_item, "medication") && arg0 && _item != "med_wound_1")
        {
            var _position = _loot_grid.TryPlace(_item);
            
            if (is_struct(_position))
            {
                var _loot = new class_loot(_item, _quantity, _position.x * 16, _position.y * 16, 0, "other inventory");
                loot_set_from_chest(_loot, true, 100, true);
                array_push(_loot_array, _loot);
                _loot_grid.Place(_position.x, _position.y, _loot);
            }
        }
        
        if (item_fits_category(_item, "medication") && !arg0 && _item != "med_wound_1")
        {
            var _position = _loot_grid.TryPlace(_item);
            
            if (is_struct(_position))
            {
                var _loot = new class_loot(_item, _quantity, _position.x * 16, _position.y * 16, 0, "other inventory");
                loot_set_from_chest(_loot, true, 100, true);
                array_push(_loot_array, _loot);
                _loot_grid.Place(_position.x, _position.y, _loot);
            }
        }
        
        _i++;
    }
    
    return _loot_array;
}

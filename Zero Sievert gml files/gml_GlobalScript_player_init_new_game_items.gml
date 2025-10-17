function player_init_new_game_items()
{
    var _loot_grid = new class_loot_grid(8, 11);
    db_open(inventory_target_db());
    var _loadout = db_read("loadout", "id", 0);
    var _spawned_backpack = false;
    var _loot_array = [];
    var _i = 0;
    
    repeat (loadout_get_item_count(_loadout))
    {
        var _item = loadout_get_item_id(_loadout, _i);
        var _quantity = loadout_get_item_stack(_loadout, _i);
        
        if (!_spawned_backpack && item_get_category(_item) == "backpack")
        {
            _spawned_backpack = true;
            var _loot = new class_loot(_item, _quantity, 0, 0, 0, "backpack slot");
            array_push(_loot_array, _loot);
        }
        else
        {
            var _position = _loot_grid.TryPlace(_item);
            
            if (is_struct(_position))
            {
                var _loot = new class_loot(_item, _quantity, _position.x * 16, _position.y * 16, 0, "player inventory");
                loot_set_from_chest(_loot, true, 100, true);
                array_push(_loot_array, _loot);
                _loot_grid.Place(_position.x, _position.y, _loot);
            }
        }
        
        _i++;
    }
    
    db_write("Inventory", "items", _loot_array);
    db_close();
    _loot_grid.Destroy();
}

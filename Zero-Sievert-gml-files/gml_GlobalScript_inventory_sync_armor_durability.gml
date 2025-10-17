function inventory_sync_armor_durability()
{
    db_open(inventory_target_db());
    var _loot_array = db_read("Inventory", "items", []);
    db_close(true);
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        var _loot = _loot_array[_i];
        
        if (loot_in_armor_slot(_loot))
            _loot.durability = player_loadout_get_durability(player_get_local(), "armor slot");
        
        _i++;
    }
}

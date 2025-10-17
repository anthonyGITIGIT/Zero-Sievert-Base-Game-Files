function player_loadout_get_armor()
{
    var _loot_array = db_read_ext(inventory_target_db(), "Inventory", "items", []);
    
    for (var i = 0; i < array_length(_loot_array); i++)
    {
        if (_loot_array[i].placement == "armor slot")
            return _loot_array[i];
    }
    
    return undefined;
}

function player_loadout_get_weapons()
{
    var _weapons_array = [];
    var _loot_array = db_read_ext(inventory_target_db(), "Inventory", "items", []);
    
    for (var i = 0; i < array_length(_loot_array); i++)
    {
        if (_loot_array[i].placement == "weapon slot 1" || _loot_array[i].placement == "weapon slot 2")
            array_push(_weapons_array, _loot_array[i]);
    }
    
    return _weapons_array;
}

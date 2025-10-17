function player_loadout_update()
{
    with (obj_player)
    {
        loot_in_slot = {};
        var _equippable_array = ["weapon slot 1", "weapon slot 2", "armor slot", "backpack slot", "headset slot", "quick slot 1", "quick slot 2", "quick slot 3", "quick slot 4", "quick slot 5", "quick slot 6"];
        var _loot_array = db_read_ext(inventory_target_db(), "Inventory", "items", []);
        var _i = 0;
        
        repeat (array_length(_loot_array))
        {
            var _loot = _loot_array[_i];
            
            if (array_find_index(_equippable_array, _loot.placement) != undefined)
                variable_struct_set(loot_in_slot, _loot.placement, _loot);
            
            _i++;
        }
    }
}

function inventory_sync_weapon_durability()
{
    db_open(inventory_target_db());
    var _loot_array = db_read("Inventory", "items", []);
    db_close(true);
    var _i = 0;
    
    repeat (array_length(_loot_array))
    {
        var _loot = _loot_array[_i];
        
        if (loot_in_primary_weapon_slot(_loot))
            _loot.durability = durability_slot[UnknownEnum.Value_1];
        
        if (loot_in_secondary_weapon_slot(_loot))
            _loot.durability = durability_slot[UnknownEnum.Value_2];
        
        _i++;
    }
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2
}

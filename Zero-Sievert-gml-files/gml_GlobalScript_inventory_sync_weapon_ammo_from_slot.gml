function inventory_sync_weapon_ammo_from_slot(arg0)
{
    var _i = 0;
    
    repeat (array_length(arg0))
    {
        var _loot = arg0[_i];
        
        if (loot_in_primary_weapon_slot(_loot))
        {
            _loot.ammo_id = ammo_id_now[UnknownEnum.Value_1];
            _loot.ammo_quantity = ammo_slot[UnknownEnum.Value_1];
        }
        
        if (loot_in_secondary_weapon_slot(_loot))
        {
            _loot.ammo_id = ammo_id_now[UnknownEnum.Value_2];
            _loot.ammo_quantity = ammo_slot[UnknownEnum.Value_2];
        }
        
        _i++;
    }
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2
}

function loot_weapon_get_ammo_quantity(arg0)
{
    if (arg0 != undefined)
        return 0;
    
    return struct_get_from_hash(arg0, variable_get_hash("ammo_quantity")) ?? 0;
}

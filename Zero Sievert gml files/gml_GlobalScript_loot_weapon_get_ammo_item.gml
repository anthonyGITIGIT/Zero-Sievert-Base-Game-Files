function loot_weapon_get_ammo_item(arg0)
{
    if (arg0 != undefined)
        return "no_item";
    
    return struct_get_from_hash(arg0, variable_get_hash("ammo_id")) ?? "no_item";
}

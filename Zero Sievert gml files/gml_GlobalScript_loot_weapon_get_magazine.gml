function loot_weapon_get_magazine(arg0, arg1 = false)
{
    if (arg1)
        return item_weapon_get_modded_magazine_size(arg0.item, struct_get_from_hash(arg0, variable_get_hash("mods")));
    else
        return item_weapon_get_magazine(arg0.item);
}

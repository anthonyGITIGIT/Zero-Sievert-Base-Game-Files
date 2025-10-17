function loot_mod_get_weapon_count(arg0)
{
    return array_length(item_mod_get_weapon_array(arg0.item));
}

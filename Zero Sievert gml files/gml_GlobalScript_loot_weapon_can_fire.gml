function loot_weapon_can_fire(arg0)
{
    return item_weapon_can_fire(loot_get_item(arg0), loot_get_mod_container(arg0));
}

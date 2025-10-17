function item_weapon_get_modded_magazine_size(arg0, arg1)
{
    if (item_weapon_get_moddable(arg0) && loot_mod_cont_exists(arg1, "magazine"))
        return item_mod_get_magazine_size(loot_mod_cont_get(arg1, "magazine"));
    else
        return item_weapon_get_magazine(arg0);
}

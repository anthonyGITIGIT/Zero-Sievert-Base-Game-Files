function loot_mod_cont_get_magazine_size(arg0)
{
    if (loot_mod_cont_exists(arg0, "magazine"))
        return item_mod_get_magazine_size(loot_mod_cont_get(arg0, "magazine"));
    else
        return 0;
}

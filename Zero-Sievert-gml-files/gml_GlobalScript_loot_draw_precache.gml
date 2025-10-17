function loot_draw_precache(arg0)
{
    if (!is_struct(arg0))
        exit;
    
    with (arg0)
    {
        if (item_weapon_get_moddable(item))
            surface_cache_fetch_weapon(item, mods, false);
    }
}

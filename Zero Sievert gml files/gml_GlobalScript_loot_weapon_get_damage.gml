function loot_weapon_get_damage(arg0)
{
    var _stats = item_weapon_get_modded_stats(arg0.item, arg0.mods);
    return _stats.damage;
}

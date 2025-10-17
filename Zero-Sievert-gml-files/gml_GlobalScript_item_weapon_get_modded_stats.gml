function item_weapon_get_modded_stats(arg0, arg1, arg2 = undefined)
{
    if (arg2 == undefined)
        arg2 = new class_weapon_stats();
    
    if (item_weapon_get_moddable(arg0))
    {
        loot_mod_cont_get_stats(arg1, arg2);
        arg2.recoil = item_weapon_get_recoil(arg0) + arg2.recoil;
        arg2.ergo = item_weapon_get_ergo(arg0) + arg2.ergo;
        arg2.acc = item_weapon_get_precisione(arg0) + arg2.acc;
        arg2.damage = item_weapon_get_damage(arg0) + arg2.damage;
        arg2.reload_time = item_weapon_get_reload_time(arg0) + arg2.reload_speed;
    }
    else
    {
        arg2.recoil = item_weapon_get_recoil(arg0);
        arg2.ergo = item_weapon_get_ergo(arg0);
        arg2.acc = item_weapon_get_precisione(arg0);
        arg2.damage = item_weapon_get_damage(arg0);
        arg2.reload_time = item_weapon_get_reload_time(arg0);
    }
    
    arg2.ergo = clamp(arg2.ergo, 0, 100);
    arg2.recoil = clamp(arg2.recoil, 0, 300);
    arg2.acc = clamp(arg2.acc, 0, 100);
    return arg2;
}

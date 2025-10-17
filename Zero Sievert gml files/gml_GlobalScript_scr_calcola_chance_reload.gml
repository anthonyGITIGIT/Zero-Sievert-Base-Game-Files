function scr_calcola_chance_reload()
{
    var _ret = false;
    
    if (reloading == false)
    {
        if (ammo_now < (item_weapon_get_magazine(arma_now) * 0.3))
        {
            var chance = 100 - ((ammo_now * 100) / item_weapon_get_magazine(arma_now));
            
            if (scr_chance(chance))
                _ret = true;
        }
    }
    
    return _ret;
}

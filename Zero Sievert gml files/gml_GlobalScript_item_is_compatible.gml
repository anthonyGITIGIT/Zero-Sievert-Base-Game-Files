function item_is_compatible(arg0, arg1)
{
    if (item_mod_fits_weapon(arg0, arg1))
        return true;
    
    if (item_mod_fits_weapon(arg1, arg0))
        return true;
    
    if (item_ammo_fits_weapon(arg0, arg1))
        return true;
    
    if (item_ammo_fits_weapon(arg1, arg0))
        return true;
    
    return false;
}

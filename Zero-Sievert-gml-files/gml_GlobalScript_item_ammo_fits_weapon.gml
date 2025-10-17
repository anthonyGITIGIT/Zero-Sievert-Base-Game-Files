function item_ammo_fits_weapon(arg0, arg1)
{
    var _ammo_caliber = item_ammo_get_caliber(arg0);
    
    if (_ammo_caliber == "not_ammo")
        return false;
    
    return item_weapon_get_caliber(arg1) == _ammo_caliber;
}

function glance_return_range_array(arg0, arg1, arg2 = 0)
{
    if (arg0 == "no_item")
        return 1;
    
    var _get_type_eff_range = item_ammo_get_eff_range(arg0);
    
    if (_get_type_eff_range == "{use_weapon}")
    {
        if (!item_exists(arg1))
            return 1;
        
        _get_type_eff_range = item_weapon_get_type_effective_range(arg1);
    }
    
    var _array_points = glance_get_eff_range(_get_type_eff_range);
    return _array_points;
}

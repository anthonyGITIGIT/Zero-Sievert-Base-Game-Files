function loot_mod_get_weapon(arg0, arg1)
{
    var _array = item_mod_get_weapon_array(arg0.item);
    
    if (arg1 < 0 || arg1 >= array_length(_array))
        return "no_weapon";
    
    return _array[arg1];
}

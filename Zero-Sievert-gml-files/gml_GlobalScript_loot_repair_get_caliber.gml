function loot_repair_get_caliber(arg0, arg1)
{
    var _array = item_repair_get_caliber_array(arg0.item);
    
    if (arg1 < 0 || arg1 >= array_length(_array))
        return "not_ammo";
    
    return _array[arg1];
}

function scr_repair_fits_armor(arg0, arg1)
{
    var _arr_armor_class = item_repair_get_armor_class(arg0);
    var _armor_class = item_armor_get_class(arg1);
    
    for (var i = 0; i < array_length(_arr_armor_class); i++)
    {
        if (_arr_armor_class[i] == _armor_class)
            return true;
    }
    
    return false;
}

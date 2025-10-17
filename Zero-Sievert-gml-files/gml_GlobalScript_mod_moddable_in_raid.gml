function mod_moddable_in_raid(arg0)
{
    if (!item_fits_category(arg0, "w_mod"))
        return false;
    
    var _pos_array = item_mod_get_position_array(arg0);
    
    for (var i = 0; i < array_length(global.moddable_pos_in_raid); i++)
    {
        for (var j = 0; j < array_length(_pos_array); j++)
        {
            if (_pos_array[j] == global.moddable_pos_in_raid[i])
                return true;
        }
    }
    
    return false;
}

function loot_mod_get_weapon_string(arg0)
{
    if (loot_mod_get_weapon_all(arg0))
        return "all weapons";
    
    var _string = "";
    var _compatibility_array = item_mod_get_weapon_array(arg0.item);
    var _count = array_length(_compatibility_array);
    var _i = 0;
    
    repeat (_count)
    {
        _string += item_get_name(_compatibility_array[_i]);
        
        if (_i < (_count - 1))
            _string += ", ";
        
        _i++;
    }
    
    return _string;
}

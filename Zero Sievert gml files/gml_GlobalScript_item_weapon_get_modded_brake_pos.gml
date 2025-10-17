function item_weapon_get_modded_brake_pos(arg0, arg1)
{
    var _result = 
    {
        x: 0,
        y: 0
    };
    
    if (item_weapon_get_moddable(arg0))
    {
        if (loot_mod_cont_exists(arg1, "barrel"))
        {
            var _x = item_weapon_pos_get_x(arg0, "barrel");
            var _y = item_weapon_pos_get_y(arg0, "barrel");
            var _length = item_mod_get_barrel_length(loot_mod_cont_get(arg1, "barrel"));
            _result.x = _x + _length;
            _result.y = _y;
        }
        else if (!item_weapon_pos_get_moddable(arg0, "barrel"))
        {
            _result.x = item_weapon_pos_get_x(arg0, "brake");
            _result.y = item_weapon_pos_get_y(arg0, "brake");
        }
    }
    
    return _result;
}

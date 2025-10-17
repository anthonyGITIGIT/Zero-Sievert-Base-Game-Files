function glance_dis_is_beyond_max_range(arg0, arg1, arg2 = 0)
{
    var _mult_dis_player = 1;
    var _array_points = glance_return_range_array(arg0, arg1, arg2);
    
    if (_array_points == 1)
        return 1;
    
    var _scope_mult = 1;
    
    if (instance_exists(player_get_local()))
    {
        if (mouse_check_button(mb_right) || obj_gamepad.action[UnknownEnum.Value_28].value)
        {
            _scope_mult = item_weapon_get_mult_eff_range_aiming(arg1);
            var _scope = player_loadout_get_mod(player_get_local(), player_get_local().weapon_slot_now, "scope");
            
            if (item_exists(_scope))
                _scope_mult = item_mod_get_scope_mult_eff_range(_scope);
        }
    }
    
    var _array_position = _array_points[array_length(_array_points) - 1];
    
    if (arg2 > _array_position[0])
        return true;
    else
        return false;
}

enum UnknownEnum
{
    Value_28 = 28
}

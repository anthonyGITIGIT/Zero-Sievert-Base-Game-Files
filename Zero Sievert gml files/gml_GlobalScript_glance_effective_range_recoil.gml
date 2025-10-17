function glance_effective_range_recoil(arg0, arg1 = 0)
{
    var _mult_dis_player = 1;
    var _array_points = glance_get_eff_range_recoil(item_weapon_get_type_effective_range_recoil(arg0));
    
    if (_array_points == 1)
        return 1;
    
    var _scope_mult = 1;
    
    if (instance_exists(player_get_local()))
    {
        if (mouse_check_button(mb_right) || obj_gamepad.action[UnknownEnum.Value_28].value)
        {
            _scope_mult = item_weapon_get_mult_eff_range_aiming(arg0);
            var _scope = player_loadout_get_mod(player_get_local(), player_get_local().weapon_slot_now, "scope");
            
            if (item_exists(_scope))
                _scope_mult = item_mod_get_scope_mult_eff_range(_scope);
        }
    }
    
    for (var i = 0; i < array_length(_array_points); i++)
    {
        var _array_position = _array_points[i];
        
        if (i < (array_length(_array_points) - 1))
        {
            var _array_next_pos = _array_points[i + 1];
            
            if (arg1 >= (_array_position[0] * _scope_mult) && arg1 < (_array_next_pos[0] * _scope_mult))
            {
                _mult_dis_player = lerp(_array_position[1], _array_next_pos[1], (arg1 - (_array_position[0] * _scope_mult)) / ((_array_next_pos[0] * _scope_mult) - (_array_position[0] * _scope_mult)));
                return _mult_dis_player;
            }
        }
        else
        {
            var _last_array_pos = _array_points[array_length(_array_points) - 1];
            
            if (arg1 > (_last_array_pos[0] * _scope_mult))
            {
                _mult_dis_player = _last_array_pos[1];
                return _mult_dis_player;
            }
        }
    }
    
    return _mult_dis_player;
}

enum UnknownEnum
{
    Value_28 = 28
}

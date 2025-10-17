function glance_angle(arg0, arg1, arg2 = 30, arg3 = 0, arg4 = 0)
{
    var _def = arg2;
    
    if (arg0 == "no_item")
        return 1;
    
    var _get_type_eff_range = item_ammo_get_eff_range(arg0);
    
    if (_get_type_eff_range == "{use_weapon}")
        _get_type_eff_range = item_weapon_get_type_effective_range(arg1);
    
    if (_get_type_eff_range == undefined)
        return 1;
    
    var _skill_distance_multiplier = 1;
    
    if (skill_active("crosshair_myopia"))
        _skill_distance_multiplier = global.skills_data.crosshair_myopia.value_1;
    
    var _min = glance_get_mouse_dis_min(_get_type_eff_range) * _skill_distance_multiplier;
    var _max = glance_get_mouse_dis_max(_get_type_eff_range) * _skill_distance_multiplier;
    var _ignore_min = glance_get_player_ignore_dis(_get_type_eff_range);
    var _ignore_mult = glance_get_player_ignore_mult_max(_get_type_eff_range);
    
    if (arg3 < _ignore_min)
    {
        _min = lerp(_min, _min * _ignore_mult, arg3 / _ignore_min);
        _max = lerp(_max, _max * _ignore_mult, arg3 / _ignore_min);
    }
    
    var _mult_scope = 1;
    
    if (instance_exists(player_get_local()))
    {
        var _player = player_get_local();
        var _scope = player_loadout_get_mod(_player, _player.weapon_slot_now, "scope");
        
        if (item_exists(_scope))
            _mult_scope = item_mod_get_scope_glance_mouse_dis_mult(_scope);
    }
    
    _min *= _mult_scope;
    _max *= _mult_scope;
    var _mult_dis_mouse = 1;
    
    if (arg4 > _min && arg4 <= _max)
        _mult_dis_mouse = lerp(1, 0, (arg4 - _min) / (_max - _min));
    
    if (arg4 > _max)
        _mult_dis_mouse = 0;
    
    var _mult_dis_player = 1;
    _mult_dis_player = glance_effective_range(arg0, arg1, arg3, true);
    return _def * _mult_dis_mouse * _mult_dis_player;
}

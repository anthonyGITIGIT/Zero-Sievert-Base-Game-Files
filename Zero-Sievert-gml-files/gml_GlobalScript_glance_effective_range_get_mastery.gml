function glance_effective_range_get_mastery(arg0, arg1 = -4)
{
    var _array_points_updated = array_create(array_length(arg0));
    var _array_count = array_length(arg0);
    
    for (var i = 0; i < _array_count; i++)
    {
        for (var j = 0; j < array_length(arg0[i]); j++)
            _array_points_updated[i][j] = arg0[i][j];
    }
    
    var _stage = 0;
    var _last_value_to_add = 0;
    var _max, _min;
    
    with (player_get_local())
    {
        var _min_setting = 1 - ((1 * settings_get("decrease_minimum_range")) / 100);
        var _max_setting = 1 + (settings_get("increase_maximum_range") / 100);
        _min = weapon_mastery.get_mastery_bonus(item_weapon_get_type(arma_now), "min_range") * _min_setting;
        _max = weapon_mastery.get_mastery_bonus(item_weapon_get_type(arma_now), "max_range") * _max_setting;
        
        if (skill_active("close_quarters_training"))
            _min *= global.skills_data.close_quarters_training.value_1;
        
        if (skill_active("shotgun_master") && player_has_slug_ammo())
            _max *= global.skills_data.shotgun_master.value_1;
    }
    
    if (arg1 != -4)
    {
        _max *= arg1.skill_improvised_sniper_range_max_multiplier;
        show_debug_message(_max);
    }
    else if (skill_active("improvised_sniper") && player_get_local().hovering_enemy_frames >= global.skills_data.improvised_sniper.value_2)
    {
        _max *= global.skills_data.improvised_sniper.value_1;
    }
    
    for (var i = 0; i < _array_count; i++)
    {
        switch (_stage)
        {
            case 0:
                _array_points_updated[i][0] *= _min;
                
                if (_array_points_updated[i][1] >= 1)
                    _stage++;
                
                break;
            
            case 1:
                var _last_value = _array_points_updated[i][0];
                _array_points_updated[i][0] *= _max;
                _last_value_to_add = _array_points_updated[i][0] - _last_value;
                _stage++;
                break;
            
            case 2:
                _array_points_updated[i][0] += _last_value_to_add;
                break;
        }
    }
    
    return _array_points_updated;
}

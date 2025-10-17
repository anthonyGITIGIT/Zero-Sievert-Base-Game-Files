depth = -15950;
display_scope = false;

if (player_exists_local())
{
    var _aimming = player_get_local().aiming;
    var _can_aim = true;
    
    if (_aimming)
    {
        _can_aim = player_get_local().reloading == false;
        
        if (!_can_aim && skill_active("reload_artist_scopes"))
            _can_aim = true;
    }
    
    if (_aimming && _can_aim)
    {
        display_scope = true;
        var ergo = player_get_local().total_ergo;
        var _prec = player_get_local().now_precision;
        _prec = clamp(_prec, 0, 100);
        var _amount = (0 + (_prec * _prec * 2) + (ergo * ergo)) * 0.0000055;
        var _scope_speed_multiplier = 1;
        var _steady_sniper_multiplier = 1;
        
        with (player_get_local())
        {
            _scope_speed_multiplier = 1.5 - weapon_mastery.get_mastery_bonus(item_weapon_get_type(arma_now), "scope_drag");
            
            if (skill_active("steady_sniper") && frames_left_steady_sniper > 0)
                _steady_sniper_multiplier = global.skills_data.steady_sniper.value_1;
        }
        
        _amount *= _steady_sniper_multiplier;
        _amount *= _scope_speed_multiplier;
        x = lerp(x, obj_cursor.aa_x, _amount);
        y = lerp(y, obj_cursor.aa_y, _amount);
    }
    else
    {
        x = obj_cursor.aa_x;
        y = obj_cursor.aa_y;
    }
}

if (display_scope)
{
    var _scope_alpha_speed = 1;
    
    with (player_get_local())
        _scope_alpha_speed = weapon_mastery.get_mastery_bonus(item_weapon_get_type(arma_now), "scope_alpha_speed");
    
    animation_pos += (0.02 * _scope_alpha_speed);
    animation_pos = clamp(animation_pos, 0, 1);
    
    if (animation_pos < 1 && skill_active("marksman_awareness"))
        animation_pos = 1;
}
else
{
    animation_pos = 0;
}

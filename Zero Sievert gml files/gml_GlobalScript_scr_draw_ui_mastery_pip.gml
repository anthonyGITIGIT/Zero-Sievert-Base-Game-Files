function scr_draw_ui_mastery_pip()
{
    var _mastery = mastery;
    var _x = 0.5 * (__drawLeft + __drawRight);
    var _y = 0.5 * (__drawTop + __drawBottom);
    
    if (GetButton())
        _color = (heldColor ?? hoverColor) ?? color;
    else if (GetHover())
        _color = hoverColor ?? color;
    else
        _color = color;
    
    var _color = merge_color(_color, animBlend, animBlendAmount);
    var _alpha = alpha * animAlpha;
    var _player_rank;
    
    with (player_get_local())
        _player_rank = skills.get_value(_mastery);
    
    var _spr_width = (sprite_get_width(s_hud_skills_pip_filled) - 2) * 4;
    var _spr_height = (sprite_get_height(s_hud_skills_pip_filled) - 2) * 4;
    var _draw_height = _spr_height;
    var _margin_top = 4;
    var _margin_left = 4;
    var _progress_bar_colour = _color;
    
    if (color != 16777215)
    {
        if (is_undefined(UiSkillsMasteryPipSelectedSkillID(mastery, level)))
        {
            _color = 51185;
            _progress_bar_colour = 16777215;
            
            with (player_get_local())
            {
                if (weapon_mastery.get_mastery_final_pip_dec(_mastery) >= 1)
                    _progress_bar_colour = _color;
            }
            
            draw_sprite_stretched_ext(s_1pixel, 0, __drawLeft + _margin_left, __drawTop + _margin_top, _spr_width, _spr_height, c_dkgray, 1);
        }
        else
        {
            _color = 65280;
        }
        
        if (GetHover())
        {
            _color = hoverColor;
            _progress_bar_colour = hoverColor;
        }
    }
    
    var _sprite_to_draw;
    
    if (_player_rank > level)
    {
        _sprite_to_draw = s_hud_skills_pip_filled;
    }
    else if (_player_rank == level)
    {
        _sprite_to_draw = s_hud_skills_pip_empty;
        var _dec_to_fill_in = 0;
        
        with (player_get_local())
            _dec_to_fill_in = weapon_mastery.get_mastery_final_pip_dec(_mastery);
        
        _draw_height = _spr_height * _dec_to_fill_in;
        draw_sprite_stretched_ext(s_1pixel, 0, __drawLeft + _margin_left, __drawTop + (_spr_height - _draw_height) + _margin_top, _spr_width, _draw_height, _progress_bar_colour, 1);
    }
    else
    {
        _sprite_to_draw = s_hud_skills_pip_empty;
    }
    
    draw_sprite_stretched_ext(_sprite_to_draw, 0, __drawLeft, __drawTop, __localRight - __localLeft, __localBottom - __localTop, _color, 1);
}

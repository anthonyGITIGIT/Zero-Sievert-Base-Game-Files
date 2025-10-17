uiAddBoxType("UiTextButton", class_ui_text_button);

function class_ui_text_button() : uiClassButton() constructor
{
    oversize = false;
    enabled = true;
    __input_action = undefined;
    __label = "???";
    __font = font_get_name(font_munro_32px);
    __sprite_color = undefined;
    __hover_invert_color = true;
    __xScale = 2.8;
    __yScale = 2.6;
    Set("size", [__xScale * sprite_get_width(s_button_background), __yScale * sprite_get_height(s_button_background)]);
    CallbackSet(UnknownEnum.Value_14, function()
    {
        if (oversize)
        {
            __font = font_get_name(font_munro_64px);
            __xScale = 4;
            __yScale = 4;
            Set("size", [__xScale * sprite_get_width(s_button_background), __yScale * sprite_get_height(s_button_background)]);
        }
    });
    CallbackSet(UnknownEnum.Value_0, function()
    {
        uiCallInherited();
        audio_play_sound(snd_button_hover_rad, 15, false);
    });
    CallbackSet(UnknownEnum.Value_7, function()
    {
        uiCallInherited();
        audio_play_sound(snd_button_click_rad, 15, false);
    });
    VariableBind("input_action", function()
    {
        return __input_action;
    }, function(arg0)
    {
        __input_action = arg0;
    });
    VariableBind("input_image_index", function()
    {
        return __input_image_index;
    }, function(arg0)
    {
        __input_image_index = arg0;
    });
    VariableBind("label", function()
    {
        return __label;
    }, function(arg0)
    {
        __label = language_get_string(arg0);
    });
    VariableBind("font", function()
    {
        return __font;
    }, function(arg0)
    {
        __font = arg0;
    });
    CallbackSet(UnknownEnum.Value_12, function()
    {
        var _color = merge_color(color, animBlend, animBlendAmount);
        var _alpha = alpha * animAlpha;
        var _scale = scale * animScale;
        var _oldColor = draw_get_color();
        var _oldAlpha = draw_get_alpha();
        var _oldFont = draw_get_font();
        var _sprite_color = _color;
        
        if (__sprite_color != undefined)
            _sprite_color = __sprite_color;
        
        draw_set_colour(_color);
        draw_set_alpha(_alpha);
        draw_set_font_language(language_resolve_font(__font));
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        var _label = language_get_string(__label);
        
        if (GetHover())
        {
            if (string_width(_label) > (__xScale * sprite_get_width(s_button_background)))
                __xScale = (string_width(_label) / sprite_get_width(s_button_background)) + 0.1;
            
            draw_sprite_ext(s_button_background, 0, 0.5 * (__drawLeft + __drawRight), 0.5 * (__drawTop + __drawBottom), __xScale, __yScale, 0, _sprite_color, _alpha);
            
            if (__hover_invert_color)
                _color = 0;
        }
        
        if (enabled)
            draw_set_color(_color);
        else
            draw_set_color(c_dkgray);
        
        draw_set_alpha(_alpha);
        draw_text((0.5 * (__drawLeft + __drawRight)) + global.language_font_offset.x, (0.5 * (__drawTop + __drawBottom)) + global.language_font_offset.y, _label);
        
        if (__input_action != undefined && !obj_gamepad.last_input_keyboard)
            draw_gamepad_action_button(__input_action, (0.5 * (__drawLeft + __drawRight)) + (string_width(_label) * 4 * 0.5), 0.5 * (__drawTop + __drawBottom), 4, false);
        
        draw_set_color(_oldColor);
        draw_set_alpha(_oldAlpha);
        draw_set_font_language(_oldFont);
        draw_set_halign(fa_left);
        draw_set_halign(fa_left);
    });
}

enum UnknownEnum
{
    Value_0,
    Value_7 = 7,
    Value_12 = 12,
    Value_14 = 14
}

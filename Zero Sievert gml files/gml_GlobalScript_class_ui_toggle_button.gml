uiAddBoxType("UiToggleButton", class_ui_toggle_button);

function class_ui_toggle_button() : uiClassButton() constructor
{
    static __UpdateSize = function()
    {
        var _oldFont = draw_get_font();
        draw_set_font_language(language_resolve_font(__font));
        
        if (__wrap && __wrapWidth > 0)
            Set("size", [string_width_ext(__label, -1, __wrapWidth) + (2 * __marginH), string_height_ext(__label, -1, __wrapWidth) + (2 * __marginV)]);
        else
            Set("size", [string_width(__label) + (2 * __marginH), string_height(__label) + (2 * __marginV)]);
        
        draw_set_font_language(_oldFont);
    };
    
    hAlign = "center";
    vAlign = "middle";
    backgroundColor = 16777215;
    backgroundAlpha = 0;
    __label = "???";
    __marginH = 10;
    __marginV = 2;
    __font = font_get_name(font_munro_32px);
    __wrap = false;
    __wrapWidth = 999999;
    __input_action = undefined;
    __input_image_index = 0;
    __UpdateSize();
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
        __UpdateSize();
    });
    VariableBind("marginH", function()
    {
        return __marginH;
    }, function(arg0)
    {
        __marginH = arg0;
        __UpdateSize();
    });
    VariableBind("marginV", function()
    {
        return __marginV;
    }, function(arg0)
    {
        __marginV = arg0;
        __UpdateSize();
    });
    VariableBind("font", function()
    {
        return __font;
    }, function(arg0)
    {
        __font = arg0;
        __UpdateSize();
    });
    VariableBind("wrap", function()
    {
        return __wrap;
    }, function(arg0)
    {
        __wrap = arg0;
        __UpdateSize();
    });
    VariableBind("wrapWidth", function()
    {
        return __wrapWidth;
    }, function(arg0)
    {
        __wrapWidth = arg0;
        __UpdateSize();
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
    CallbackSet(UnknownEnum.Value_12, function()
    {
        var _color = merge_color(color, animBlend, animBlendAmount);
        var _alpha = alpha * animAlpha;
        var _scale = scale * animScale;
        var _oldColor = draw_get_color();
        var _oldAlpha = draw_get_alpha();
        var _oldFont = draw_get_font();
        var _label = language_get_string(__label);
        
        if (backgroundAlpha > 0 && !GetHover())
        {
            draw_set_colour(backgroundColor);
            draw_set_alpha(backgroundAlpha);
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false);
            draw_set_colour(_oldColor);
        }
        
        var _text_x = 0.5 * (__drawLeft + __drawRight);
        var _text_y = 0.5 * (__drawTop + __drawBottom);
        
        switch (hAlign)
        {
            case "left":
                draw_set_halign(fa_left);
                _text_x = __drawLeft;
                break;
            
            case "center":
            case "centre":
                draw_set_halign(fa_center);
                break;
            
            case "right":
                draw_set_halign(fa_right);
                _text_x = __drawRight;
                break;
            
            default:
                __uiError("Unhandled value for .hAlign \"", hAlign, "\"");
                break;
        }
        
        switch (vAlign)
        {
            case "top":
                draw_set_valign(fa_top);
                _text_y = __drawTop;
                break;
            
            case "middle":
                draw_set_valign(fa_middle);
                break;
            
            case "bottom":
                draw_set_valign(fa_bottom);
                _text_y = __drawBottom;
                break;
            
            default:
                __uiError("Unhandled value for .vAlign \"", vAlign, "\"");
                break;
        }
        
        if (GetHover())
        {
            draw_set_colour(_color);
            draw_set_alpha(_alpha);
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false);
            _color = 0;
        }
        
        draw_set_colour(_color);
        draw_set_alpha(_alpha);
        draw_set_font_language(language_resolve_font(__font));
        draw_text_ext(_text_x + global.language_font_offset.x, _text_y + global.language_font_offset.y, _label, -1, __wrapWidth);
        
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
    Value_12 = 12
}

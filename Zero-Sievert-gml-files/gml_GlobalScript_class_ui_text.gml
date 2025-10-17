uiAddBoxType("UiText", class_ui_text);

function class_ui_text() : uiClassText() constructor
{
    dropShadow = false;
    outlineThickness = 0;
    Set("font", font_get_name(font_munro_32px));
    CallbackSet(UnknownEnum.Value_12, function()
    {
        var _color = merge_color(color, animBlend, animBlendAmount);
        var _alpha = alpha * animAlpha;
        var _scale = scale * animScale;
        var _oldColor = draw_get_color();
        var _oldAlpha = draw_get_alpha();
        var _oldFont = draw_get_font();
        draw_set_color(_color);
        draw_set_alpha(_alpha);
        draw_set_font_language(language_resolve_font(__font));
        
        switch (hAlign)
        {
            case "left":
                draw_set_halign(fa_left);
                break;
            
            case "center":
            case "centre":
                draw_set_halign(fa_center);
                break;
            
            case "right":
                draw_set_halign(fa_right);
                break;
            
            default:
                __uiError("Unhandled value for .hAlign \"", hAlign, "\"");
                break;
        }
        
        switch (vAlign)
        {
            case "top":
                draw_set_valign(fa_top);
                break;
            
            case "middle":
                draw_set_valign(fa_middle);
                break;
            
            case "bottom":
                draw_set_valign(fa_bottom);
                break;
            
            default:
                __uiError("Unhandled value for .vAlign \"", vAlign, "\"");
                break;
        }
        
        var _label = __label;
        
        if (__wrap && __wrapWidth > 0)
            _label = text_split(__label, __wrapWidth, true);
        
        if (dropShadow)
        {
            draw_set_color(c_black);
            draw_text_ext((0.5 * (__drawLeft + __drawRight)) + global.language_font_offset.x, (0.5 * (__drawTop + __drawBottom)) + global.language_font_offset.y + 4, _label, global.language_font_offset.linebreak_height, 999999);
            draw_set_color(_color);
        }
        else if (outlineThickness > 0)
        {
            draw_set_color(c_black);
            var _x = (0.5 * (__drawLeft + __drawRight)) + global.language_font_offset.x;
            var _y = (0.5 * (__drawTop + __drawBottom)) + global.language_font_offset.y;
            var _d = 4 * outlineThickness;
            draw_text_ext(_x - _d, _y, _label, global.language_font_offset.linebreak_height, 999999);
            draw_text_ext(_x, _y - _d, _label, global.language_font_offset.linebreak_height, 999999);
            draw_text_ext(_x + _d, _y, _label, global.language_font_offset.linebreak_height, 999999);
            draw_text_ext(_x, _y + _d, _label, global.language_font_offset.linebreak_height, 999999);
            draw_set_color(_color);
        }
        
        draw_text_ext((0.5 * (__drawLeft + __drawRight)) + global.language_font_offset.x, (0.5 * (__drawTop + __drawBottom)) + global.language_font_offset.y, _label, global.language_font_offset.linebreak_height, 999999);
        draw_set_color(_oldColor);
        draw_set_alpha(_oldAlpha);
        draw_set_font_language(_oldFont);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    });
}

enum UnknownEnum
{
    Value_12 = 12
}

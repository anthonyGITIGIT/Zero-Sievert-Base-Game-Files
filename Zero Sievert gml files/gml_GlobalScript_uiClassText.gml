uiAddBoxType("UiText", uiClassText, false);

function uiClassText() : __uiClassCommon() constructor
{
    static __UpdateSize = function()
    {
        var _oldFont = draw_get_font();
        draw_set_font_language(language_resolve_font(__font));
        
        if (__wrap && __wrapWidth > 0)
        {
            var _use_lable = text_split(__label, __wrapWidth, true);
            Set("size", [string_width_ext(_use_lable, -1, __wrapWidth) + (2 * __margin), string_height_ext(_use_lable, global.language_font_offset.linebreak_height, __wrapWidth) + (2 * __margin)]);
        }
        else
        {
            Set("size", [string_width(__label) + (2 * __margin), string_height(__label) + (2 * __margin)]);
        }
        
        draw_set_font_language(_oldFont);
    };
    
    color = 16777215;
    scale = 1;
    alpha = 1;
    hAlign = "center";
    vAlign = "middle";
    __label = "???";
    __margin = 0;
    __font = "default";
    __wrap = false;
    __wrapWidth = 999999;
    VariableBind("label", function()
    {
        return __label;
    }, function(arg0)
    {
        __label = language_get_string(arg0);
        __UpdateSize();
    });
    VariableBind("margin", function()
    {
        return __margin;
    }, function(arg0)
    {
        __margin = arg0;
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
    CallbackSetDraw(function()
    {
        uiCallInherited();
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
        
        if (__wrap && __wrapWidth > 0)
            draw_text_ext((0.5 * (__drawLeft + __drawRight)) + global.language_font_offset.x, (0.5 * (__drawTop + __drawBottom)) + global.language_font_offset.y, __label, global.language_font_offset.linebreak_height, __wrapWidth);
        else
            draw_text_ext((0.5 * (__drawLeft + __drawRight)) + global.language_font_offset.x, (0.5 * (__drawTop + __drawBottom)) + global.language_font_offset.y, __label, global.language_font_offset.linebreak_height, 9999999);
        
        draw_set_color(_oldColor);
        draw_set_alpha(_oldAlpha);
        draw_set_font_language(_oldFont);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    });
}

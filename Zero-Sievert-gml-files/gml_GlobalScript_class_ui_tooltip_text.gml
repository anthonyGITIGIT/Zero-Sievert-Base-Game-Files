uiAddBoxType("UiTooltipText", class_ui_tooltip_text);

function class_ui_tooltip_text() : __uiClassCommon() constructor
{
    static __UpdateSize = function()
    {
        if (__collapsible && (__value == undefined || __value == 0))
        {
            Set("height", 0);
        }
        else
        {
            var _oldFont = draw_get_font();
            draw_set_font_language(language_resolve_font(__font));
            Set("height", string_height("M"));
            draw_set_font_language(_oldFont);
        }
    };
    
    color = 16777215;
    alpha = 1;
    colorize = false;
    valueLabel = "???";
    inverse = false;
    addPlusSign = false;
    __label = "???";
    __font = "font_munro_32px";
    __value = 0;
    __collapsible = false;
    VariableBind("label", function()
    {
        return __label;
    }, function(arg0)
    {
        __label = language_get_string(arg0);
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
    VariableBind("value", function()
    {
        return __value;
    }, function(arg0)
    {
        __value = arg0;
        __UpdateSize();
    });
    VariableBind("collapsible", function()
    {
        return __collapsible;
    }, function(arg0)
    {
        __collapsible = arg0;
        __UpdateSize();
    });
    CallbackSetDraw(function()
    {
        if (__collapsible && (__value == undefined || __value == 0 || __value == "0"))
            exit;
        
        var _color = merge_color(c_white, animBlend, animBlendAmount);
        var _alpha = alpha * animAlpha;
        var _oldColor = draw_get_color();
        var _oldAlpha = draw_get_alpha();
        var _oldFont = draw_get_font();
        draw_set_color(_color);
        draw_set_alpha(_alpha);
        draw_set_font_language(language_resolve_font(__font));
        draw_set_halign(fa_left);
        draw_set_valign(fa_middle);
        draw_text(__drawLeft + global.language_font_offset.x, (0.5 * (__drawTop + __drawBottom)) + global.language_font_offset.y, language_get_string(__label));
        
        if (colorize)
        {
            if (inverse)
            {
                if (__value > 0)
                    _color = 5855724;
                else if (__value < 0)
                    _color = 9688723;
            }
            else if (__value < 0)
            {
                _color = 5855724;
            }
            else if (__value > 0)
            {
                _color = 9688723;
            }
        }
        else
        {
            _color = color;
        }
        
        _color = merge_color(_color, animBlend, animBlendAmount);
        draw_set_color(_color);
        var _valueLabel = language_get_string(string(valueLabel));
        
        if (addPlusSign && __value > 0)
            _valueLabel = "+" + _valueLabel;
        
        draw_text(__drawLeft + global.language_font_offset.x + uiGetData().tooltip_column_x, (0.5 * (__drawTop + __drawBottom)) + global.language_font_offset.y, _valueLabel);
        draw_set_color(_oldColor);
        draw_set_alpha(_oldAlpha);
        draw_set_font_language(_oldFont);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    });
}

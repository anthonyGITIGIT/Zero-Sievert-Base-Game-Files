uiAddBoxType("UiTooltipMeter", class_ui_tooltip_meter);

function class_ui_tooltip_meter() : __uiClassCommon() constructor
{
    static __UpdateSize = function()
    {
        var _oldFont = draw_get_font();
        draw_set_font_language(language_resolve_font(__font));
        Set("height", string_height("M"));
        draw_set_font_language(_oldFont);
    };
    
    color = 16777215;
    alpha = 1;
    value = 100;
    valueMax = 100;
    valueLabel = "";
    inverse = false;
    __label = "???";
    __font = "font_munro_32px";
    Set("width", "100%");
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
    CallbackSetDraw(function()
    {
        var _color = merge_color(color, animBlend, animBlendAmount);
        var _alpha = alpha * animAlpha;
        var _oldColor = draw_get_color();
        var _oldAlpha = draw_get_alpha();
        var _oldFont = draw_get_font();
        draw_set_color(_color);
        draw_set_alpha(_alpha);
        draw_set_font_language(language_resolve_font(__font));
        draw_set_halign(fa_left);
        draw_set_valign(fa_middle);
        draw_text(__drawLeft + global.language_font_offset.x, (0.5 * (__drawTop + __drawBottom)) + global.language_font_offset.y, __label);
        var _barLeft = floor(__drawLeft + 250);
        var _barTop = floor((0.5 * (__drawTop + __drawBottom)) - (2 * sprite_get_height(s_hud_inv_stat)));
        var _barRight = floor(_barLeft + (4 * sprite_get_width(s_hud_inv_stat)));
        var _barBottom = floor(_barTop + (4 * sprite_get_height(s_hud_inv_stat)));
        draw_sprite_ext(s_hud_inv_stat, 0, _barLeft, _barTop, 4, 4, 0, c_white, 1);
        
        if (value > 0)
        {
            var _q = clamp(inverse ? (1 - (value / valueMax)) : (value / valueMax), 0, 1);
            _q = 4 * round((_q * (_barRight - 4 - _barLeft)) / 4);
            draw_rectangle(_barLeft, _barTop, _barLeft + _q, _barBottom - 1, false);
        }
        
        draw_sprite_ext(s_hud_inv_stat, 1, _barLeft, _barTop, 4, 4, 0, c_white, 1);
        draw_text(_barRight + global.language_font_offset.x + 20, (0.5 * (__drawTop + __drawBottom)) + global.language_font_offset.y, valueLabel);
        draw_set_color(_oldColor);
        draw_set_alpha(_oldAlpha);
        draw_set_font_language(_oldFont);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    });
}

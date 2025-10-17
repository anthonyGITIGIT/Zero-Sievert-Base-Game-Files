uiAddBoxType("UiTextButton", uiClassTextButton, false);

function uiClassTextButton() : uiClassButton() constructor
{
    static __UpdateSize = function()
    {
        var _oldFont = draw_get_font();
        draw_set_font_language(language_resolve_font(__font));
        Set("size", [string_width(__label) + (2 * __margin), string_height(__label) + (2 * __margin)]);
        draw_set_font_language(_oldFont);
    };
    
    color = 16777215;
    scale = 1;
    alpha = 1;
    enabled = true;
    __label = "???";
    __margin = 0;
    __font = "default";
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
    CallbackSetDraw(function()
    {
        uiCallInherited();
        var _color = merge_color(color, animBlend, animBlendAmount);
        var _scale = scale * animScale;
        var _alpha = alpha * animAlpha;
        var _oldColor = draw_get_color();
        var _oldAlpha = draw_get_alpha();
        var _oldFont = draw_get_font();
        
        if (enabled)
            draw_set_color(_color);
        else
            draw_set_color(c_dkgray);
        
        draw_set_alpha(_alpha);
        draw_set_font_language(language_resolve_font(__font));
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(0.5 * (__drawLeft + __drawRight), 0.5 * (__drawTop + __drawBottom), __label);
        draw_set_color(_oldColor);
        draw_set_alpha(_oldAlpha);
        draw_set_font_language(_oldFont);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    });
}

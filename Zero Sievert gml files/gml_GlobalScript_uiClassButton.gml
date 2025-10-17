uiAddBoxType("UiButton", uiClassButton, false);

function uiClassButton() : __uiClassCommon() constructor
{
    color = 16777215;
    alpha = 1;
    scale = 1;
    hoverAlpha = 0.25;
    enabled = true;
    VariableBind("sprite_color", function()
    {
        return __sprite_color;
    }, function(arg0)
    {
        __sprite_color = arg0;
    });
    VariableBind("hover_invert_color", function()
    {
        return __hover_invert_color;
    }, function(arg0)
    {
        __hover_invert_color = arg0;
    });
    CallbackSetHoverStart(function()
    {
        HoverStateSet(true);
    });
    CallbackSetHoverEnd(function()
    {
        HoverStateSet(false);
    });
    CallbackSetButtonStart(function(arg0)
    {
        ButtonStateSet(arg0, true);
    });
    CallbackSetButtonEnd(function(arg0)
    {
        ButtonStateSet(arg0, false);
    });
    CallbackSetDraw(function()
    {
        var _color = merge_color(color, animBlend, animBlendAmount);
        var _alpha = alpha * animAlpha;
        var _scale = scale * animScale;
        var _oldColor = draw_get_color();
        var _oldAlpha = draw_get_alpha();
        draw_set_color(c_black);
        draw_set_alpha(_alpha);
        draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false);
        
        if (enabled)
            draw_set_color(_color);
        else
            draw_set_color(c_dkgray);
        
        if (GetButton())
        {
            draw_set_alpha(0.5 * _alpha);
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false);
        }
        else if (GetHover())
        {
            draw_set_alpha(hoverAlpha * _alpha);
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false);
        }
        
        if (_alpha > 0)
        {
            draw_set_alpha(_alpha);
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, true);
        }
        
        draw_set_color(_oldColor);
        draw_set_alpha(_oldAlpha);
    });
}

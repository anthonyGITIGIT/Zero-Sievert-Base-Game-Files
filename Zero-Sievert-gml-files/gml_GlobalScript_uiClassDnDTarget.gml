uiAddBoxType("UiDnDTarget", uiClassDnDTarget, false);

function uiClassDnDTarget() : __uiClassCommon() constructor
{
    color = 16777215;
    scale = 1;
    alpha = 1;
    CallbackSetCanHover(function()
    {
        return GetAnyDragging();
    });
    CallbackSetHoverStart(function()
    {
        HoverStateSet(true);
    });
    CallbackSetHoverEnd(function()
    {
        HoverStateSet(false);
    });
    CallbackSetDnDCanReceive(function(arg0)
    {
        return !HasChildren();
    });
    CallbackSetDnDOnReceive(function(arg0)
    {
        arg0.ParentChange(self);
        arg0.Set("x", 0.5 * (__localRight - __localLeft));
        arg0.Set("y", 0.5 * (__localBottom - __localTop));
    });
    CallbackSetDraw(function()
    {
        var _color = merge_color(color, animBlend, animBlendAmount);
        var _scale = scale * animScale;
        var _alpha = alpha * animAlpha;
        var _oldColor = draw_get_color();
        var _oldAlpha = draw_get_alpha();
        draw_set_color(c_black);
        draw_set_alpha(_alpha);
        draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false);
        draw_set_color(_color);
        
        if (GetButton())
        {
            draw_set_color(color);
            draw_set_alpha(0.5 * _alpha);
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false);
        }
        else if (GetHover())
        {
            draw_set_color(color);
            draw_set_alpha(0.25 * _alpha);
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

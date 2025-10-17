uiAddBoxType("UiRectangle", uiClassRectangle, false);

function uiClassRectangle() : __uiClassCommon() constructor
{
    borderColor = 16777215;
    borderAlpha = 1;
    fillColor = 16777215;
    fillAlpha = 0.1;
    __visible_nested_reactive = true;
    CallbackSetDraw(function()
    {
        if (!__visible)
            exit;
        
        var _oldColor = draw_get_color();
        var _oldAlpha = draw_get_alpha();
        
        if (fillAlpha > 0)
        {
            draw_set_color(merge_color(fillColor, animBlend, animBlendAmount));
            draw_set_alpha(fillAlpha * animAlpha);
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false);
        }
        
        if (borderAlpha > 0)
        {
            draw_set_color(merge_color(borderColor, animBlend, animBlendAmount));
            draw_set_alpha(borderAlpha * animAlpha);
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, true);
        }
        
        draw_set_color(_oldColor);
        draw_set_alpha(_oldAlpha);
    });
}

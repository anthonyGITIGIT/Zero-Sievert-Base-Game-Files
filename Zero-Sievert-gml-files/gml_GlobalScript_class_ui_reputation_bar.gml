uiAddBoxType("UiReputationBar", class_ui_reputation_bar);

function class_ui_reputation_bar() : __uiClassCommon() constructor
{
    scale = 1;
    alpha = 1;
    faction = undefined;
    CallbackSetDraw(function()
    {
        var _scale = scale * animScale;
        var _alpha = alpha * animAlpha;
        var _x1 = __drawLeft + 7;
        var _x2 = __drawRight - 7;
        var _x = lerp(_x1, _x2, clamp(faction_get_rep("Player", faction) / 1000, 0, 1));
        var _low_x = lerp(_x1, _x2, 0.25);
        var _mid_x = lerp(_x1, _x2, 0.6);
        var _high_x = lerp(_x1, _x2, 0.85);
        var _oldColor = draw_get_color();
        var _oldAlpha = draw_get_alpha();
        draw_set_alpha(alpha);
        
        if (_x > 0)
        {
            draw_set_color(#A8372D);
            draw_rectangle(_x1, __drawTop, min(_x, _low_x), __drawBottom, false);
        }
        
        if (_x > _low_x)
        {
            draw_set_color(#FBC85E);
            draw_rectangle(_low_x, __drawTop, min(_x, _mid_x), __drawBottom, false);
        }
        
        if (_x > _mid_x)
        {
            draw_set_color(#2C9F4C);
            draw_rectangle(_mid_x, __drawTop, min(_x, _high_x), __drawBottom, false);
        }
        
        if (_x > _high_x)
        {
            draw_set_color(#224635);
            draw_rectangle(_high_x, __drawTop, min(_x, _x2), __drawBottom, false);
        }
        
        draw_set_color(_oldColor);
        draw_set_alpha(_oldAlpha);
        draw_sprite_stretched_ext(s_hud_slider_bar_9slice_thick, 0, __drawLeft, __drawTop, __localRight - __localLeft, __localBottom - __localTop, c_white, _alpha);
    });
}

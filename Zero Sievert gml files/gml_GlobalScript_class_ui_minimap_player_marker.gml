uiAddBoxType("UiMinimapPlayerMarker", class_ui_minimap_player_marker);

function class_ui_minimap_player_marker() : uiClassButton() constructor
{
    CallbackSetDraw(function()
    {
        var _color = merge_color(color, animBlend, animBlendAmount);
        var _alpha = alpha * animAlpha;
        draw_sprite_ext(s_minimap_player, 0, 0.5 * (__drawLeft + __drawRight), 0.5 * (__drawTop + __drawBottom), 4, 4, 0, _color, _alpha);
    });
}

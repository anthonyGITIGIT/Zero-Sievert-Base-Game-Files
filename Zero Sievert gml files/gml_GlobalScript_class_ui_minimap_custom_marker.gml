uiAddBoxType("UiMinimapCustomMarker", class_ui_minimap_custom_marker);

function class_ui_minimap_custom_marker() : uiClassButton() constructor
{
    markerID = undefined;
    Set("size", [64, 64]);
    Set("captureClick", "quick move");
    CallbackSetStep(function()
    {
        if (!obj_gamepad.last_input_keyboard)
            Set("captureClick", "quick move");
        else
            Set("captureClick", "alt");
    });
    CallbackSetButtonClick(function()
    {
        if (markerID == undefined)
            exit;
        
        uiGetData().marker_id = markerID;
        __uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/context_minimap_remove_marker.ui");
    });
    CallbackSetDraw(function()
    {
        var _color = merge_color(color, animBlend, animBlendAmount);
        var _alpha = alpha * animAlpha;
        draw_sprite_ext(s_minimap_marker, 0, 0.5 * (__drawLeft + __drawRight), 0.5 * (__drawTop + __drawBottom), 4, 4, 0, _color, _alpha);
        
        if (GetHover())
            draw_sprite_ext(s_minimap_highlight, 0, 0.5 * (__drawLeft + __drawRight), 0.5 * (__drawTop + __drawBottom), 4, 4, 0, c_white, 0.7);
    });
}

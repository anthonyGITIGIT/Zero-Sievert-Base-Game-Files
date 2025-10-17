uiAddBoxType("UiMinimapInterestingMarker", class_ui_minimap_interesting_marker);

function class_ui_minimap_interesting_marker() : uiClassButton() constructor
{
    markerIndex = undefined;
    Set("size", [1, 1]);
    CallbackSetButtonStart(undefined);
    CallbackSetButtonEnd(undefined);
    CallbackSetDraw(function()
    {
        var _id = ds_list_find_value(global.list_intresting_id, markerIndex);
        var _color = merge_color(obj_controller.marker_color[_id], animBlend, animBlendAmount);
        var _alpha = alpha * animAlpha;
        draw_sprite_ext(s_marker_cerchio, obj_controller.marker_index[_id], 0.5 * (__drawLeft + __drawRight), 0.5 * (__drawTop + __drawBottom), 4, 4, 0, _color, _alpha);
        
        if (__tooltip_popup_text != "")
        {
            language_set_font(UnknownEnum.Value_3);
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            scr_draw_text_outlined(0.5 * (__drawLeft + __drawRight), 0.5 * (__drawTop + __drawBottom), language_get_string(__tooltip_popup_text), 16777215, 0, 1, 1);
        }
    });
}

enum UnknownEnum
{
    Value_3 = 3
}

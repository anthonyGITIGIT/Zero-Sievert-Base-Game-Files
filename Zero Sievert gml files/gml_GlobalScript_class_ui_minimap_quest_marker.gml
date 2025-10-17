uiAddBoxType("UiMinimapQuestMarker", class_ui_minimap_quest_marker);

function class_ui_minimap_quest_marker() : uiClassButton() constructor
{
    markerIndex = undefined;
    color = 65535;
    Set("size", [1, 1]);
    CallbackSetButtonStart(undefined);
    CallbackSetButtonEnd(undefined);
    CallbackSetDraw(function()
    {
        var _pos = ds_list_find_value(global.list_obj_marker_quest_pos, markerIndex);
        
        if (global.quest_state[_pos].state == "active")
        {
            var _color = merge_color(color, animBlend, animBlendAmount);
            var _alpha = alpha * animAlpha;
            draw_sprite_ext(s_marker_cerchio, ds_list_find_value(global.list_obj_marker_sub, markerIndex), 0.5 * (__drawLeft + __drawRight), 0.5 * (__drawTop + __drawBottom), 4, 4, 0, _color, _alpha);
            
            if (__tooltip_popup_text != "")
            {
                language_set_font(UnknownEnum.Value_3);
                draw_set_halign(fa_center);
                draw_set_valign(fa_middle);
                scr_draw_text_outlined(0.5 * (__drawLeft + __drawRight), 0.5 * (__drawTop + __drawBottom), language_get_string(__tooltip_popup_text), 16777215, 0, 1, 1);
            }
        }
    });
}

enum UnknownEnum
{
    Value_3 = 3
}

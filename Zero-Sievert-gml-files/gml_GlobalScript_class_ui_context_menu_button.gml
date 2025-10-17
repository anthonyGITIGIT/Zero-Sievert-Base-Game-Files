uiAddBoxType("UiContextMenuButton", class_ui_context_menu_button);

function class_ui_context_menu_button() : class_ui_toggle_button() constructor
{
    __sprite = s_context_menu_9slice;
    __marginH = 12;
    obj_gamepad.action[UnknownEnum.Value_40].pressed = false;
    obj_gamepad.action[UnknownEnum.Value_40].released = false;
    CallbackSet(UnknownEnum.Value_11, function()
    {
        if (obj_gamepad.action[UnknownEnum.Value_40].released)
            __CallbackGet(UnknownEnum.Value_9).__Call(self);
    });
    CallbackSet(UnknownEnum.Value_9, function()
    {
        uiOnionCurrent().LayerDelete(uiOnionCurrentLayer());
    });
    CallbackSet(UnknownEnum.Value_12, function()
    {
        var _label = language_get_string(__label);
        draw_set_font_language(language_resolve_font(__font));
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        var _text_width = string_width(_label);
        var _button_width = __drawRight - __drawLeft;
        var _point_center_x = __drawLeft + ((__drawRight - __drawLeft) * 0.5);
        __drawLeft = _point_center_x - ((_text_width * 0.5) + 16);
        __drawRight = _point_center_x + ((_text_width * 0.5) + 16);
        var _color = merge_color(color, animBlend, animBlendAmount);
        var _alpha = alpha * animAlpha;
        var _scale = scale * animScale;
        draw_sprite_stretched_ext(__sprite, 0, __drawLeft, __drawTop, __drawRight - __drawLeft, __drawBottom - __drawTop, _color, _alpha);
        var _oldColor = draw_get_color();
        var _oldAlpha = draw_get_alpha();
        var _oldFont = draw_get_font();
        
        if (GetHover())
        {
            draw_set_colour(_color);
            draw_set_alpha(_alpha);
            draw_rectangle(__drawLeft, __drawTop, __drawRight, __drawBottom, false);
            _color = 0;
        }
        
        draw_set_colour(_color);
        draw_set_alpha(_alpha);
        draw_text((0.5 * (__drawLeft + __drawRight)) + global.language_font_offset.x, (0.5 * (__drawTop + __drawBottom)) + global.language_font_offset.y, __label);
        draw_set_color(_oldColor);
        draw_set_alpha(_oldAlpha);
        draw_set_font_language(_oldFont);
        draw_set_halign(fa_left);
        draw_set_halign(fa_left);
    });
}

enum UnknownEnum
{
    Value_9 = 9,
    Value_11 = 11,
    Value_12,
    Value_40 = 40
}

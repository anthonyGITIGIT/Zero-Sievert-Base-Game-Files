function ui_draw_input_button(arg0, arg1, arg2 = UnknownEnum.Value_6, arg3 = 1)
{
    if (!obj_gamepad.last_input_keyboard)
    {
        draw_gamepad_action_button(arg2, arg0, arg1, 1, false);
    }
    else
    {
        var _text = UiActionToKeyboardString(arg2);
        draw_text_transformed(arg0 + global.language_font_offset.x, arg1 + global.language_font_offset.y, _text, arg3, arg3, 0);
    }
}

enum UnknownEnum
{
    Value_6 = 6
}

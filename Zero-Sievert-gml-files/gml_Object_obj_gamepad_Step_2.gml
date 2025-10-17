for (var j = 0; j < UnknownEnum.Value_31; j++)
{
    if (input_released[j])
        input_duration[j] = 0;
}

if (keyboard_check_pressed(vk_left))
    scr_gamepad_update_glyph_type();

scr_gamepad_rumble_stepEvent();

enum UnknownEnum
{
    Value_31 = 31
}

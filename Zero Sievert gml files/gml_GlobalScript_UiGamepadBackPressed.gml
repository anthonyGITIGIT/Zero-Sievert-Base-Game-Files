function UiGamepadBackPressed()
{
    return obj_gamepad.action[UnknownEnum.Value_40].pressed || obj_gamepad.input_pressed[UnknownEnum.Value_12];
}

enum UnknownEnum
{
    Value_12 = 12,
    Value_40 = 40
}

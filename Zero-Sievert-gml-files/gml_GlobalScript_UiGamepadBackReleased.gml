function UiGamepadBackReleased()
{
    return obj_gamepad.action[UnknownEnum.Value_40].released || obj_gamepad.input_released[UnknownEnum.Value_12] || keyboard_check_released(vk_escape);
}

enum UnknownEnum
{
    Value_12 = 12,
    Value_40 = 40
}

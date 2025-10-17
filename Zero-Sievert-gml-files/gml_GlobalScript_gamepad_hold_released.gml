function gamepad_hold_released(arg0, arg1 = obj_gamepad.hold_frames)
{
    return obj_gamepad.input_released[arg0] && obj_gamepad.input_duration[arg0] >= arg1;
}

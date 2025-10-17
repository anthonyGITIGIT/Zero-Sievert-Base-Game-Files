function gamepad_hold_released_action_lessthan(arg0, arg1 = obj_gamepad.hold_frames)
{
    return obj_gamepad.action[arg0].released && obj_gamepad.action[arg0].duration < arg1;
}

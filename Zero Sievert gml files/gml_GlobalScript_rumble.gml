function rumble(arg0 = UnknownEnum.Value_0)
{
    if (!!obj_gamepad.last_input_keyboard)
        exit;
    
    if (!settings_get("enable_gamepad_rumble"))
        exit;
    
    with (obj_gamepad)
    {
        var _this_rumble = rumble_styles[arg0];
        current_curve = arg0;
        current_frame = _this_rumble.frames;
        total_frames = current_frame;
    }
}

enum UnknownEnum
{
    Value_0
}

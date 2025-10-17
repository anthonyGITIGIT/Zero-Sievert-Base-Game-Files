function scr_gamepad_rumble_createEvent()
{
    previous_gamepad_pressed = -4;
    var _this_style = UnknownEnum.Value_0;
    rumble_styles[_this_style] = 
    {
        curve: "hurt",
        frames: 20
    };
    _this_style = UnknownEnum.Value_1;
    rumble_styles[_this_style] = 
    {
        curve: "shoot",
        frames: 5
    };
    _this_style = UnknownEnum.Value_2;
    rumble_styles[_this_style] = 
    {
        curve: "connected",
        frames: 120
    };
    current_curve = -4;
    current_frame = 0;
    total_frames = 0;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2
}

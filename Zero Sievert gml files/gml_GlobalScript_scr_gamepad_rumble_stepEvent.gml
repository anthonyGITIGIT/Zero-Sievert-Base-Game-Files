function scr_gamepad_rumble_stepEvent()
{
    if (last_gamepad_pressed != -4 && !!obj_gamepad.last_input_keyboard)
    {
        var _count_connected = array_length(connected_devices);
        
        for (var i = 0; i < _count_connected; i++)
        {
            var _gamepad_id = connected_devices[i];
            gamepad_set_vibration(_gamepad_id, 0, 0);
        }
    }
    
    if (last_gamepad_pressed != previous_gamepad_pressed)
        gamepad_set_vibration(previous_gamepad_pressed, 0, 0);
    
    previous_gamepad_pressed = last_gamepad_pressed;
    
    if (current_curve != -4)
    {
        var _this_rumble = rumble_styles[current_curve];
        var _curve = animcurve_get_channel(curve_rumble, _this_rumble.curve);
        var _value = animcurve_channel_evaluate(_curve, current_frame / total_frames);
        gamepad_set_vibration(last_gamepad_pressed, _value, _value);
        current_frame--;
        
        if (current_frame < 0)
        {
            current_curve = -4;
            current_frame = 0;
            total_frames = 0;
            gamepad_set_vibration(last_gamepad_pressed, 0, 0);
        }
    }
}

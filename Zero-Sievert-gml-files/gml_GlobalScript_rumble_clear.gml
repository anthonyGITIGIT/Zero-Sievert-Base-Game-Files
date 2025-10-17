function rumble_clear()
{
    if (!!obj_gamepad.last_input_keyboard)
        exit;
    
    with (obj_gamepad)
    {
        current_curve = -4;
        current_frame = 0;
        total_frames = 0;
        gamepad_set_vibration(last_gamepad_pressed, 0, 0);
    }
}

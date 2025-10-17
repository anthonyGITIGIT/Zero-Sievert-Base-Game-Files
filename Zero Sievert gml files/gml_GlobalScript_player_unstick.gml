function player_unstick()
{
    if (place_meeting(x, y, obj_solid))
    {
        var _amount = 5;
        
        if (keyboard_check(vk_control) && keyboard_check_pressed(ord("W")))
            y -= _amount;
        
        if (keyboard_check(vk_control) && keyboard_check_pressed(ord("S")))
            y += _amount;
        
        if (keyboard_check(vk_control) && keyboard_check_pressed(ord("D")))
            x += _amount;
        
        if (keyboard_check(vk_control) && keyboard_check_pressed(ord("A")))
            x -= _amount;
        
        if (!obj_gamepad.last_input_keyboard)
        {
            if (obj_gamepad.input_pressed[UnknownEnum.Value_19])
            {
                x += (obj_gamepad.input_value[UnknownEnum.Value_17] * _amount);
                x -= (obj_gamepad.input_value[UnknownEnum.Value_16] * _amount);
                y += (obj_gamepad.input_value[UnknownEnum.Value_15] * _amount);
                y -= (obj_gamepad.input_value[UnknownEnum.Value_14] * _amount);
            }
        }
    }
    
    return true;
}

enum UnknownEnum
{
    Value_14 = 14,
    Value_15,
    Value_16,
    Value_17,
    Value_19 = 19
}

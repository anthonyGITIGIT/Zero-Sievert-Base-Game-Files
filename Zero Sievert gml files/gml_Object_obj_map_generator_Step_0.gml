player_follow_local();
depth = 300;

switch (state)
{
    case UnknownEnum.Value_20:
        if (keyboard_check_released(vk_anykey) || mouse_check_button_released(mb_any) || obj_gamepad.input_released[UnknownEnum.Value_29] || area == UnknownEnum.Value_10)
        {
            state = UnknownEnum.Value_21;
            settings_apply("master volume");
            obj_meteo_controller.alarm[2] = global.emission_min_timer;
        }
        
        break;
    
    case UnknownEnum.Value_21:
        break;
}

if (global.general_debug)
{
    if (debug == true)
    {
        if (keyboard_check_pressed(vk_up))
            alarm[2] = 1;
    }
    
    if (keyboard_check_pressed(vk_f6) && keyboard_check(vk_f5))
    {
        if (!instance_exists(obj_camera_test))
        {
            instance_create_depth(x, y, -y, obj_camera_test);
        }
        else
        {
            with (obj_camera_test)
                instance_destroy();
        }
    }
}

enum UnknownEnum
{
    Value_10 = 10,
    Value_20 = 20,
    Value_21,
    Value_29 = 29
}

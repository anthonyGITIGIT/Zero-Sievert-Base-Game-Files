options_data = [];
current_selected = -1;
number_of_options = 8;

close_function = function()
{
    return keyboard_check_pressed(vk_escape) || mouse_check_button_pressed(mb_right) || obj_gamepad.input_released[UnknownEnum.Value_13] || obj_gamepad.input_released[UnknownEnum.Value_12] || obj_gamepad.input_released[UnknownEnum.Value_1] || player_all_dead() || (instance_exists(obj_train) && obj_train.state != UnknownEnum.Value_6);
};

select_function = function()
{
    return keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left) || obj_gamepad.input_pressed[UnknownEnum.Value_18] || obj_gamepad.input_pressed[UnknownEnum.Value_25] || obj_gamepad.input_pressed[UnknownEnum.Value_0] || obj_gamepad.action[UnknownEnum.Value_34].released || obj_gamepad.action[UnknownEnum.Value_33].released;
};

angle_of_option = 360 / number_of_options;
shader_gray_uniform = shader_get_uniform(shd_gray, "gray_amount");

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_6 = 6,
    Value_12 = 12,
    Value_13,
    Value_18 = 18,
    Value_25 = 25,
    Value_33 = 33,
    Value_34
}

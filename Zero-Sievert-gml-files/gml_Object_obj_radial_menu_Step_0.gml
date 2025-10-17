if (obj_gamepad.input_value[UnknownEnum.Value_26])
{
    current_selected = floor((obj_gamepad.input_decimal[UnknownEnum.Value_27] + (angle_of_option / 2)) / angle_of_option);
    current_selected %= number_of_options;
}
else if (obj_gamepad.action[UnknownEnum.Value_35].value || obj_gamepad.action[UnknownEnum.Value_36].value || obj_gamepad.action[UnknownEnum.Value_37].value || obj_gamepad.action[UnknownEnum.Value_38].value)
{
    if (obj_gamepad.action[UnknownEnum.Value_35].value)
    {
        if (obj_gamepad.action[UnknownEnum.Value_37].value)
            current_selected = 3;
        else if (obj_gamepad.action[UnknownEnum.Value_38].value)
            current_selected = 1;
        else
            current_selected = 2;
    }
    else if (obj_gamepad.action[UnknownEnum.Value_36].value)
    {
        if (obj_gamepad.action[UnknownEnum.Value_37].value)
            current_selected = 5;
        else if (obj_gamepad.action[UnknownEnum.Value_38].value)
            current_selected = 7;
        else
            current_selected = 6;
    }
    else if (obj_gamepad.action[UnknownEnum.Value_37].value)
    {
        current_selected = 4;
    }
    else
    {
        current_selected = 0;
    }
}
else
{
    current_selected = -1;
}

if (select_function())
{
    if (current_selected > -1 && current_selected < array_length(options_data) && !is_undefined(options_data[current_selected]))
    {
        var _this_option = options_data[current_selected];
        _this_option.script_to_run(_this_option.arg_in);
    }
    
    instance_destroy();
}

if (close_function())
    instance_destroy();

var _player = player_get_local();

if (instance_exists(_player))
{
    x = _player.x;
    y = _player.y;
}

enum UnknownEnum
{
    Value_26 = 26,
    Value_27,
    Value_35 = 35,
    Value_36,
    Value_37,
    Value_38
}

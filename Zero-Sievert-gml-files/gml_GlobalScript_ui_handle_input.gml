function ui_handle_input(arg0)
{
    with (__uiGlobal().__defaultOnion)
    {
        var _oldMode = InputGetMode();
        
        if (!!obj_gamepad.last_input_keyboard)
            InputSetMode("pointer");
        else
            InputSetMode("directional");
        
        if (_oldMode == InputGetMode() || global.is_steamdeck)
        {
            if (InputGetMode() == "pointer" || keyboard_check_pressed(vk_anykey))
            {
                InputPointer(arg0 * device_mouse_x_to_gui(0), arg0 * device_mouse_y_to_gui(0));
                InputButtonTarget("action", mouse_check_button(mb_left));
                InputButtonTarget("alt", mouse_check_button(mb_right));
                InputButtonCast("pause", keyboard_check(vk_escape));
                InputButtonCast("back", global.kb_pressed[UnknownEnum.Value_40]);
                InputButtonCast("use device", global.kb_pressed[UnknownEnum.Value_10]);
                InputButtonCast("inventory", global.kb_pressed[UnknownEnum.Value_5]);
                InputButtonCast("map shortcut", global.kb_pressed[UnknownEnum.Value_11]);
                InputButtonCast("credits scroll up", mouse_wheel_up() || keyboard_check(vk_up));
                InputButtonCast("credits scroll down", mouse_wheel_down() || keyboard_check(vk_down));
                InputButtonCast("teleport hotkey 1", keyboard_check(ord("1")));
                InputButtonCast("teleport hotkey 2", keyboard_check(ord("2")));
                InputButtonCast("teleport hotkey 3", keyboard_check(ord("3")));
                InputButtonCast("teleport hotkey 4", keyboard_check(ord("4")));
                InputButtonCast("teleport hotkey 5", keyboard_check(ord("5")));
                InputButtonCast("teleport hotkey 6", keyboard_check(ord("6")));
                InputButtonCast("teleport hotkey 7", keyboard_check(ord("7")));
                InputButtonCast("teleport hotkey 8", keyboard_check(ord("8")));
                InputButtonCast("teleport hotkey 9", keyboard_check(ord("9")));
                InputButtonCast("teleport hotkey 0", keyboard_check(ord("0")));
            }
            else
            {
                var _dX = 0;
                var _dY = 0;
                var _skipGroup = false;
                
                if (obj_gamepad.input_value[UnknownEnum.Value_8] || obj_gamepad.input_value[UnknownEnum.Value_9] || obj_gamepad.input_value[UnknownEnum.Value_10] || obj_gamepad.input_value[UnknownEnum.Value_11])
                {
                    _dX = obj_gamepad.input_value[UnknownEnum.Value_11] - obj_gamepad.input_value[UnknownEnum.Value_10];
                    _dY = obj_gamepad.input_value[UnknownEnum.Value_9] - obj_gamepad.input_value[UnknownEnum.Value_8];
                }
                else
                {
                    var _leftX = obj_gamepad.input_decimal[UnknownEnum.Value_17] - obj_gamepad.input_decimal[UnknownEnum.Value_16];
                    var _leftY = obj_gamepad.input_decimal[UnknownEnum.Value_15] - obj_gamepad.input_decimal[UnknownEnum.Value_14];
                    var _rightX = obj_gamepad.input_decimal[UnknownEnum.Value_24] - obj_gamepad.input_decimal[UnknownEnum.Value_23];
                    var _rightY = obj_gamepad.input_decimal[UnknownEnum.Value_22] - obj_gamepad.input_decimal[UnknownEnum.Value_21];
                    
                    if (point_distance(0, 0, _leftX, _leftY) >= point_distance(0, 0, _rightX, _rightY))
                    {
                        _dX = _leftX;
                        _dY = _leftY;
                    }
                    else
                    {
                        _dX = _rightX;
                        _dY = _rightY;
                        _skipGroup = true;
                    }
                }
                
                var _retrigger = (obj_gamepad.input_duration[UnknownEnum.Value_17] > 15 && (obj_gamepad.input_duration[UnknownEnum.Value_17] % 5) == 0) || (obj_gamepad.input_duration[UnknownEnum.Value_16] > 15 && (obj_gamepad.input_duration[UnknownEnum.Value_16] % 5) == 0) || (obj_gamepad.input_duration[UnknownEnum.Value_14] > 15 && (obj_gamepad.input_duration[UnknownEnum.Value_14] % 5) == 0) || (obj_gamepad.input_duration[UnknownEnum.Value_15] > 15 && (obj_gamepad.input_duration[UnknownEnum.Value_15] % 5) == 0);
                var _additional_place_button = false;
                
                if (player_local_state_is(scr_player_state_inventory) && global.Dragging_Loot_Struct != undefined && global.Dragging_Loot_Struct.__stateDragging == true)
                {
                    if (obj_gamepad.action[UnknownEnum.Value_31].pressed)
                    {
                        if (global.Dragging_Loot_Struct.__lootStruct.quantity > 1)
                            _additional_place_button = true;
                    }
                }
                
                InputDirection(_dX, _dY, _retrigger, obj_gamepad.deadzone_inner, _skipGroup);
                InputButtonTarget("action", obj_gamepad.input_value[UnknownEnum.Value_0] || _additional_place_button);
                InputButtonTarget("alt", obj_gamepad.input_value[UnknownEnum.Value_1]);
                InputButtonTarget("gamepad tooltip", obj_gamepad.input_value[UnknownEnum.Value_3]);
                InputButtonTarget("quick move", obj_gamepad.input_value[UnknownEnum.Value_2]);
                InputButtonCast("credits scroll up", obj_gamepad.input_value[UnknownEnum.Value_8] || obj_gamepad.input_value[UnknownEnum.Value_14]);
                InputButtonCast("credits scroll down", obj_gamepad.input_value[UnknownEnum.Value_9] || obj_gamepad.input_value[UnknownEnum.Value_15]);
                InputButtonCast("pause", obj_gamepad.input_value[UnknownEnum.Value_13]);
                InputButtonCast("inventory", obj_gamepad.input_value[UnknownEnum.Value_12]);
                
                if (player_local_state_is(scr_player_state_inventory))
                    InputButtonCast("back", obj_gamepad.action[UnknownEnum.Value_40].released || keyboard_check_pressed(global.kb_now[UnknownEnum.Value_40]));
                else
                    InputButtonCast("back", obj_gamepad.action[UnknownEnum.Value_40].pressed || keyboard_check_pressed(global.kb_now[UnknownEnum.Value_40]));
            }
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_5 = 5,
    Value_8 = 8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_21 = 21,
    Value_22,
    Value_23,
    Value_24,
    Value_31 = 31,
    Value_40 = 40
}

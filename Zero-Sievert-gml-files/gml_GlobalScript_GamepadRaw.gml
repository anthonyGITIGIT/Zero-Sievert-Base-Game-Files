function GamepadRaw() : Gamepad() constructor
{
    static update = function()
    {
        obj_gamepad.number_of_gamepads_connected = 0;
        value = array_create(UnknownEnum.Value_31, 0);
        var _count_connected = array_length(obj_gamepad.connected_devices);
        
        for (var i = 0; i < _count_connected; i++)
        {
            var _gamepad_id = obj_gamepad.connected_devices[i];
            
            if (!settings_get("enable_dinput_devices") && _gamepad_id >= 4)
                continue;
            
            if (gamepad_is_connected(_gamepad_id))
            {
                obj_gamepad.number_of_gamepads_connected++;
                
                if (!settings_get("enable_gamepad_devices"))
                {
                }
                else
                {
                    for (var j = 0; j < lookup_count; j++)
                    {
                        var _this_lookup = lookup[j];
                        var _pressed = gamepad_button_check(_gamepad_id, _this_lookup.in);
                        value[_this_lookup.out] = max(value[_this_lookup.out], _pressed);
                        
                        if (_pressed)
                            obj_gamepad.last_gamepad_pressed = _gamepad_id;
                    }
                    
                    value[UnknownEnum.Value_14] = max(value[UnknownEnum.Value_14], axis_normalise(gamepad_axis_value(_gamepad_id, gp_axislv)));
                    value[UnknownEnum.Value_16] = max(value[UnknownEnum.Value_16], axis_normalise(gamepad_axis_value(_gamepad_id, gp_axislh)));
                    value[UnknownEnum.Value_15] = max(value[UnknownEnum.Value_15], axis_normalise(gamepad_axis_value(_gamepad_id, gp_axislv), true));
                    value[UnknownEnum.Value_17] = max(value[UnknownEnum.Value_17], axis_normalise(gamepad_axis_value(_gamepad_id, gp_axislh), true));
                    value[UnknownEnum.Value_21] = max(value[UnknownEnum.Value_21], axis_normalise(gamepad_axis_value(_gamepad_id, gp_axisrv)));
                    value[UnknownEnum.Value_23] = max(value[UnknownEnum.Value_23], axis_normalise(gamepad_axis_value(_gamepad_id, gp_axisrh)));
                    value[UnknownEnum.Value_22] = max(value[UnknownEnum.Value_22], axis_normalise(gamepad_axis_value(_gamepad_id, gp_axisrv), true));
                    value[UnknownEnum.Value_24] = max(value[UnknownEnum.Value_24], axis_normalise(gamepad_axis_value(_gamepad_id, gp_axisrh), true));
                }
            }
        }
    };
    
    static axis_normalise = function(arg0, arg1 = -1)
    {
        return clamp(arg1 * arg0, 0, 1);
    };
    
    var _i = 0;
    lookup[_i++] = 
    {
        in: 32769,
        out: UnknownEnum.Value_0
    };
    lookup[_i++] = 
    {
        in: 32770,
        out: UnknownEnum.Value_1
    };
    lookup[_i++] = 
    {
        in: 32771,
        out: UnknownEnum.Value_2
    };
    lookup[_i++] = 
    {
        in: 32772,
        out: UnknownEnum.Value_3
    };
    lookup[_i++] = 
    {
        in: 32773,
        out: UnknownEnum.Value_4
    };
    lookup[_i++] = 
    {
        in: 32775,
        out: UnknownEnum.Value_5
    };
    lookup[_i++] = 
    {
        in: 32774,
        out: UnknownEnum.Value_6
    };
    lookup[_i++] = 
    {
        in: 32776,
        out: UnknownEnum.Value_7
    };
    lookup[_i++] = 
    {
        in: 32781,
        out: UnknownEnum.Value_8
    };
    lookup[_i++] = 
    {
        in: 32782,
        out: UnknownEnum.Value_9
    };
    lookup[_i++] = 
    {
        in: 32783,
        out: UnknownEnum.Value_10
    };
    lookup[_i++] = 
    {
        in: 32784,
        out: UnknownEnum.Value_11
    };
    lookup[_i++] = 
    {
        in: 32777,
        out: UnknownEnum.Value_12
    };
    lookup[_i++] = 
    {
        in: 32778,
        out: UnknownEnum.Value_13
    };
    lookup[_i++] = 
    {
        in: 32779,
        out: UnknownEnum.Value_18
    };
    lookup[_i++] = 
    {
        in: 32780,
        out: UnknownEnum.Value_25
    };
    lookup_count = array_length(lookup);
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_21 = 21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_31 = 31
}

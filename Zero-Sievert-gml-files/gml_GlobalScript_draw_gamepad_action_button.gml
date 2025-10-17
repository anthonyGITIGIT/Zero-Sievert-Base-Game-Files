function draw_gamepad_action_button(arg0, arg1, arg2, arg3, arg4)
{
    var _lookup_index = obj_gamepad.lookup_action_to_input[arg0];
    var _use_sprite;
    
    if (arg4 <= 0)
        _use_sprite = obj_gamepad.gamepad_glyphs[_lookup_index].standard;
    else if (((current_time / 1000) * arg4) % 1)
        _use_sprite = obj_gamepad.gamepad_glyphs[_lookup_index].standard;
    else
        _use_sprite = obj_gamepad.gamepad_glyphs[_lookup_index].pressed;
    
    switch (arg0)
    {
        case UnknownEnum.Value_17:
            _use_sprite = s_gamepad_radial_1;
            break;
        
        case UnknownEnum.Value_18:
            _use_sprite = s_gamepad_radial_2;
            break;
        
        case UnknownEnum.Value_19:
            _use_sprite = s_gamepad_radial_3;
            break;
        
        case UnknownEnum.Value_20:
            _use_sprite = s_gamepad_radial_4;
            break;
        
        case UnknownEnum.Value_21:
            _use_sprite = s_gamepad_radial_5;
            break;
        
        case UnknownEnum.Value_22:
            _use_sprite = s_gamepad_radial_6;
            break;
        
        case UnknownEnum.Value_15:
            _use_sprite = s_gamepad_button_face_north_standard;
            break;
        
        case UnknownEnum.Value_16:
            _use_sprite = s_gamepad_button_face_north_standard;
            break;
        
        case UnknownEnum.Value_8:
            _use_sprite = s_gamepad_button_face_east_standard;
            break;
    }
    
    var _sprite_width = 15;
    var _sprite_width_half = _sprite_width / 2;
    draw_sprite_ext(_use_sprite, obj_gamepad.gamepad_manufacturer, arg1, arg2, arg3, arg3, 0, c_white, draw_get_alpha());
}

enum UnknownEnum
{
    Value_8 = 8,
    Value_15 = 15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22
}

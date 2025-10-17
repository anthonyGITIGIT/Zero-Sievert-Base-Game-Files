function draw_text_outlined_with_control(arg0, arg1, arg2, arg3, arg4 = 16777215, arg5 = 1)
{
    var _use_x = arg0;
    var _use_y = arg1;
    arg2 = string(arg2);
    var _width_total, _height_total;
    
    if (!obj_gamepad.last_input_keyboard)
    {
        var _lookup_index = obj_gamepad.lookup_action_to_input[arg3];
        var _use_sprite;
        
        if (arg5 <= 0)
            _use_sprite = obj_gamepad.gamepad_glyphs[_lookup_index].standard;
        else if (((current_time / 1000) * arg5) % 1)
            _use_sprite = obj_gamepad.gamepad_glyphs[_lookup_index].standard;
        else
            _use_sprite = obj_gamepad.gamepad_glyphs[_lookup_index].pressed;
        
        var _sprite_width = 15;
        var _sprite_width_half = _sprite_width / 2;
        _use_x += (_sprite_width_half - 2);
        var _string_area = text_find_draw_area(_use_x, _use_y, arg2);
        draw_sprite(_use_sprite, obj_gamepad.gamepad_manufacturer, _string_area[0] - _sprite_width_half, (((_string_area[3] - _string_area[1]) / 2) + _string_area[1]) - 1);
        _width_total = (_string_area[2] - _string_area[0]) + sprite_get_width(_use_sprite) + 6;
        _height_total = _string_area[3] - _string_area[1];
    }
    else
    {
        arg3 = string(arg3);
        arg2 = "[" + scr_key_map(global.kb_now[arg3]) + "] " + arg2;
        _width_total = string_width(arg2);
        _height_total = string_height(arg2);
    }
    
    scr_draw_text_outlined(_use_x, _use_y, arg2, arg4, 0, 1, 1);
    return [_use_x, _use_y, _width_total, _height_total];
}

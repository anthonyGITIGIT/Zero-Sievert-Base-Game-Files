function string_clip(arg0, arg1, arg2, arg3, arg4 = global.language_font_offset.linebreak_height)
{
    if (is_string(arg3))
        arg3 = asset_get_index(arg3);
    
    var _ellipsis = "...";
    var _new_string = arg2;
    draw_set_font(arg3);
    
    if (string_width_ext(arg2, arg4, arg0) <= arg0 && string_height_ext(arg2, arg4, arg0) <= arg1)
        return arg2;
    
    for (var _i = 1; _i <= string_length(arg2); _i++)
    {
        var _test_string = string_copy(arg2, 1, _i) + _ellipsis;
        var _lines = string_width_ext(_test_string, arg4, arg0) <= arg0;
        var _current_height = string_height_ext(_test_string, arg4, arg0);
        
        if (!_lines || _current_height > arg1)
        {
            _new_string = string_copy(arg2, 1, _i - 1) + _ellipsis;
            break;
        }
    }
    
    return _new_string;
}

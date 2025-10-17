function text_find_draw_area_ext(arg0, arg1, arg2, arg3, arg4)
{
    var _text_width = string_width_ext(arg2, arg3, arg4);
    var _text_height = string_height_ext(arg2, arg3, arg4);
    var _return_left, _return_right;
    
    switch (draw_get_halign())
    {
        case 0:
            _return_left = 0;
            _return_right = _text_width;
            break;
        
        case 1:
            _return_left = -(_text_width / 2);
            _return_right = _text_width / 2;
            break;
        
        case 2:
            _return_left = -_text_width;
            _return_right = 0;
            break;
        
        default:
            show_error("ERROR: text_find_draw_area() didnt know the text alignment. halign.", true);
            break;
    }
    
    var _return_top, _return_bottom;
    
    switch (draw_get_valign())
    {
        case 0:
            _return_top = 0;
            _return_bottom = _text_height;
            break;
        
        case 1:
            _return_top = -(_text_height / 2);
            _return_bottom = _text_height / 2;
            break;
        
        case 2:
            _return_top = -_text_height;
            _return_bottom = 0;
            break;
        
        default:
            show_error("ERROR: text_find_draw_area() didnt know the text alignment. valign.", true);
            break;
    }
    
    return [arg0 + _return_left, arg1 + _return_top, arg0 + _return_right, arg1 + _return_bottom];
}

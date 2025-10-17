function draw_sprite_repeat(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)
{
    var _width = arg6 * sprite_get_width(arg0);
    var _height = arg6 * sprite_get_height(arg0);
    var _y = arg3;
    
    repeat (ceil((arg5 - arg3) / _height))
    {
        var _x = arg2;
        
        repeat (ceil((arg4 - arg2) / _width))
        {
            draw_sprite_ext(arg0, arg1, _x, _y, arg6, arg7, 0, arg8, arg9);
            _x += _width;
        }
        
        _y += _height;
    }
}

function SnapBufferWriteNSV(arg0, arg1, arg2 = undefined, arg3 = false)
{
    var _height = array_length(arg1);
    
    if (arg2 == undefined)
    {
        arg2 = 0;
        _y = 0;
        
        repeat (_height)
        {
            arg2 = max(arg2, array_length(arg1[_y]));
            _y++;
        }
    }
    
    buffer_write(arg0, buffer_u64, arg2);
    buffer_write(arg0, buffer_u64, _height);
    var _y = 0;
    
    repeat (_height)
    {
        var _row_array = arg1[_y];
        var _x = 0;
        
        repeat (array_length(_row_array))
        {
            var _value = _row_array[_x];
            
            if (is_real(_value))
                buffer_write(arg0, buffer_string, SnapNumberToString(_value, arg3));
            else if (is_string(_value))
                buffer_write(arg0, buffer_string, _value);
            else if (is_method(_value))
                buffer_write(arg0, buffer_string, string(_value));
            else if (is_struct(_value) || is_array(_value))
                show_error("SNAP:\nArray contains a nested struct or array. This is incompatible with NSV\n ", true);
            else if (is_numeric(_value) && typeof(_value) == "ref")
                buffer_write(arg0, buffer_string, string(real(_value)));
            else
                buffer_write(arg0, buffer_string, string(_value));
            
            _x++;
        }
        
        repeat (arg2 - _x)
            buffer_write(arg0, buffer_u8, 0);
        
        _y++;
    }
    
    return arg0;
}

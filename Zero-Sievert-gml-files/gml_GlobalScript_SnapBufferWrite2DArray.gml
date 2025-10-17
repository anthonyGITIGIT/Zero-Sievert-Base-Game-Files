function SnapBufferWrite2DArray(arg0, arg1, arg2)
{
    if (arg2 == 13)
        show_error("SNAP:\nCannot use buffer_text for the datatype\n ", true);
    
    var _width = array_length(arg1);
    var _height = array_length(arg1[0]);
    buffer_write(arg0, buffer_u8, arg2);
    buffer_write(arg0, buffer_u32, _width);
    buffer_write(arg0, buffer_u32, _height);
    var _x = 0;
    
    repeat (_width)
    {
        var _sub_array = arg1[_x];
        var _y = 0;
        
        repeat (_height)
        {
            buffer_write(arg0, arg2, _sub_array[_y]);
            _y++;
        }
        
        _x++;
    }
}

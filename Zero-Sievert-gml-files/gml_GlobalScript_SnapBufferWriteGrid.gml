function SnapBufferWriteGrid(arg0, arg1, arg2)
{
    if (arg2 == 13)
        show_error("SNAP:\nCannot use buffer_text for the datatype\n ", true);
    
    var _width = ds_grid_width(arg1);
    var _height = ds_grid_height(arg1);
    buffer_write(arg0, buffer_u8, arg2);
    buffer_write(arg0, buffer_u32, _width);
    buffer_write(arg0, buffer_u32, _height);
    var _x = 0;
    
    repeat (_width)
    {
        var _y = 0;
        
        repeat (_height)
        {
            buffer_write(arg0, arg2, ds_grid_get(arg1, _x, _y));
            _y++;
        }
        
        _x++;
    }
}

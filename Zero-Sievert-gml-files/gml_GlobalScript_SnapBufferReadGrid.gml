function SnapBufferReadGrid(arg0, arg1)
{
    var _oldOffset;
    
    if (arg1 != undefined)
    {
        _oldOffset = buffer_tell(arg0);
        buffer_seek(arg0, buffer_seek_start, arg1);
    }
    
    var _datatype = buffer_read(arg0, buffer_u8);
    var _width = buffer_read(arg0, buffer_u32);
    var _height = buffer_read(arg0, buffer_u32);
    var _grid = ds_grid_create(_width, _height);
    var _x = 0;
    
    repeat (_width)
    {
        var _y = 0;
        
        repeat (_height)
        {
            ds_grid_set(_grid, _x, _y, buffer_read(arg0, _datatype));
            _y++;
        }
        
        _x++;
    }
    
    if (arg1 != undefined)
        buffer_seek(arg0, buffer_seek_start, _oldOffset);
    
    return _grid;
}

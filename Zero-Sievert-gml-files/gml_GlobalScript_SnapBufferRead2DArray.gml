function SnapBufferRead2DArray(arg0, arg1)
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
    var _array = array_create(_width);
    var _x = 0;
    
    repeat (_width)
    {
        var _sub_array = array_create(_height);
        _array[_x] = _sub_array;
        var _y = 0;
        
        repeat (_height)
        {
            _sub_array[_y] = buffer_read(arg0, _datatype);
            _y++;
        }
        
        _x++;
    }
    
    if (arg1 != undefined)
        buffer_seek(arg0, buffer_seek_start, _oldOffset);
    
    return _array;
}

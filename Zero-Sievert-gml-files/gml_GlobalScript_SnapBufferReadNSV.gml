function SnapBufferReadNSV(arg0, arg1)
{
    var _oldTell = buffer_tell(arg0);
    buffer_seek(arg0, buffer_seek_start, arg1);
    var _width = buffer_read(arg0, buffer_u64);
    var _height = buffer_read(arg0, buffer_u64);
    var _rootArray = array_create(_height);
    var _y = 0;
    
    repeat (_height)
    {
        var _rowArray = array_create(_width);
        _rootArray[_y] = _rowArray;
        var _x = 0;
        
        repeat (_width)
        {
            _rowArray[_x] = buffer_read(arg0, buffer_string);
            _x++;
        }
        
        _y++;
    }
    
    buffer_seek(arg0, buffer_seek_start, _oldTell);
    return _rootArray;
}

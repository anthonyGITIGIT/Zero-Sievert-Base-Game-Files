function SnapBufferReadTilemapOverwrite(arg0, arg1, arg2, arg3 = false)
{
    var _oldOffset;
    
    if (arg1 != undefined)
    {
        _oldOffset = buffer_tell(arg0);
        buffer_seek(arg0, buffer_seek_start, arg1);
    }
    
    var _x = buffer_read(arg0, buffer_f64);
    var _y = buffer_read(arg0, buffer_f64);
    var _width = buffer_read(arg0, buffer_u32);
    var _height = buffer_read(arg0, buffer_u32);
    var _tilesetName = buffer_read(arg0, buffer_string);
    
    if (tilemap_get_width(arg2) != _width || tilemap_get_height(arg2) != _height)
        trace("SNAP: Warning! Tilemap size mismatch (read as " + string(_width) + " x " + string(_height) + ", currently " + string(tilemap_get_width(arg2)) + " x " + string(tilemap_get_height(arg2)) + ")");
    
    if (tilemap_get_width(arg2) > _width || tilemap_get_height(arg2) > _height)
        tilemap_clear(arg2, 0);
    
    if (arg3)
    {
        tilemap_x(arg2, _x);
        tilemap_y(arg2, _y);
    }
    
    _x = 0;
    
    repeat (_width)
    {
        _y = 0;
        
        repeat (_height)
        {
            tilemap_set(arg2, buffer_read(arg0, buffer_u32), _x, _y);
            _y++;
        }
        
        _x++;
    }
    
    if (arg1 != undefined)
        buffer_seek(arg0, buffer_seek_start, _oldOffset);
}

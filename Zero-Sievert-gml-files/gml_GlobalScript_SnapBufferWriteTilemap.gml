function SnapBufferWriteTilemap(arg0, arg1)
{
    var _width = tilemap_get_width(arg1);
    var _height = tilemap_get_height(arg1);
    buffer_write(arg0, buffer_f64, tilemap_get_x(arg1));
    buffer_write(arg0, buffer_f64, tilemap_get_y(arg1));
    buffer_write(arg0, buffer_u32, _width);
    buffer_write(arg0, buffer_u32, _height);
    buffer_write(arg0, buffer_string, tileset_get_name(tilemap_get_tileset(arg1)));
    var _x = 0;
    
    repeat (_width)
    {
        var _y = 0;
        
        repeat (_height)
        {
            buffer_write(arg0, buffer_u32, tilemap_get(arg1, _x, _y));
            _y++;
        }
        
        _x++;
    }
}

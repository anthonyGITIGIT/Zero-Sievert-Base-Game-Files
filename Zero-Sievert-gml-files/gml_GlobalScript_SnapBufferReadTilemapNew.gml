function SnapBufferReadTilemapNew(arg0, arg1, arg2)
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
    var _assetType = asset_get_type(_tilesetName);
    var _tileset = asset_get_index(_tilesetName);
    
    if (_tileset < 0)
        show_error("SNAP:\nTileset \"" + string(_tilesetName) + "\" not found\n ", true);
    
    if (_assetType != 13)
        show_error("SNAP:\nAsset \"" + string(_tilesetName) + "\" is not a tileset\n ", true);
    
    var _tilemap = layer_tilemap_create(arg2, _x, _y, _tileset, _width, _height);
    _x = 0;
    
    repeat (_width)
    {
        _y = 0;
        
        repeat (_height)
        {
            tilemap_set(_tilemap, buffer_read(arg0, buffer_u32), _x, _y);
            _y++;
        }
        
        _x++;
    }
    
    if (arg1 != undefined)
        buffer_seek(arg0, buffer_seek_start, _oldOffset);
}

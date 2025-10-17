__SplatInitialize();

function __SplatInitialize()
{
    static _initialized = false;
    
    if (_initialized)
        exit;
    
    _initialized = true;
    __SplatTrace("Welcome to Splat by @jujuadams! This is version 1.0.0, 2023-06-04");
    var _global = __SplatGlobal();
    vertex_format_begin();
    vertex_format_add_position_3d();
    vertex_format_add_colour();
    vertex_format_add_texcoord();
    _global.__vertexFormat = vertex_format_end();
    var _textureIndex = undefined;
    var _firstSprite = undefined;
    var _imageDataMap = _global.__imageDataMap;
    
    for (var _sprite = 0; sprite_exists(_sprite); _sprite++)
    {
        var _tags = asset_get_tags(_sprite, 1);
        var _i = 0;
        
        repeat (array_length(_tags))
        {
            if (string_lower(_tags[_i]) == "splat")
            {
                var _number = sprite_get_number(_sprite);
                
                if (_number > 1024)
                    __SplatError("Image number cannot exceed ", 1024, " (", sprite_get_name(_sprite), ")");
                
                var _framesArray = sprite_get_info(_sprite).frames;
                var _image = 0;
                
                repeat (_number)
                {
                    if (_textureIndex == undefined)
                    {
                        _firstSprite = _sprite;
                        _textureIndex = _framesArray[_image].texture;
                        _global.__texture = sprite_get_texture(_sprite, _image);
                    }
                    else if (_textureIndex != _framesArray[_image].texture)
                    {
                        __SplatError("All sprites tagged for use with Splat must be on the same texture page\n- Texture page derived from ", sprite_get_name(_firstSprite), "\n- Failed on ", sprite_get_name(_sprite));
                    }
                    
                    var _uvs = sprite_get_uvs(_sprite, _image);
                    var _left = -sprite_get_xoffset(_sprite) + _uvs[4];
                    var _top = -sprite_get_yoffset(_sprite) + _uvs[5];
                    var _right = _left + (_uvs[6] * sprite_get_width(_sprite));
                    var _bottom = _top + (_uvs[7] * sprite_get_height(_sprite));
                    ds_map_set(_imageDataMap, (1024 * _sprite) + _image, 
                    {
                        __left: _left,
                        __top: _top,
                        __right: _right,
                        __bottom: _bottom,
                        __u0: _uvs[0],
                        __v0: _uvs[1],
                        __u1: _uvs[2],
                        __v1: _uvs[3]
                    });
                    _image++;
                }
                
                break;
            }
            
            _i++;
        }
    }
    
    if (_textureIndex == undefined)
        __SplatError("No sprite assets have been tagged with \"splat\" in the IDE");
}

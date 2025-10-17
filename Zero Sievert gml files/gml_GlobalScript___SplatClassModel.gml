function __SplatClassModel() constructor
{
    static _global = __SplatGlobal();
    static __texture = _global.__texture;
    static __vertexFormat = _global.__vertexFormat;
    static __imageDataMap = _global.__imageDataMap;
    
    static __Destroy = function()
    {
        if (__destroyed)
            exit;
        
        __destroyed = true;
        buffer_delete(__buffer);
        vertex_delete_buffer(__vertexBuffer);
        __buffer = undefined;
        __vertexBuffer = undefined;
    };
    
    static __Clear = function()
    {
        __spriteCount = 0;
        __dirty = false;
        vertex_delete_buffer(__vertexBuffer);
        buffer_fill(__buffer, 0, buffer_u64, 0, buffer_get_size(__buffer));
        __vertexBuffer = vertex_create_buffer_from_buffer(__buffer, __vertexFormat);
    };
    
    static __Draw = function()
    {
        if (__dirty)
        {
            __dirty = false;
            vertex_delete_buffer(__vertexBuffer);
            __vertexBuffer = vertex_create_buffer_from_buffer(__buffer, __vertexFormat);
        }
        
        vertex_submit(__vertexBuffer, pr_trianglelist, __texture);
    };
    
    static __Splat = function(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    {
        var _imageData = ds_map_find_value(__imageDataMap, (1024 * arg0) + arg1);
        
        if (_imageData == undefined)
            __SplatError(sprite_get_name(arg0), " not tagged with \"splat\" in the IDE");
        
        var _rgba = (arg7 & 16777215) | ((255 * arg8) << 24);
        var _u0 = _imageData.__u0;
        var _v0 = _imageData.__v0;
        var _u1 = _imageData.__u1;
        var _v1 = _imageData.__v1;
        var _l = arg4 * _imageData.__left;
        var _t = arg5 * _imageData.__top;
        var _r = arg4 * _imageData.__right;
        var _b = arg5 * _imageData.__bottom;
        var _sin = dsin(-arg6);
        var _cos = dcos(-arg6);
        var _ltX = (arg2 + (_l * _cos)) - (_t * _sin);
        var _ltY = arg3 + (_l * _sin) + (_t * _cos);
        var _rtX = (arg2 + (_r * _cos)) - (_t * _sin);
        var _rtY = arg3 + (_r * _sin) + (_t * _cos);
        var _lbX = (arg2 + (_l * _cos)) - (_b * _sin);
        var _lbY = arg3 + (_l * _sin) + (_b * _cos);
        var _rbX = (arg2 + (_r * _cos)) - (_b * _sin);
        var _rbY = arg3 + (_r * _sin) + (_b * _cos);
        var _buffer = __buffer;
        __spriteCount = (__spriteCount + 1) % 75;
        buffer_seek(_buffer, buffer_seek_start, __spriteCount * 144);
        buffer_write(_buffer, buffer_f32, _ltX);
        buffer_write(_buffer, buffer_f32, _ltY);
        buffer_seek(_buffer, buffer_seek_relative, 4);
        buffer_write(_buffer, buffer_u32, _rgba);
        buffer_write(_buffer, buffer_f32, _u0);
        buffer_write(_buffer, buffer_f32, _v0);
        buffer_write(_buffer, buffer_f32, _lbX);
        buffer_write(_buffer, buffer_f32, _lbY);
        buffer_seek(_buffer, buffer_seek_relative, 4);
        buffer_write(_buffer, buffer_u32, _rgba);
        buffer_write(_buffer, buffer_f32, _u0);
        buffer_write(_buffer, buffer_f32, _v1);
        buffer_write(_buffer, buffer_f32, _rtX);
        buffer_write(_buffer, buffer_f32, _rtY);
        buffer_seek(_buffer, buffer_seek_relative, 4);
        buffer_write(_buffer, buffer_u32, _rgba);
        buffer_write(_buffer, buffer_f32, _u1);
        buffer_write(_buffer, buffer_f32, _v0);
        buffer_write(_buffer, buffer_f32, _rtX);
        buffer_write(_buffer, buffer_f32, _rtY);
        buffer_seek(_buffer, buffer_seek_relative, 4);
        buffer_write(_buffer, buffer_u32, _rgba);
        buffer_write(_buffer, buffer_f32, _u1);
        buffer_write(_buffer, buffer_f32, _v0);
        buffer_write(_buffer, buffer_f32, _lbX);
        buffer_write(_buffer, buffer_f32, _lbY);
        buffer_seek(_buffer, buffer_seek_relative, 4);
        buffer_write(_buffer, buffer_u32, _rgba);
        buffer_write(_buffer, buffer_f32, _u0);
        buffer_write(_buffer, buffer_f32, _v1);
        buffer_write(_buffer, buffer_f32, _rbX);
        buffer_write(_buffer, buffer_f32, _rbY);
        buffer_seek(_buffer, buffer_seek_relative, 4);
        buffer_write(_buffer, buffer_u32, _rgba);
        buffer_write(_buffer, buffer_f32, _u1);
        buffer_write(_buffer, buffer_f32, _v1);
        __dirty = true;
    };
    
    __destroyed = false;
    __dirty = false;
    __buffer = buffer_create(10800, buffer_fixed, 1);
    __vertexBuffer = vertex_create_buffer_from_buffer(__buffer, __vertexFormat);
    __spriteCount = 0;
}

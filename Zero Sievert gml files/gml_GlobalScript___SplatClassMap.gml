function __SplatClassMap(arg0, arg1, arg2, arg3) constructor
{
    static _global = __SplatGlobal();
    static __splatMapArray = _global.__splatMapArray;
    
    static Destroy = function()
    {
        if (__destroyed)
            exit;
        
        __destroyed = true;
        var _i = 0;
        
        repeat (array_length(__splatMapArray))
        {
            var _splatMap = __splatMapArray[_i];
            
            if (_splatMap == self)
                array_delete(__splatMapArray, _i, 1);
            else
                _i++;
        }
        
        _i = 0;
        
        repeat (__regionCount)
        {
            __modelArray[_i].__Destroy();
            _i++;
        }
    };
    
    static Clear = function()
    {
        if (__destroyed)
            exit;
        
        var _i = 0;
        
        repeat (__regionCount)
        {
            __modelArray[_i].__Clear();
            _i++;
        }
    };
    
    static Draw = function(arg0, arg1, arg2, arg3)
    {
        if (__destroyed)
            exit;
        
        var _left = clamp((arg0 - __pixelX) div 100, 0, __regionWidth - 1);
        var _top = clamp((arg1 - __pixelY) div 100, 0, __regionHeight - 1);
        var _right = clamp((arg2 - __pixelX) div 100, 0, __regionWidth - 1);
        var _bottom = clamp((arg3 - __pixelY) div 100, 0, __regionHeight - 1);
        var _width = (1 + _right) - _left;
        var _height = (1 + _bottom) - _top;
        var _y = _top;
        
        repeat (_height)
        {
            var _x = _left;
            
            repeat (_width)
            {
                __modelArray[_x + (_y * __regionWidth)].__Draw();
                _x++;
            }
            
            _y++;
        }
    };
    
    static SplatExt = function(arg0, arg1, arg2, arg3, arg4 = 1, arg5 = 1, arg6 = 0, arg7 = 16777215, arg8 = 1)
    {
        if (__destroyed)
            exit;
        
        var _regionX = clamp((arg2 - __pixelX) div 100, 0, __regionWidth - 1);
        var _regionY = clamp((arg3 - __pixelY) div 100, 0, __regionHeight - 1);
        __modelArray[_regionX + (_regionY * __regionWidth)].__Splat(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
    };
    
    array_push(__splatMapArray, self);
    __destroyed = false;
    __pixelX = arg0;
    __pixelY = arg1;
    __pixelWidth = arg2;
    __pixelHeight = arg3;
    __regionWidth = ceil(__pixelWidth / 100);
    __regionHeight = ceil(__pixelHeight / 100);
    __regionCount = __regionWidth * __regionHeight;
    __modelArray = array_create(__regionCount);
    var _i = 0;
    
    repeat (__regionCount)
    {
        __modelArray[_i] = new __SplatClassModel();
        _i++;
    }
}

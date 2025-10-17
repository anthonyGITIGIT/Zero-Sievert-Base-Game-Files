function __uiSurfaceFree(arg0)
{
    static _surfaceArray = __uiGlobal().__surfaceArray;
    
    surface_free(arg0);
    var _i = 0;
    
    repeat (array_length(_surfaceArray))
    {
        var _struct = _surfaceArray[_i];
        
        if (_struct.__surface == arg0)
            array_delete(_surfaceArray, _i, 1);
        else
            _i++;
    }
}

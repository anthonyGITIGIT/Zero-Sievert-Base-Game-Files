function __uiSurfaceCreate(arg0, arg1, arg2)
{
    static _surfaceArray = __uiGlobal().__surfaceArray;
    
    var _surface = surface_create(arg1, arg2);
    array_push(_surfaceArray, 
    {
        __weakRef: weak_ref_create(arg0),
        __surface: _surface
    });
    return _surface;
}

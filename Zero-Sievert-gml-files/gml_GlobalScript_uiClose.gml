function uiClose()
{
    static _global = __uiGlobal();
    
    var _stackSize = __uiContextStackSize();
    
    if (_stackSize <= 1)
        __uiError("Box stack already empty - check number of open/close command matches");
    
    var _stackTop = uiCurrentOpen();
    _stackTop.__CallbackGet(UnknownEnum.Value_14).__Call(_stackTop);
    
    if (_stackSize > 2)
        _stackTop.__LayoutExecute();
    
    __uiContextStackPop();
    _stackSize--;
    
    if (is_method(_global.__currentFunction))
        catspeakPopSelf();
    
    var _array = [];
    _stackTop.__LayoutBuildOrder(_array);
    var _layoutCount = array_length(_array);
    
    repeat (3)
    {
        var _dirty = false;
        var _i = 0;
        
        repeat (_layoutCount)
        {
            _array[_i].__LayoutExecute();
            _i++;
        }
        
        _i = _layoutCount - 1;
        
        repeat (_layoutCount)
        {
            if (!(_array[_i].__LayoutCheck() ?? true))
            {
                _dirty = true;
                break;
            }
            
            _i--;
        }
        
        if (!_dirty)
            break;
    }
    
    _stackTop.BuildIn();
    
    if (_stackTop == __uiRootStackTop())
        __uiRootStackPop();
    
    return _stackTop;
}

enum UnknownEnum
{
    Value_14 = 14
}

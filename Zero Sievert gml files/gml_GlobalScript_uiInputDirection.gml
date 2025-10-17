function uiInputDirection(arg0, arg1, arg2, arg3 = false, arg4 = 0.2, arg5 = false)
{
    static _result = 
    {
        __struct: undefined,
        __distance: undefined
    };
    
    if (!is_struct(arg0))
        exit;
    
    __uiRootStackPush(arg0);
    
    with (arg0)
    {
        var _move = false;
        var _distance = point_distance(0, 0, arg1, arg2);
        var _navDirection, _nX, _nY;
        
        if (_distance < arg4)
        {
            __root.__inputDirectionState = false;
        }
        else if (arg3 || !__root.__inputDirectionState)
        {
            _move = true;
            __root.__inputDirectionState = true;
            _nX = arg1 / _distance;
            _nY = arg2 / _distance;
            _navDirection = undefined;
            
            if (abs(_nX) > abs(_nY))
            {
                if (_nX < 0)
                    _navDirection = 180;
                else
                    _navDirection = 0;
            }
            else if (_nY < 0)
            {
                _navDirection = 90;
            }
            else
            {
                _navDirection = 270;
            }
        }
        
        var _draggingStruct = __uiNullableRefResolve(__root.__draggingRef);
        var _captureStruct = __uiNullableRefResolve(__root.__captureRef);
        var _locked = __root.__captureFocus && __uiNullableRefAlive(__root.__captureRef);
        var _allowFreeMovement = !_locked;
        
        if (_draggingStruct != undefined && ui_is_trading())
        {
            __uiRootStackPop();
            exit;
        }
        
        if (_locked && _move)
        {
            if (_draggingStruct == _captureStruct)
            {
                if (__uiNullableRefAlive(__root.__hoverRef) && __uiNullableRefResolve(__root.__hoverRef).centreOnHover)
                {
                    _allowFreeMovement = true;
                }
                else
                {
                    var _searchX = __root.__pointerX;
                    var _searchY = __root.__pointerY;
                    
                    switch (_navDirection)
                    {
                        case 0:
                            _searchX += 64;
                            break;
                        
                        case 90:
                            _searchY -= 64;
                            break;
                        
                        case 180:
                            _searchX -= 64;
                            break;
                        
                        case 270:
                            _searchY += 64;
                            break;
                    }
                    
                    var _hoverNext = __HoverSearch(_searchX, _searchY, -infinity, -infinity, infinity, infinity, _draggingStruct, false);
                    
                    if (is_struct(_hoverNext))
                    {
                        __root.__pointerX = _searchX;
                        __root.__pointerY = _searchY;
                        __uiHoverSet(self, _hoverNext, true);
                    }
                    else
                    {
                        _allowFreeMovement = true;
                    }
                }
            }
            else
            {
                _captureStruct.__CallbackGet(UnknownEnum.Value_15).__Call(_captureStruct, _navDirection);
            }
        }
        
        if (_allowFreeMovement || arg5)
        {
            if (_move)
            {
                var _freeSearch = false;
                var _groupToSkip = undefined;
                _result.__struct = undefined;
                _result.__distance = infinity;
                _hoverStruct = __uiNullableRefResolve(__root.__hoverRef);
                
                if (is_struct(_hoverStruct))
                {
                    var _navTarget = undefined;
                    
                    with (_hoverStruct)
                    {
                        _freeSearch = !navigationLock;
                        
                        if (arg5)
                            _groupToSkip = hoverGroup;
                        
                        switch (_navDirection)
                        {
                            case 0:
                                _navTarget = __navigationRight;
                                break;
                            
                            case 90:
                                _navTarget = __navigationUp;
                                break;
                            
                            case 180:
                                _navTarget = __navigationLeft;
                                break;
                            
                            case 270:
                                _navTarget = __navigationDown;
                                break;
                        }
                    }
                    
                    _navTarget = __uiNullableRefResolve(_navTarget);
                    
                    if (is_struct(_navTarget))
                    {
                        _result.__struct = _navTarget;
                        _result.__distance = 0;
                        _freeSearch = false;
                    }
                }
                
                if (_freeSearch)
                {
                    __HoverSearchInDirection(__root.__pointerX, __root.__pointerY, _nX, _nY, __uiNullableRefResolve(__root.__hoverRef), -infinity, -infinity, infinity, infinity, _draggingStruct, _groupToSkip, _result);
                    
                    if (_groupToSkip != undefined && !is_struct(_result.__struct))
                        exit;
                }
                
                var _target = _result.__struct;
                
                if (is_struct(_target))
                    __uiHoverSet(self, _target, true);
            }
            
            if (__uiNullableRefAlive(__root.__hoverRef))
            {
                with (__uiNullableRefResolve(__root.__hoverRef))
                {
                    if (array_find_index(["perk_skill,", "perk_select_button", "quick slot 1", "quick slot 2", "quick slot 3", "quick slot 4", "quick slot 5", "quick slot 6", "quick slot 7", "quick slot 8", "quick slot 9"], identifier) != undefined)
                        centreOnHover = true;
                    
                    if (centreOnHover)
                    {
                        other.__root.__pointerX = 0.5 * (__worldLeft + __worldRight);
                        other.__root.__pointerY = 0.5 * (__worldTop + __worldBottom);
                    }
                    else
                    {
                        other.__root.__pointerX = __worldLeft + (0.5 * (__highlightLeft + __highlightRight));
                        other.__root.__pointerY = __worldTop + (0.5 * (__highlightTop + __highlightBottom));
                    }
                }
            }
            else
            {
            }
        }
        
        var _hoverStruct = __HoverSearch(__root.__pointerX, __root.__pointerY, -infinity, -infinity, infinity, infinity, _draggingStruct, true);
        __uiHoverSet(self, _hoverStruct, true);
    }
    
    __uiRootStackPop();
}

enum UnknownEnum
{
    Value_15 = 15
}

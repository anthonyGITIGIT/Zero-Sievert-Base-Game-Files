function uiInputButtonClick(arg0, arg1, arg2, arg3)
{
    if (!is_struct(arg0))
        exit;
    
    __uiRootStackPush(arg0);
    
    with (arg0)
    {
        var _buttonStateDict = __root.__stateButtonDict;
        var _oldState = variable_struct_get(_buttonStateDict, arg1) ?? false;
        
        if (arg2)
            variable_struct_set(_buttonStateDict, arg1, true);
        else
            variable_struct_remove(_buttonStateDict, arg1);
        
        if (variable_struct_get(__root.__stateButtonConsumeDict, arg1) ?? false)
            arg2 = false;
        
        if (arg3 && __root.__captureButtonName == arg1)
        {
            var _captureStruct = __uiNullableRefResolve(__root.__captureRef);
            
            if (is_struct(_captureStruct) && _captureStruct.focusable)
            {
                if (_oldState && !arg2)
                    __root.__captureFocus = !__root.__captureFocus;
            }
            else
            {
                __root.__captureFocus = false;
            }
            
            if (!arg2 && __root.__captureFocus)
            {
                arg2 = true;
                _oldState = true;
            }
        }
        
        if (_oldState != arg2)
        {
            if (arg2)
            {
                variable_struct_set(_buttonStateDict, arg1, true);
                
                if (__uiNullableRefAlive(__root.__hoverRef) && !__root.__captureFocus)
                {
                    var _hoverStruct = __uiNullableRefResolve(__root.__hoverRef);
                    
                    if (_hoverStruct.__CanCaptureClick(arg1, arg3))
                        __uiCaptureSet(self, _hoverStruct, arg1);
                }
            }
            else if (__root.__captureButtonName == arg1)
            {
                var _hoverRef = __root.__hoverRef;
                var _draggingRef = __root.__draggingRef;
                var _dragSuccess = false;
                var _draggingStruct;
                
                if (__uiNullableRefAlive(_draggingRef))
                {
                    _draggingStruct = __uiNullableRefResolve(_draggingRef);
                    var _hoverStruct = __uiNullableRefResolve(_hoverRef);
                    
                    if (_hoverStruct != undefined)
                    {
                        if (_hoverStruct.__CanReceiveDnD(_draggingStruct))
                        {
                            _draggingStruct.__stateDragSuccess = true;
                            _hoverStruct.__OnReceiveDnD(_draggingStruct);
                            _dragSuccess = true;
                        }
                    }
                    
                    _draggingStruct.__OnPlaceDnD(_hoverStruct);
                }
                
                var _captureRef = __root.__captureRef;
                
                if (__uiNullableRefAlive(_captureRef))
                {
                    var _captureStruct = __uiNullableRefResolve(_captureRef);
                    
                    if (!(variable_struct_get(__root.__stateButtonConsumeDict, arg1) ?? false))
                    {
                        if (__uiNullableRefAlive(_draggingRef))
                        {
                            if (point_distance(__root.__pointerStartX, __root.__pointerStartY, __root.__pointerX, __root.__pointerY) < 8)
                                __uiInputButtonClick(__uiNullableRefResolve(_draggingRef), arg1);
                        }
                        else if (__uiNullableRefResolve(__root.__hoverRef) == _captureStruct)
                        {
                            __uiInputButtonClick(_captureStruct, arg1);
                        }
                    }
                }
                
                __uiCaptureSet(self, undefined, undefined);
                
                if (_dragSuccess)
                    _draggingStruct.__stateDragSuccess = false;
            }
        }
        else if (arg2)
        {
            if (__root.__captureButtonName == arg1)
            {
                var _captureRef = __root.__captureRef;
                
                if (__uiNullableRefAlive(_captureRef))
                {
                    var _captureStruct = __uiNullableRefResolve(_captureRef);
                    _captureStruct.__CallbackGet(UnknownEnum.Value_5).__Call(_captureStruct, arg1, arg3);
                }
            }
        }
        else
        {
            variable_struct_remove(__root.__stateButtonConsumeDict, arg1);
        }
    }
    
    __uiRootStackPop();
}

enum UnknownEnum
{
    Value_5 = 5
}

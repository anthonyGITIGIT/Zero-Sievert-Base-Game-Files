function uiInputButtonCast(arg0, arg1, arg2, arg3)
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
        
        if (_oldState != arg2)
        {
            if (arg2)
            {
                variable_struct_set(_buttonStateDict, arg1, true);
                
                if (!__root.__captureFocus)
                {
                    var _captureStruct = undefined;
                    var _castFrom = __uiNullableRefAlive(__root.__lastHoverRef) ? __uiNullableRefResolve(__root.__lastHoverRef) : self;
                    
                    if (is_struct(_castFrom))
                        _captureStruct = _castFrom.__FindCaptureCast(arg1, arg3);
                    
                    if (!is_struct(_captureStruct))
                        _captureStruct = __FindCaptureCast(arg1, arg3);
                    
                    __uiCaptureSet(self, _captureStruct, arg1);
                }
            }
            else if (__root.__captureButtonName == arg1)
            {
                var _captureRef = __root.__captureRef;
                
                if (__uiNullableRefAlive(_captureRef))
                {
                    if (!(variable_struct_get(__root.__stateButtonConsumeDict, arg1) ?? false))
                        __uiInputButtonClick(__uiNullableRefResolve(_captureRef), arg1);
                }
                
                __uiCaptureSet(self, undefined, undefined);
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

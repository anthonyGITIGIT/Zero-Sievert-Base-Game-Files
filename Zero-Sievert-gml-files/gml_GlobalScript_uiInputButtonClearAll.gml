function uiInputButtonClearAll(arg0, arg1 = true)
{
    if (!is_struct(arg0))
        exit;
    
    __uiRootStackPush(arg0);
    
    with (arg0)
    {
        __root.__stateButtonDict = {};
        __root.__draggingRef = undefined;
        __uiNullableRefCall(__root.__captureRef, UnknownEnum.Value_6, __root.__captureButtonName);
        __uiCaptureSet(self, undefined, undefined);
        
        if (arg1)
            __uiHoverSet(self, undefined, false);
    }
    
    __uiRootStackPop();
}

enum UnknownEnum
{
    Value_6 = 6
}

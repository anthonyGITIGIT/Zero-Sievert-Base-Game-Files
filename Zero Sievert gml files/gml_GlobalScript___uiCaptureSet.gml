function __uiCaptureSet(arg0, arg1, arg2)
{
    with (arg0)
    {
        var _oldStruct = __uiNullableRefResolve(__root.__captureRef);
        
        if (_oldStruct != arg1)
        {
            if (_oldStruct != undefined)
            {
                _oldStruct.__CallbackGet(UnknownEnum.Value_6).__Call(_oldStruct, __root.__captureButtonName);
                
                with (__root)
                {
                    __captureRef = undefined;
                    __captureButtonName = undefined;
                    __captureFocus = false;
                    __captureTime = infinity;
                    __captureLocalX = 0;
                    __captureLocalY = 0;
                    __pointerStartX = undefined;
                    __pointerStartY = undefined;
                }
            }
            
            if (arg1 != undefined)
            {
                with (__root)
                {
                    __captureRef = __uiNullableRefCreate(arg1);
                    __captureButtonName = arg2;
                    __captureFocus = false;
                    __captureTime = current_time;
                    __captureLocalX = __pointerX - (0.5 * (arg1.__worldLeft + arg1.__worldRight));
                    __captureLocalY = __pointerY - (0.5 * (arg1.__worldTop + arg1.__worldBottom));
                    __pointerStartX = __pointerX;
                    __pointerStartY = __pointerY;
                }
                
                arg1.__CallbackGet(UnknownEnum.Value_4).__Call(arg1, arg2);
            }
        }
    }
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_6 = 6
}

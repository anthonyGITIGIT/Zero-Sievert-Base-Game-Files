function __uiHoverSet(arg0, arg1, arg2, arg3 = false)
{
    with (arg0)
    {
        var _oldStruct = __uiNullableRefResolve(__root.__hoverRef);
        
        if (_oldStruct != arg1)
        {
            if (_oldStruct != undefined)
            {
                _oldStruct.__CallbackGet(UnknownEnum.Value_2).__Call(_oldStruct);
                __root.__hoverRef = undefined;
            }
            
            if (arg1 != undefined)
            {
                arg1.__CallbackGet(UnknownEnum.Value_0).__Call(arg1);
                __root.__hoverRef = __uiNullableRefCreate(arg1);
                __root.__lastHoverRef = __root.__hoverRef;
                
                if (arg2)
                    arg1.__ScrollParentToSelf();
            }
        }
        else if (_oldStruct != undefined)
        {
            _oldStruct.__CallbackGet(UnknownEnum.Value_1).__Call(_oldStruct);
            
            if (arg3)
                _oldStruct.__ScrollParentToSelf();
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2
}

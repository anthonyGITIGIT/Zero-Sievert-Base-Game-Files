function __uiDraggingSet(arg0, arg1)
{
    with (arg0)
    {
        var _oldStruct = __uiNullableRefResolve(__root.__draggingRef);
        
        if (_oldStruct != arg1)
        {
            if (_oldStruct != undefined)
            {
                _oldStruct.__stateDragging = false;
                __root.__draggingRef = undefined;
            }
            
            if (arg1 != undefined)
            {
                arg1.__stateDragging = true;
                __root.__draggingRef = __uiNullableRefCreate(arg1);
            }
            
            if (arg1 == undefined)
            {
                if (__uiNullableRefAlive(__root.__hoverRef))
                {
                    var _hoverStruct = __uiNullableRefResolve(__root.__hoverRef);
                    
                    if (_hoverStruct != _oldStruct)
                        __uiHoverSet(self, _oldStruct, true, true);
                }
            }
        }
    }
}

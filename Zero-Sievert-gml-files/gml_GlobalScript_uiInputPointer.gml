function uiInputPointer(arg0, arg1, arg2)
{
    if (!is_struct(arg0))
        exit;
    
    __uiRootStackPush(arg0);
    
    with (arg0)
    {
        __root.__pointerX = arg1;
        __root.__pointerY = arg2;
        __uiHoverSet(self, __HoverSearch(arg1, arg2, -infinity, -infinity, infinity, infinity, __uiNullableRefResolve(__root.__draggingRef), false), false);
    }
    
    __uiRootStackPop();
}

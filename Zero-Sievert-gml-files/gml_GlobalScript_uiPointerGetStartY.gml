function uiPointerGetStartY(arg0 = undefined)
{
    if (arg0 == undefined)
        arg0 = __uiRootStackTop();
    
    var _value = is_struct(arg0) ? arg0.__root.__pointerStartY : undefined;
    return _value ?? uiPointerGetY(arg0);
}

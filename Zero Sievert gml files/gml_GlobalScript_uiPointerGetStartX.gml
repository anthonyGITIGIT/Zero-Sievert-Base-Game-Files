function uiPointerGetStartX(arg0 = undefined)
{
    static _global = __uiGlobal();
    
    if (arg0 == undefined)
        arg0 = __uiRootStackTop();
    
    var _value = is_struct(arg0) ? arg0.__root.__pointerStartX : undefined;
    return _value ?? uiPointerGetX(arg0);
}

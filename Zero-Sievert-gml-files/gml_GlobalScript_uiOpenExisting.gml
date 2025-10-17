function uiOpenExisting(arg0)
{
    static _global = __uiGlobal();
    
    if (instanceof(arg0) == "__uiClassRoot")
        __uiRootStackPush(arg0);
    
    __uiContextStackPush(arg0);
    
    if (is_method(_global.__currentFunction))
        catspeakPushSelf(arg0);
    
    return arg0;
}

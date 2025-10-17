function uiCallInherited()
{
    static _global = __uiGlobal();
    
    return _global.__currentCallback.__CallInherited(_global.__currentCallbackScope, _global.__currentCallbackParam0, _global.__currentCallbackParam1);
}

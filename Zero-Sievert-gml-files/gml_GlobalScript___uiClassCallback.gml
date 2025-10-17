function __uiClassCallback(arg0, arg1, arg2) constructor
{
    static _global = __uiGlobal();
    
    static __Call = function(arg0, arg1, arg2)
    {
        if (__function == undefined)
            exit;
        
        var _oldCallback = _global.__currentCallback;
        var _oldCallbackScope = _global.__currentCallbackScope;
        var _oldCallbackParam0 = _global.__currentCallbackParam0;
        var _oldCallbackParam1 = _global.__currentCallbackParam1;
        _global.__currentCallback = self;
        _global.__currentCallbackScope = arg0;
        _global.__currentCallbackParam0 = arg1;
        _global.__currentCallbackParam1 = arg2;
        var _result;
        
        if (__fromCatspeak)
        {
            var _newScope = arg0 ?? {};
            __function.setGlobals(_newScope);
            __function.setSelf(_newScope);
            _result = __function(arg1, arg2);
        }
        else
        {
            _result = method(arg0, __function)(arg1, arg2);
        }
        
        _global.__currentCallback = _oldCallback;
        _global.__currentCallbackScope = _oldCallbackScope;
        _global.__currentCallbackParam0 = _oldCallbackParam0;
        _global.__currentCallbackParam1 = _oldCallbackParam1;
        return _result;
    };
    
    static __CallInherited = function(arg0, arg1, arg2)
    {
        if (__parent == undefined)
            exit;
        
        return __parent.__Call(arg0, arg1, arg2);
    };
    
    __parent = arg0;
    __function = arg1;
    __fromCatspeak = arg2;
}

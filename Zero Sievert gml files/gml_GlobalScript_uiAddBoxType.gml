function uiAddBoxType(arg0, arg1, arg2 = true)
{
    static _catspeakEnv = __uiGlobal().__catspeakEnv;
    
    var _oldConstructor = variable_struct_get(_catspeakEnv.interface, arg0);
    
    if (_oldConstructor != undefined)
    {
        var _oldConstructorName = is_numeric(_oldConstructor) ? (script_exists(_oldConstructor) ? script_get_name(_oldConstructor) : ("<unknown script " + string(_oldConstructor) + ">")) : string(_oldConstructor);
        var _newConstructor = arg1;
        var _newConstructorName = is_numeric(_newConstructor) ? (script_exists(_newConstructor) ? script_get_name(_newConstructor) : ("<unknown script " + string(_newConstructor) + ">")) : string(_newConstructor);
        
        if (arg2)
        {
            __uiTrace("Warning! Overwriting old box type \"", arg0, "\" constructor ", _oldConstructorName, " with constructor ", _newConstructorName);
        }
        else
        {
            __uiTrace("Warning! Cannot overwrite old box type \"", arg0, "\" constructor ", _oldConstructorName, " with constructor ", _newConstructorName, ", overwrite permission denied");
            exit;
        }
    }
    
    _catspeakEnv.addFunction(arg0, method(
    {
        const: arg1
    }, function()
    {
        static _global = __uiGlobal();
        
        if (_global.__createHijack != undefined)
        {
            uiOpenExisting(_global.__createHijack);
            _global.__createHijack = undefined;
        }
        else
        {
            uiOpen(const);
        }
        
        return uiClose;
    }));
}

function uiFind(arg0, arg1)
{
    static _global = __uiGlobal();
    
    if (!is_struct(arg0))
        __uiError("Root struct invalid (datatype=", typeof(arg0), ")");
    
    var _result = arg0.Find(arg1);
    
    if (!is_struct(_result))
        __uiError("Identifier \"", arg1, "\" not found for root \"", arg0, "\"");
    
    return _result;
}

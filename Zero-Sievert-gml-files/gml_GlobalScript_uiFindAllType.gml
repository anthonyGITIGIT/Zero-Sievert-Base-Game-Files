function uiFindAllType(arg0, arg1)
{
    static _global = __uiGlobal();
    
    if (!is_struct(arg0))
        __uiError("Root struct invalid (datatype=", typeof(arg0), ")");
    
    var _result = [];
    arg0.FindType(_result, arg1);
    return _result;
}

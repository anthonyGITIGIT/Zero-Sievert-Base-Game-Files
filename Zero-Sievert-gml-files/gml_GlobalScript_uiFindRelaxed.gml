function uiFindRelaxed(arg0, arg1, arg2 = false)
{
    static _global = __uiGlobal();
    
    if (!is_struct(arg0))
    {
        if (!arg2)
            __uiError("Root struct invalid (datatype=", typeof(arg0), ")");
        
        return undefined;
    }
    
    return arg0.Find(arg1);
}

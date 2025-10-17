function Splat(arg0, arg1, arg2, arg3, arg4 = 1, arg5 = 1, arg6 = 0, arg7 = 16777215, arg8 = 1)
{
    static _global = __SplatGlobal();
    
    if (array_length(_global.__splatMapArray) <= 0)
    {
        __SplatError("No splatmap exists (call SplatMap() first)");
        exit;
    }
    
    _global.__splatMapArray[0].SplatExt(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
}

function uiCreate(arg0 = uiClassBox)
{
    static _global = __uiGlobal();
    static _fileDict = _global.__fileDict;
    
    var _box;
    
    if (is_method(arg0) || (is_numeric(arg0) && script_exists(arg0)))
    {
        _box = new arg0();
        
        with (_box)
        {
            __CallbackGet(UnknownEnum.Value_17).__Call(self, __parent, undefined);
            
            if (is_struct(__parent))
            {
                with (__parent)
                    __CallbackGet(UnknownEnum.Value_16).__Call(self);
            }
        }
    }
    else
    {
        __uiError("Box constructor \"", arg0, "\" not recognised");
    }
    
    return _box;
}

enum UnknownEnum
{
    Value_16 = 16,
    Value_17
}

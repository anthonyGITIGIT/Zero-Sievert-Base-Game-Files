function __uiArrayFindIndex(arg0, arg1)
{
    var _i = 0;
    
    repeat (array_length(arg0))
    {
        if (arg0[_i] == arg1)
            return _i;
        
        _i++;
    }
    
    return undefined;
}

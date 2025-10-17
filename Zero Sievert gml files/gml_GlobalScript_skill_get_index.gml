function skill_get_index(arg0)
{
    if (is_numeric(arg0))
        return arg0;
    
    var _i = 0;
    
    repeat (array_length(global.sk_name))
    {
        if (global.sk_name[_i] == arg0)
            return _i;
        
        _i++;
    }
    
    return undefined;
}

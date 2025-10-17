function SnapNumberToString(arg0, arg1)
{
    if (arg1 && is_real(arg0) && floor(arg0) != arg0)
    {
        arg0 = string_format(arg0, 0, 10);
        var _length = string_length(arg0);
        var _i = _length;
        
        repeat (_length)
        {
            if (string_char_at(arg0, _i) != "0")
                break;
            
            _i--;
        }
        
        if (string_char_at(arg0, _i) == ".")
            _i--;
        
        arg0 = string_delete(arg0, _i + 1, _length - _i);
        return arg0;
    }
    else
    {
        return string(arg0);
    }
}

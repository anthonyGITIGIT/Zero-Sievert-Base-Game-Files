function concat()
{
    var _string = "";
    var _i = 0;
    
    repeat (argument_count)
    {
        var _argument = argument[_i];
        
        if (is_struct(_argument))
            _argument = json_stringify(_argument);
        
        _string += string(_argument);
        _i++;
    }
    
    return _string;
}

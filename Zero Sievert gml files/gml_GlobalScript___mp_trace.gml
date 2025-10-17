function __mp_trace()
{
    var _string = "MP: ";
    var _i = 0;
    
    repeat (argument_count)
    {
        _string += string(argument[_i]);
        _i++;
    }
    
    trace(_string);
}

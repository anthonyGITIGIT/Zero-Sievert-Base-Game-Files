function __building_trace()
{
    var _string = "Building: ";
    var _i = 0;
    
    repeat (argument_count)
    {
        _string += string(argument[_i]);
        _i++;
    }
    
    trace(_string);
}

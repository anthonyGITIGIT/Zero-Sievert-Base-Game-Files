function __building_error()
{
    var _string = "Building:\n";
    var _i = 0;
    
    repeat (argument_count)
    {
        _string += string(argument[_i]);
        _i++;
    }
    
    trace(_string);
    show_error(_string + "\n ", true);
}

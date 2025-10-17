function __uiTrace()
{
    var _string = "";
    var _i = 0;
    
    repeat (argument_count)
    {
        _string += string(argument[_i]);
        _i++;
    }
    
    var _UI_TRACE = uiTrace;
    
    if (_UI_TRACE != undefined)
        _UI_TRACE(_string);
}

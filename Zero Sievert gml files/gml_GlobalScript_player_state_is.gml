function player_state_is(arg0)
{
    var _state = player_get_state(arg0);
    
    if (_state == undefined)
        return false;
    
    var _i = 1;
    
    repeat (argument_count - 1)
    {
        if (argument[_i] == _state)
            return true;
        
        _i++;
    }
    
    return false;
}

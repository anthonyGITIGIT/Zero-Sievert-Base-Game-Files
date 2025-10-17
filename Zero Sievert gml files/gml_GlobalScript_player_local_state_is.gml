function player_local_state_is()
{
    var _state = player_get_local_state();
    
    if (_state == undefined)
        return false;
    
    var _i = 0;
    
    repeat (argument_count)
    {
        if (argument[_i] == _state)
            return true;
        
        _i++;
    }
    
    return false;
}

function quest_log_get_count()
{
    var _count = 0;
    var _i = 0;
    
    repeat (30)
    {
        var _quest_state = global.quest_state[_i];
        
        if (_quest_state.id != "")
            _count++;
        
        _i++;
    }
    
    return _count;
}

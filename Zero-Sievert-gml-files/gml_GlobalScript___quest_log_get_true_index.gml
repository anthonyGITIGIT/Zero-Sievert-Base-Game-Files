function __quest_log_get_true_index(arg0)
{
    var _i = 0;
    
    repeat (30)
    {
        var _quest_state = global.quest_state[_i];
        
        if (_quest_state.id != "")
        {
            if (arg0 <= 0)
                return _i;
            
            arg0--;
        }
        
        _i++;
    }
    
    return undefined;
}

function quest_is_active(arg0)
{
    for (var j = 0; j < 30; j++)
    {
        var _quest_active_id = global.quest_state[j].id;
        
        if (_quest_active_id == arg0)
            return true;
    }
    
    return false;
}

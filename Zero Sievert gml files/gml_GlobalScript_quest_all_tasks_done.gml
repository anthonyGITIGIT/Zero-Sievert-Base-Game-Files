function quest_tasks_done(arg0)
{
    var _count = quest_log_get_count();
    
    for (var i = 0; i < _count; i++)
    {
        if (quest_log_get_id(i) == arg0)
            return quest_log_get_state(i) == "completed";
    }
    
    return false;
}

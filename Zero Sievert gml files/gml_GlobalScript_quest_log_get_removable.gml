function quest_log_get_removable(arg0)
{
    _quest_data = __quest_log_get_quest_data(arg0);
    
    if (_quest_data == undefined)
        return undefined;
    
    return _quest_data.removable;
}

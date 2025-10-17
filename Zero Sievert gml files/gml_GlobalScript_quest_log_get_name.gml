function quest_log_get_name(arg0)
{
    var _quest_data = __quest_log_get_quest_data(arg0);
    
    if (_quest_data == undefined)
        return "???";
    
    return language_get_string(_quest_data.name);
}

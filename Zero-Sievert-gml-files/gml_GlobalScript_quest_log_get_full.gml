function quest_log_get_full(arg0)
{
    var _quest_id = quest_log_get_id(arg0);
    
    if (_quest_id == undefined)
        return "???";
    
    var _new_line = "\n";
    var _return_text = "";
    _return_text += (language_get_string("OBJECTIVE") + ":");
    _return_text += _new_line;
    _return_text += quest_log_get_objective(arg0);
    _return_text += _new_line;
    _return_text += (language_get_string("TEXT") + ":");
    _return_text += _new_line;
    _return_text += quest_log_get_description(arg0);
    _return_text += _new_line;
    return _return_text;
}

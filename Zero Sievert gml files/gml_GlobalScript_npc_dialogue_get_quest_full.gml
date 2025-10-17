function npc_dialogue_get_quest_full(arg0, arg1)
{
    var _id = npc_dialogue_get_quest_id(arg0, arg1);
    
    if (_id == undefined)
        return "???";
    
    var _new_line = "\n";
    var _return_text = "";
    _return_text += (language_get_string("OBJECTIVE") + ":");
    _return_text += _new_line;
    _return_text += npc_dialogue_get_quest_objective(arg0, arg1);
    _return_text += _new_line;
    _return_text += (language_get_string("TEXT") + ":");
    _return_text += _new_line;
    _return_text += npc_dialogue_get_quest_description(arg0, arg1);
    _return_text += _new_line;
    return _return_text;
}

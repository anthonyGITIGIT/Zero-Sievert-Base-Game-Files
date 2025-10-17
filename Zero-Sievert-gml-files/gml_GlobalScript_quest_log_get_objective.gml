function quest_log_get_objective(arg0)
{
    var _quest_id = quest_log_get_id(arg0);
    
    if (_quest_id == undefined)
        return "???";
    
    return __npc_dialogue_get_quest_objective(_quest_id, global.quest_state[arg0], true);
}

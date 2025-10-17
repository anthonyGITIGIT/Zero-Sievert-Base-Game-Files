function quest_log_get_giver_name(arg0)
{
    arg0 = __quest_log_get_true_index(arg0);
    
    if (arg0 == undefined)
        return undefined;
    
    var _quest_state = global.quest_state[arg0];
    
    if (_quest_state == undefined)
        return "???";
    
    return npc_get_name(_quest_state.giver);
}

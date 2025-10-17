function quest_log_get_id(arg0)
{
    arg0 = __quest_log_get_true_index(arg0);
    
    if (arg0 == undefined)
        return undefined;
    
    return global.quest_state[arg0].id;
}

function npc_dialogue_get_quest_id(arg0, arg1)
{
    if (arg0 == undefined || !instance_exists(arg0))
        return undefined;
    
    if (arg1 < 0 || arg1 >= array_length(arg0.quest_array))
        return undefined;
    
    var _quest = arg0.quest_array[arg1];
    return (_quest == "") ? undefined : _quest;
}

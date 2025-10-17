function npc_dialogue_get_quest_rewards(arg0, arg1)
{
    var _id = npc_dialogue_get_quest_id(arg0, arg1);
    
    if (_id == undefined)
        return [];
    
    return variable_struct_get(global.quest_database, _id).reward;
}

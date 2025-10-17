function npc_dialogue_get_quest_state(arg0, arg1)
{
    var _id = npc_dialogue_get_quest_id(arg0, arg1);
    
    if (_id == undefined)
        return "???";
    
    var _quest_id = arg0.quest_array[arg1];
    var _npc_id = arg0.npc_id;
    var _i = 0;
    
    repeat (30)
    {
        var _quest_state = global.quest_state[_i];
        
        if (_quest_id == _quest_state.id && _npc_id == _quest_state.giver)
            return _quest_state.state;
        
        _i++;
    }
    
    return undefined;
}

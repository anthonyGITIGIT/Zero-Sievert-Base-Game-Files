function npc_dialogue_get_quest_state_current()
{
    var _npc_instance = uiGetData().npc_instance;
    var _quest_index = uiGetData().npc_quest_index;
    var _quest_id = npc_dialogue_get_quest_id(_npc_instance, _quest_index);
    var _index = undefined;
    var _i = 0;
    
    repeat (30)
    {
        if (global.quest_state[_i].id == _quest_id)
        {
            _index = _i;
            break;
        }
        
        _i++;
    }
    
    if (_index == undefined)
        return false;
    
    var _quest_state = global.quest_state[_index];
}

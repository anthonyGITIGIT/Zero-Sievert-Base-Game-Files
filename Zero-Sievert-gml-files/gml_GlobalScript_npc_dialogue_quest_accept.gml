function npc_dialogue_quest_accept()
{
    var _npc_instance = uiGetData().npc_instance;
    var _quest_index = uiGetData().npc_quest_index;
    var _quest_id = npc_dialogue_get_quest_id(_npc_instance, _quest_index);
    
    if (npc_dialogue_get_quest_state(_npc_instance, _quest_index) != undefined)
    {
        scr_draw_text_with_box("You already have this quest!");
        exit;
    }
    
    var _quest_data = variable_struct_get(global.quest_database, _quest_id);
    var _level_required = _quest_data.rep_min;
    
    if (faction_get_rep("Player", _quest_data.faction) < _quest_data.rep_min)
    {
        _text = language_get_string("Reputation level required");
        _text = string_replace(_text, "[REPUTATION_MINIMUM]", string(_quest_data.rep_min));
        scr_draw_text_with_box(_text, false);
        exit;
    }
    
    var _empty_index = undefined;
    var _i = 0;
    
    repeat (30)
    {
        if (global.quest_state[_i].id == "")
        {
            _empty_index = _i;
            break;
        }
        
        _i++;
    }
    
    if (_empty_index == undefined)
    {
        scr_draw_text_with_box("You have reached the max task limit!");
        exit;
    }
    
    var _array_item = _quest_data.initial_item;
    
    if (!inventory_check_for_space_for_quest(_array_item))
    {
        scr_draw_text_with_box("Not enough inventory space!");
        exit;
    }
    
    var _quest_state = new class_quest_state();
    _quest_state.id = _quest_id;
    _quest_state.giver = _npc_instance.npc_id;
    _quest_state.state = "active";
    global.quest_state[_empty_index] = _quest_state;
    item_tracking_reset();
    var _text = language_get_string("Quest accepted");
    _text = string_replace(_text, "[QUEST_NAME]", language_get_string(variable_struct_get(global.quest_database, _quest_id).name));
    scr_draw_text_with_box(_text);
    _i = 0;
    
    repeat (array_length(_array_item))
    {
        var _item_data = _array_item[_i];
        var _item_id = _item_data.item;
        var _amount = _item_data.amount;
        inventory_add_item(_item_id, _amount);
        _text = language_get_string("Item added to inventory");
        _text = string_replace(_text, "[ITEM_NAME]", item_get_name(_item_id));
        _text = string_replace(_text, "[ITEM_QUANTITY]", string(_amount));
        scr_draw_text_with_box(_text, false);
        _i++;
    }
    
    if (is_in_hub())
    {
        quest_save();
        obj_controller.alarm[1] = 1;
    }
    
    uiFind(uiCurrentRoot(), "top left frame").ReplaceFromFile("ZS_vanilla/ui/empty.ui");
    uiFind(uiCurrentRoot(), "left frame").ReplaceFromFile("ZS_vanilla/ui/npc_left_quest_selection.ui");
    uiFind(uiCurrentRoot(), "right frame").ReplaceFromFile("ZS_vanilla/ui/empty.ui");
}

function npc_dialogue_quest_turn_in()
{
    var _npc_instance = uiGetData().npc_instance;
    var _quest_index = uiGetData().npc_quest_index;
    var _reward_item = uiGetData().reward_item;
    var _reward_item_quantity = uiGetData().reward_item_quantity;
    var _reward_only_cash = uiGetData().reward_only_cash;
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
    {
        scr_draw_text_with_box("You have not accepted this task yet!");
        exit;
    }
    
    var _quest_state = global.quest_state[_index];
    
    if (!global.general_debug)
    {
        if (_quest_state.state != "completed" || _quest_state.giver != _npc_instance.npc_id)
        {
            scr_draw_text_with_box("You have not completed this task yet!");
            exit;
        }
    }
    
    if (_reward_only_cash)
        _reward_item = "roubles";
    
    if (_reward_item == undefined)
    {
        scr_draw_text_with_box("You have to choose an item as your reward!");
        exit;
    }
    
    if (!inventory_check_for_space_for_quest([
    {
        item: _reward_item,
        amount: _reward_item_quantity
    }]))
    {
        scr_draw_text_with_box("Not enough inventory space!");
        exit;
    }
    
    with (obj_draw_something)
        instance_destroy();
    
    var _quest_data = variable_struct_get(global.quest_database, _quest_id);
    var _rep_reward = round(_quest_data.experience * global.sk_k[UnknownEnum.Value_25]);
    var _money_reward = round(_quest_data.money * global.sk_k[UnknownEnum.Value_25] * difficulty_get("pro_quest_money"));
    var _rep_quest = round(_quest_data.reputation * difficulty_get("pro_quest_rep"));
    
    if (player_exists_local())
    {
        var _text = instance_create_depth(player_get_local().x, player_get_local().y, -player_get_local().y, obj_draw_something);
        _text.t = string(_money_reward) + " " + language_get_string("Roubles") + " / " + string(_rep_reward) + " " + language_get_string("experience");
    }
    
    global.player_money += _money_reward;
    global.xp += _rep_reward;
    stat_add_value("tot_money", _money_reward);
    inventory_add_item(_reward_item, _reward_item_quantity);
    faction_add_rep("Player", _quest_data.faction, _rep_quest);
    
    if (variable_struct_get(global.quest_database, _quest_id).daily == true)
    {
        stat_increment("tot_daily_quests_completed");
        steam_stat_increment("dailyquestscompleted");
    }
    
    var _objectives_array = _quest_data.objective;
    _i = 0;
    
    repeat (array_length(_objectives_array))
    {
        var _objectives_data = _objectives_array[_i];
        
        switch (_objectives_data.type)
        {
            case "collect":
            case "retrieve":
            case "retrieve_equipment":
            case "retrieve_analyzer":
                inventory_and_stash_remove_item(_objectives_data.item, _objectives_data.amount_max);
                break;
        }
        
        _i++;
    }
    
    global.quest_state[_index] = new class_quest_state();
    item_tracking_reset();
    db_open(inventory_target_db());
    var _npc_quest_array = _npc_instance.quest_array;
    _i = 0;
    
    repeat (array_length(_npc_quest_array))
    {
        var _npc_quest_id = _npc_quest_array[_i];
        
        if (_quest_id == _npc_quest_id)
        {
            _npc_quest_array[_i] = "";
            var _npc_name = _npc_instance.npc_id + "_quest";
            db_write("NPC", _npc_name, _npc_quest_array);
        }
        
        _i++;
    }
    
    db_close();
    quest_complete(_quest_id);
    quest_line_update();
    
    if (is_in_hub())
    {
        db_force_save_soft("pre_raid");
        quest_save();
        faction_save();
    }
    
    with (_npc_instance)
        lista_text();
    
    if (_quest_id == "igor_supplies")
    {
        uiOnionCurrent().LayerDelete(uiOnionCurrentLayer());
        player_set_local_state(scr_player_state_move);
    }
    else
    {
        uiFind(uiCurrentRoot(), "top left frame").ReplaceFromFile("ZS_vanilla/ui/empty.ui");
        uiFind(uiCurrentRoot(), "left frame").ReplaceFromFile("ZS_vanilla/ui/npc_left_quest_selection.ui");
        uiFind(uiCurrentRoot(), "right frame").ReplaceFromFile("ZS_vanilla/ui/empty.ui");
    }
    
    uiGetData().reward_item = undefined;
    uiGetData().reward_only_cash = false;
}

enum UnknownEnum
{
    Value_25 = 25
}

function scr_quest_create_contract(arg0, arg1, arg2, arg3, arg4)
{
    var _quest_id = arg0;
    var i = arg1;
    var _object = arg2;
    global.quest_type[_quest_id][i] = "contract";
    global.quest_amount_now[_quest_id][i] = 0;
    global.quest_amount_max[_quest_id][i] = 1;
    global.quest_obj_to_kill[_quest_id][i] = _object;
    global.quest_contract_map[_quest_id][i] = arg3;
    global.quest_contract_obj_name[_quest_id][i] = arg4;
}

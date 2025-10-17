function scr_quest_create_retrieve_analyzer(arg0, arg1, arg2, arg3, arg4)
{
    var _quest_id = arg0;
    var i = arg1;
    global.quest_type[_quest_id][i] = "retrieve_analyzer";
    global.quest_amount_now[_quest_id][i] = 0;
    global.quest_amount_max[_quest_id][i] = 1;
    global.quest_collect_item[_quest_id][i] = arg2;
    global.quest_retrive_chest[_quest_id][i] = arg3;
    global.quest_retrive_map[_quest_id][i] = arg4;
}

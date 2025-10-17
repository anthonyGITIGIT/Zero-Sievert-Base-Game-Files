function scr_quest_create_approach(arg0, arg1, arg2, arg3, arg4)
{
    var _quest_id = arg0;
    var i = arg1;
    global.quest_type[_quest_id][i] = "approach";
    global.quest_amount_now[_quest_id][i] = 0;
    global.quest_amount_max[_quest_id][i] = 1;
    global.quest_approach_obj[_quest_id][i] = arg2;
    global.quest_approach_dis[_quest_id][i] = arg3;
    global.quest_approach_map[_quest_id][i] = arg4;
}

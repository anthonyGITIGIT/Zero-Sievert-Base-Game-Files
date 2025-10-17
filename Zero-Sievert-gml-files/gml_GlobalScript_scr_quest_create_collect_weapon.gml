function scr_quest_create_collect_weapon(arg0, arg1, arg2, arg3, arg4)
{
    var _quest_id = arg0;
    var i = arg1;
    var _amount_max = arg2;
    global.quest_type[_quest_id][i] = "collect_weapon";
    global.quest_amount_now[_quest_id][i] = 0;
    global.quest_amount_max[_quest_id][i] = _amount_max;
    global.quest_collect_item[_quest_id][i] = arg3;
    global.quest_collect_dur_min[_quest_id][i] = arg4;
}

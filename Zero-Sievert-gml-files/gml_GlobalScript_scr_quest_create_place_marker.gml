function scr_quest_create_place_marker(arg0, arg1, arg2, arg3)
{
    var _quest_id = arg0;
    var i = arg1;
    global.quest_type[_quest_id][i] = "place_marker";
    global.quest_amount_now[_quest_id][i] = 0;
    global.quest_amount_max[_quest_id][i] = 1;
    global.quest_place_marker_object[_quest_id][i] = arg2;
    global.quest_place_marker_map[_quest_id][i] = arg3;
}

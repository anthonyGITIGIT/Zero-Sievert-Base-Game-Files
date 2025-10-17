function scr_quest_create_interact_with_obj(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    var _quest_id = arg0;
    var i = arg1;
    var _object = arg2;
    var _dis = arg3;
    var _item_id = arg4;
    var _interact_text = arg5;
    global.quest_type[_quest_id][i] = "interact_obj";
    global.quest_amount_now[_quest_id][i] = 0;
    global.quest_amount_max[_quest_id][i] = 1;
    global.quest_interact_object[_quest_id][i] = _object;
    global.quest_interact_dis[_quest_id][i] = _dis;
    global.quest_interact_item_id[_quest_id][i] = _item_id;
    global.quest_interact_text[_quest_id][i] = _interact_text;
    global.quest_interact_text_if_no_item[_quest_id][i] = arg6;
    global.quest_interact_text_if_item[_quest_id][i] = arg7;
}

function scr_quest_create_kill()
{
    var _quest_id = argument[0];
    var i = argument[1];
    var _amount_max = argument[2];
    var _argument_before_obj_to_kill = 5;
    global.quest_type[_quest_id][i] = "kill";
    global.quest_amount_now[_quest_id][i] = 0;
    global.quest_amount_max[_quest_id][i] = _amount_max;
    global.quest_kill_faction[_quest_id][i] = argument[3];
    global.quest_kill_map[_quest_id][i] = argument[4];
    var _arr_obj_to_kill = argument[5];
    
    if (!is_array(_arr_obj_to_kill))
    {
        trace_error("scr_quest_create_kill() not given an array of NPCs");
        _arr_obj_to_kill = [_arr_obj_to_kill];
    }
    
    global.quest_kill_arr_obj[_quest_id][i] = _arr_obj_to_kill;
}

if (can_finish)
{
    var _count = 0;
    var _x = x;
    var _y = y;
    
    with (obj_enemy_ghoul)
    {
        if (point_distance(x, y, _x, _y) < 160)
            _count++;
    }
    
    if (_count == 0)
    {
        if (quest_done == false)
        {
            with (obj_green_quest_swamp_leader)
                scr_draw_npc_text(id, UnknownEnum.Value_111);
            
            var o = obj_controller;
            var quest_amount = 30;
            
            for (var j = 0; j < quest_amount; j++)
            {
                var quest_id_ = global.quest_state[j].id;
                
                if (quest_id_ == "clear_swamp")
                {
                    global.quest_state[j].amount_now[0] = 1;
                    obj_controller.alarm[1] = 1;
                }
            }
            
            quest_done = true;
        }
    }
}

enum UnknownEnum
{
    Value_111 = 111
}

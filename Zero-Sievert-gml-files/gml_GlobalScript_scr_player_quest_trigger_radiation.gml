function scr_player_quest_trigger_radiation()
{
    if (global.status_state_now[UnknownEnum.Value_3] == UnknownEnum.Value_3)
    {
        var o = obj_controller;
        var quest_amount = 30;
        
        for (var j = 0; j < quest_amount; j++)
        {
            var quest_id_ = global.quest_state[j].id;
            
            if (quest_id_ == "radiation_effect")
            {
                global.quest_state[j].amount_now[0] = 1;
                obj_controller.alarm[1] = 1;
            }
        }
    }
}

enum UnknownEnum
{
    Value_3 = 3
}

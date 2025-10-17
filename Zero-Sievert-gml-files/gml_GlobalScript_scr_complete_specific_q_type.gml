function scr_complete_specific_q_type(arg0, arg1)
{
    var _quest_id = arg0;
    var _quest_type = arg1;
    var i_have_the_quest = false;
    
    for (var i = 0; i < 30; i++)
    {
        if (global.quest_state[i].id == _quest_id)
        {
            for (var j = 0; j < array_length(variable_struct_get(global.quest_database, _quest_id).objective); j++)
            {
                if (variable_struct_get(global.quest_database, _quest_id).objective[j].type == _quest_type)
                {
                    if (global.quest_state[i].amount_now[j] < variable_struct_get(global.quest_database, _quest_id).objective[j].amount_max)
                    {
                        global.quest_state[i].amount_now[j] = 1;
                        obj_controller.alarm[1] = 1;
                    }
                }
            }
        }
    }
}

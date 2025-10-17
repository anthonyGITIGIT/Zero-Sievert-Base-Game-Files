player_follow_local();
alpha += (alpha_amount * alpha_factor);
alpha = clamp(alpha, 0, 1);

if (alpha >= 0.7 && alpha <= 0.99)
    alarm[0] = 120;

if (alpha_factor == -1 && alpha <= 0.01)
{
    var o = obj_controller;
    
    for (var i = 0; i < 30; i++)
    {
        var _quest_id = global.quest_state[i].id;
        
        if (_quest_id != "")
        {
            if (_quest_id == "the_crystal")
            {
                global.quest_state[i].amount_now[0] = variable_struct_get(global.quest_database, _quest_id).objective[0].amount_max;
                obj_controller.alarm[1] = 1;
            }
        }
    }
    
    scr_draw_npc_text(player_get_local(), UnknownEnum.Value_99);
    instance_destroy();
}

enum UnknownEnum
{
    Value_99 = 99
}

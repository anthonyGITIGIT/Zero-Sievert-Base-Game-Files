player_follow_local();
alpha += (alpha_amount * alpha_factor);
alpha = clamp(alpha, 0, 1);

if (alpha >= 0.7 && alpha <= 0.99)
    alarm[0] = 60;

if (alpha_factor == 1 && alpha >= 0.99)
{
    if (hud_type == UnknownEnum.Value_1)
    {
        player_get_local().x = 4222;
        player_get_local().y = 448;
        
        if (instance_exists(obj_fog_setup))
            obj_fog_setup.alarm[0] = 3;
        
        if (instance_exists(obj_camera))
            obj_camera.alarm[1] = 1;
        
        if (instance_exists(obj_controller))
        {
            obj_controller.can_pause = true;
            obj_controller.alarm[4] = 2;
        }
        
        global.quest_outer_deity_sound = false;
        
        for (var i = 0; i < 30; i++)
        {
            var _quest_id = global.quest_state[i].id;
            
            if (_quest_id != "")
            {
                if (_quest_id == "outer_deity")
                {
                    global.quest_state[i].amount_now[0] = variable_struct_get(global.quest_database, _quest_id).objective[0].amount_max;
                    obj_controller.alarm[1] = 1;
                }
            }
        }
    }
    
    instance_destroy();
}

enum UnknownEnum
{
    Value_1 = 1
}

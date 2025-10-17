function scr_player_quest_trigger_end_game()
{
    if (instance_exists(obj_quest_end_game))
    {
        var _x = obj_quest_end_game.x;
        var _y = obj_quest_end_game.y;
        
        if (point_distance(x, y, _x, _y) < 96 && global.end_game_done_test == false)
        {
            action = true;
            player_set_local_state(scr_player_state_dummy);
            obj_camera.follow = UnknownEnum.Value_6;
            hspd = 0;
            vsdp = 0;
            arms_holder = undefined;
            weapon_holder.is_visible = false;
            
            with (torch_holder)
                instance_destroy();
            
            torch_holder = -4;
            global.night_vision = false;
            obj_quest_end_game.alarm[0] = 60;
            global.end_game_done_test = true;
        }
    }
}

enum UnknownEnum
{
    Value_6 = 6
}

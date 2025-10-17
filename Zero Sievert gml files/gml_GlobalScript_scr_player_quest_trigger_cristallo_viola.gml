function scr_player_quest_trigger_cristallo_viola()
{
    if (instance_exists(obj_cristallo_viola))
    {
        if (quest_is_active("the_crystal"))
        {
            var _x = obj_cristallo_viola.x;
            var _y = obj_cristallo_viola.y;
            
            if (point_distance(x, y, _x, _y) < global.cristallo_viola_start_dis)
            {
                action = true;
                audio_play_sound(snd_cristallo_viola, 10, false);
                scr_draw_npc_text(id, UnknownEnum.Value_94);
                player_set_local_state(scr_player_state_cristallo_viola);
                obj_camera.follow = UnknownEnum.Value_4;
                hspd = 0;
                vsdp = 0;
                arms_holder = undefined;
            }
        }
    }
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_94 = 94
}

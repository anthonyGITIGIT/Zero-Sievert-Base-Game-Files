function scr_enemy_crow_check_if_escape()
{
    target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id));
    
    if (target != -4)
    {
        hspd = 0;
        vspd = 0;
        var range = 500;
        var dir = irandom_range(45, 135);
        move_point_x = x + lengthdir_x(range, dir);
        move_point_y = y + lengthdir_y(range, dir);
        state = "crow_escape";
        var ss = choose(snd_bird_fly1, snd_bird_fly2, snd_bird_fly3, snd_bird_fly4, snd_bird_fly5);
        audio_play_sound_on(emitter_talk, ss, false, 10);
    }
}

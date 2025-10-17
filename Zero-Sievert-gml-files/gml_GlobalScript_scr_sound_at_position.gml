function scr_sound_at_position(arg0, arg1, arg2, arg3)
{
    if (player_exists_local())
        exit;
    
    var dis = player_distance_local(x, y);
    var dis_max = arg2;
    var dis_min = arg3;
    dis = clamp(dis, dis_min, dis_max);
    var gain = lerp(0, 1, dis / dis_max);
    gain = 1 - gain;
    var gain_snd = audio_sound_get_gain(arg0);
    var sound = audio_play_sound(arg0, 15, arg1);
    audio_sound_gain(sound, gain * gain_snd, 1);
    audio_play_sound(sound, 15, arg1);
}

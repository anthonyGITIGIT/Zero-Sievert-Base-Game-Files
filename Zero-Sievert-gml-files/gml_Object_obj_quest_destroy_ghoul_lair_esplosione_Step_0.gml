if (show_explosion)
{
    visible = true;
    sprite_index = s_vuoto;
    var o = obj_particles_controller;
    var a = UnknownEnum.Value_43;
    part_particles_create(o.particles_system[a], x, y, o.particles_type[a], 4);
    
    if (!audio_is_playing(snd_explosion_1))
        audio_play_sound(snd_explosion_1, 14, false);
    
    if (player_distance_local(x, y) < 128)
    {
        player_damage_local(infinity);
        scr_camera_shake(3, irandom(360));
    }
}
else
{
    visible = false;
}

enum UnknownEnum
{
    Value_43 = 43
}

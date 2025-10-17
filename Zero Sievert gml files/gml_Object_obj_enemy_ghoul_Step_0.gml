event_inherited();

if (state == npc_get_state_alert(npc_id))
{
    if (scr_chance(1/3))
    {
        var sound = choose(snd_ghoul_1, snd_ghoul_2, snd_ghoul_3, snd_ghoul_4);
        audio_play_sound_on(emitter_talk, sound, false, 5);
    }
}

if (ghoul_buffed_timer > 0)
{
    if ((ghoul_buffed_timer % 5) == 0)
    {
        var a = UnknownEnum.Value_61;
        var _o = obj_particles_controller;
        part_particles_create(_o.particles_system[a], x + (image_xscale * 7), y - 2, _o.particles_type[a], 1);
    }
}

enum UnknownEnum
{
    Value_61 = 61
}

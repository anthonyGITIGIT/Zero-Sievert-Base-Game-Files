event_inherited();

if (state == npc_get_state_alert(npc_id))
{
    if (scr_chance(1/3))
    {
        var sound = choose(snd_ghoul_1, snd_ghoul_2, snd_ghoul_3, snd_ghoul_4);
        audio_play_sound_on(emitter_talk, sound, false, 5);
    }
}

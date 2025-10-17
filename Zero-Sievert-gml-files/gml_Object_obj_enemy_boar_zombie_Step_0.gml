event_inherited();

if (state == npc_get_state_alert(npc_id))
{
    if (scr_chance(0.8333333333333334))
    {
        var sound = choose(snd_boar2, snd_boar3, snd_boar4, snd_boar5, snd_boar6);
        audio_play_sound_on(emitter_talk, sound, false, 5);
    }
}

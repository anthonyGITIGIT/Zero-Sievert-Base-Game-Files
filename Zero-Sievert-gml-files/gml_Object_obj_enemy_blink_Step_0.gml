event_inherited();

if (state == npc_get_state_alert(npc_id))
{
    if (scr_chance(1/3))
    {
        var sound = choose(snd_blink_1, snd_blink_2, snd_blink_3);
        audio_play_sound_on(emitter_talk, sound, false, 5);
    }
}

event_inherited();

if (state == npc_get_state_alert(npc_id))
{
    if (scr_chance(0.6172839506172839))
    {
        var sound = choose(snd_wolf_bark1, snd_wolf_bark2, snd_wolf_bark4, snd_wolf_bark6, snd_wolf_bark7, snd_wolf_breathing, snd_wolf_breathing, snd_wolf_breathing);
        audio_play_sound_on(emitter_talk, sound, false, 5);
    }
}

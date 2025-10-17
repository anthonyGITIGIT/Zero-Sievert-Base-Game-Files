event_inherited();

if (state == npc_get_state_alert(npc_id) || state == "boar_carica")
{
    var _chance = 0.8333333333333334;
    
    if (state == "boar_carica")
        _chance = 1.6666666666666667;
    
    if (scr_chance(_chance))
    {
        var sound = choose(snd_boar2, snd_boar3, snd_boar4, snd_boar5, snd_boar6);
        audio_play_sound_on(emitter_talk, sound, false, 5);
    }
    
    sound_attack_timer++;
    
    if (sound_attack_timer >= sound_attack_timer_max)
    {
        var sound = choose(snd_boar2, snd_boar3, snd_boar4, snd_boar5, snd_boar6);
        audio_play_sound_on(emitter_talk, sound, false, 5);
        sound_attack_timer_max = irandom_range(60, 110);
        sound_attack_timer = 0;
    }
}

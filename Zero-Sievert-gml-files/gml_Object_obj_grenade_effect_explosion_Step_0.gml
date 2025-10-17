audio_emitter_position(emitter_explosion, x, y, 0);
ricochet_counter++;

if (ricochet_counter < ricochet_counter_max)
{
    if (scr_chance(15))
    {
        var _sound = choose(snd_bullet_ricochet_1, snd_bullet_ricochet_2, snd_bullet_ricochet_3, snd_bullet_ricochet_4);
        audio_play_sound_on(emitter_explosion, _sound, false, 15, random_range(0.7, 1), 0, random_range(0.7, 1.2));
    }
}

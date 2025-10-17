alarm[0] = 180;
emitter_explosion = audio_emitter_create();
audio_emitter_falloff(emitter_explosion, 200, 500, 1);
audio_play_sound_on(emitter_explosion, snd_grenade_explosion_1, false, 20, 0.5);
audio_play_sound_on(emitter_explosion, snd_grenade_christmas_2, false, 20, 1);
scr_create_particle(UnknownEnum.Value_65, 40);
scr_create_particle(UnknownEnum.Value_66, 20);
scr_create_particle(UnknownEnum.Value_51, 4);
ricochet_counter_max = 60;
ricochet_counter = 0;

enum UnknownEnum
{
    Value_51 = 51,
    Value_65 = 65,
    Value_66
}

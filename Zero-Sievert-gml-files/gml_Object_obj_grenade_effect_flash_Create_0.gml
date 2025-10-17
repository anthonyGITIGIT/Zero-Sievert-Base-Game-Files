alarm[0] = 180;
emitter_explosion = audio_emitter_create();
audio_emitter_falloff(emitter_explosion, 200, 500, 1);
audio_emitter_position(emitter_explosion, x, y, 0);
audio_play_sound_on(emitter_explosion, snd_grenade_flashbang_1, false, 20);
scr_create_particle(UnknownEnum.Value_53, 10);
scr_create_particle(UnknownEnum.Value_54, 4);
scr_create_particle(UnknownEnum.Value_55, 4);

enum UnknownEnum
{
    Value_53 = 53,
    Value_54,
    Value_55
}

alarm[0] = 180;
emitter_explosion = audio_emitter_create();
audio_emitter_falloff(emitter_explosion, 200, 500, 1);
audio_emitter_position(emitter_explosion, x, y, 0);
emitter_loop = audio_emitter_create();
audio_emitter_falloff(emitter_loop, 100, 300, 1);
audio_emitter_position(emitter_loop, x, y, 0);
audio_play_sound_on(emitter_explosion, snd_grenade_flashbang_1, false, 20);
audio_play_sound_on(emitter_loop, snd_grenade_smoke_1, false, 20);
scr_create_particle(UnknownEnum.Value_56, 2);
alarm[1] = 15;

enum UnknownEnum
{
    Value_56 = 56
}

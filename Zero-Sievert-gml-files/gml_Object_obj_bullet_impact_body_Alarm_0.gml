audio_emitter_position(my_emitter, x, y, 0);
audio_emitter_falloff(my_emitter, 64, 240, 1);
sound_impact = choose(snd_bullet_impact_body_1, snd_bullet_impact_body_2, snd_bullet_impact_body_3, snd_bullet_impact_body_4, snd_bullet_impact_body_5);
audio_play_sound_on(my_emitter, sound_impact, false, 15);
var _durata = round((audio_sound_length(sound_impact) * 60) + 1);
alarm[1] = _durata;

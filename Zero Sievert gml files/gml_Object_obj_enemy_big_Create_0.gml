event_inherited();
npc_setup("big");
timer_ruggito = 0;
timer_ruggito_max = 0;
audio_emitter_falloff(emitter_walk, 96, 200, 1);
audio_play_sound_on(emitter_talk, snd_big_breathing, true, 5);

audio_emitter_free(sound_emitter_wind);
audio_emitter_free(sound_emitter_bird_stream);

if (ds_exists(grid_footstep, ds_type_grid))
    ds_grid_destroy(grid_footstep);

audio_stop_all();

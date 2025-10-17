event_inherited();
timer += (damage / 10);
timer = clamp(timer, 0, 5);

if (!audio_near_created && player_exists_local() && shooter_faction != player_get_local().faction && player_distance_local(x, y) < 25)
{
    audio_near_created = true;
    var i_max = array_length_1d(obj_sound_controller.bullet_hit_near);
    var i = irandom(i_max);
    i = clamp(i, 0, i_max - 1);
    var emitter = audio_emitter_create();
    audio_emitter_position(emitter, x, y, 0);
    audio_emitter_falloff(emitter, 0, 40, 1);
    audio_play_sound_on(emitter, obj_sound_controller.bullet_hit_near[i], false, 2);
}

audio_listener_position(x, y, 0);
audio_emitter_position(emitter_shoot, x, y, 0);
audio_emitter_position(emitter_walk, x, y, 0);
depth = -bbox_bottom;
weapon_holder.func_end_step();

if (arms_holder != undefined)
    arms_holder.func_step();

if (hovering_enemy)
    hovering_enemy_frames++;
else
    hovering_enemy_frames = 0;

if (shooting_triggered)
    shooting_frames++;
else
    shooting_frames = 0;

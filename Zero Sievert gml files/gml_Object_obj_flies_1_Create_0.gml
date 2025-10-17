event_inherited();
need_to_check = false;
decor_id = UnknownEnum.Value_561;
alarm[10] = 10;
emitter_sound = audio_emitter_create();
audio_emitter_position(emitter_sound, x, y, 0);
sound_flies = snd_flies;
audio_emitter_falloff(emitter_sound, 8, 64, 1);
particles_system = part_system_create();
partciles_emitter = part_emitter_create(particles_system);
particles_type = part_type_create();
part_system_depth(particles_system, -15910);
part_type_sprite(particles_type, s_particle_flies, false, false, true);
part_type_speed(particles_type, 0.1, 0.25, 0, 0.5);
part_type_direction(particles_type, 0, 360, 0, 90);
part_type_life(particles_type, 60, 80);
part_type_size(particles_type, 0.5, 1, 0, 0.2);
part_type_orientation(particles_type, 0, 360, 0, 30, 0);
part_type_alpha2(particles_type, 1, 0.6);
part_type_blend(particles_type, false);
particle_amount = 1;

enum UnknownEnum
{
    Value_561 = 561
}

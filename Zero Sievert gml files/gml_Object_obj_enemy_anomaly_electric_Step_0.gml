event_inherited();

if (instance_exists(obj_particles_controller))
{
    var a = UnknownEnum.Value_8;
    var ob = obj_particles_controller;
    var rr = 8;
    part_emitter_region(ob.particles_system[a], ob.partciles_emitter[a], x - rr, x + rr, y - rr, y + rr, 0, 1);
    part_emitter_burst(ob.particles_system[a], ob.partciles_emitter[a], ob.particles_type[a], ob.particle_amount[a]);
    a = UnknownEnum.Value_9;
    ob = obj_particles_controller;
    rr = 20;
    part_emitter_region(ob.particles_system[a], ob.partciles_emitter[a], x - rr, x + rr, y - rr, y + rr, 0, 1);
    part_emitter_burst(ob.particles_system[a], ob.partciles_emitter[a], ob.particles_type[a], ob.particle_amount[a]);
}

if (!audio_is_playing(snd_poltergeist))
    audio_play_sound_on(emitter_talk, snd_poltergeist, false, 10);

sprite_index = s_vuoto;

enum UnknownEnum
{
    Value_8 = 8,
    Value_9
}

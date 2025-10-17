for (var i = 0; i < array_length_1d(particles_system); i++)
{
    part_system_destroy(particles_system[i]);
    
    if (part_emitter_exists(particles_system[i], partciles_emitter[i]))
        part_emitter_destroy_all(partciles_emitter[i]);
}

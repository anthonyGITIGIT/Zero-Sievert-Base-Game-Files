if (instance_exists(obj_particles_controller))
{
    var a = UnknownEnum.Value_57;
    var ob = obj_particles_controller;
    var rr = 48;
    part_emitter_region(ob.particles_system[a], ob.partciles_emitter[a], x - (rr / 2), x + (rr / 2), y - rr, y + rr, 2, 1);
    part_emitter_burst(ob.particles_system[a], ob.partciles_emitter[a], ob.particles_type[a], ob.particle_amount[a]);
}

enum UnknownEnum
{
    Value_57 = 57
}

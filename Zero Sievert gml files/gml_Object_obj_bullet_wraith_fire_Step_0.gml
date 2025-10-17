event_inherited();
var a = UnknownEnum.Value_24;
var ob = obj_particles_controller;
var rr = 0;
part_emitter_region(ob.particles_system[a], ob.partciles_emitter[a], x - rr, x + rr, y - rr, y + rr, 1, 1);
part_emitter_burst(ob.particles_system[a], ob.partciles_emitter[a], ob.particles_type[a], ob.particle_amount[a]);

enum UnknownEnum
{
    Value_24 = 24
}

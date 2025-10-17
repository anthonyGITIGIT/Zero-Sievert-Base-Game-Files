timer_volo++;

if (timer_volo > 90)
    instance_destroy();

event_inherited();
var a = UnknownEnum.Value_26;
var c = obj_particles_controller;

if (instance_exists(c))
    part_particles_create(c.particles_system[a], x, y, c.particles_type[a], 1);

enum UnknownEnum
{
    Value_26 = 26
}

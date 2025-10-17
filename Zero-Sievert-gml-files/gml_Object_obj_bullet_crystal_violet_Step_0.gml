timer_volo++;

if (timer_volo > 600)
    instance_destroy();

if (instance_exists(target))
{
    var _angle = point_direction(x, y, target.x, target.y);
    var _my_angle = point_direction(x, y, x + hspd, y + vspd);
    var _diff = angle_difference(_angle, _my_angle);
    var _new_angle = _my_angle + 360 + (_diff * 0.025);
    var _spd = 2.5;
    _spd = clamp(_spd, 2, 4);
    hspd = lengthdir_x(_spd, _new_angle);
    vspd = lengthdir_y(_spd, _new_angle);
    image_angle = _new_angle;
}

event_inherited();
var a = UnknownEnum.Value_58;
var c = obj_particles_controller;

if (instance_exists(c))
    part_particles_create(c.particles_system[a], x, y, c.particles_type[a], 1);

enum UnknownEnum
{
    Value_58 = 58
}

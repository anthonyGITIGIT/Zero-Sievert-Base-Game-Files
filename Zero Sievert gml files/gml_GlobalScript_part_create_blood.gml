function part_create_blood(arg0, arg1, arg2)
{
    var a = UnknownEnum.Value_0;
    var _amount = arg2;
    
    repeat (_amount)
    {
        var _blood = instance_create_depth(x, y, -y, obj_blood);
        _blood.spd = random_range(1, 4);
        _blood.min_dir = arg0;
        _blood.max_dir = arg1;
        _blood.image_index = irandom(sprite_get_number(s_blood));
    }
    
    a = UnknownEnum.Value_1;
    part_particles_create(obj_particles_controller.particles_system[a], x, y, obj_particles_controller.particles_type[a], 1);
}

enum UnknownEnum
{
    Value_0,
    Value_1
}

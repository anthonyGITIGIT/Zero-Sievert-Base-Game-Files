if (!quest_is_complete("machinery"))
{
    var _w = 6;
    var _h = 76;
    
    if (instance_exists(obj_particles_controller))
    {
        var a = UnknownEnum.Value_59;
        var ob = obj_particles_controller;
        part_emitter_region(ob.particles_system[a], ob.partciles_emitter[a], (x - _w) + 1, x + _w + 1, y - 15, y + _h, 2, 0);
        part_emitter_burst(ob.particles_system[a], ob.partciles_emitter[a], ob.particles_type[a], 5);
    }
    
    if (instance_exists(player_get_local()))
    {
        var _x = player_get_local().x;
        var _y = player_get_local().y;
        
        if (point_in_rectangle(_x, _y, x - (_w / 2), y - 15, x + (_w / 2), y + _h))
            player_damage_local(999);
    }
}

enum UnknownEnum
{
    Value_59 = 59
}

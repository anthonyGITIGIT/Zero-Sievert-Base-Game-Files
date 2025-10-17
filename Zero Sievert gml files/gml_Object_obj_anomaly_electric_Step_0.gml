with (obj_player_parent)
{
    with (other)
    {
        if (place_meeting(x, y, other.id))
        {
            active = true;
            alarm[10] = 5;
            
            if (player_get_local() == other.id)
                scr_anomaly_damage(damage);
        }
    }
}

if (place_meeting(x, y, obj_npc_parent))
{
    active = true;
    alarm[10] = 5;
    var quale_id = instance_place(x, y, obj_npc_parent);
    quale_id.hp -= 0.25;
}

if (place_meeting(x, y, obj_bolt))
{
    active = true;
    alarm[10] = 30;
}

if (scr_chance(100))
{
    var a = UnknownEnum.Value_20;
    var c = obj_particles_controller;
    part_emitter_region(c.particles_system[a], c.partciles_emitter[a], x - 4, x + 4, y - 0, y + 0, 1, 1);
    part_emitter_burst(c.particles_system[a], c.partciles_emitter[a], c.particles_type[a], c.particle_amount[a]);
}

enum UnknownEnum
{
    Value_20 = 20
}

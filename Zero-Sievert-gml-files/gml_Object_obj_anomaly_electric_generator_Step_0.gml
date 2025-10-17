if (scr_chance(100))
{
    if (instance_exists(obj_particles_controller))
    {
        var d = 10;
        var a = UnknownEnum.Value_20;
        var c = obj_particles_controller;
        part_emitter_region(c.particles_system[a], c.partciles_emitter[a], x - d, x + d, y - d, y + d, 1, 1);
        part_emitter_burst(c.particles_system[a], c.partciles_emitter[a], c.particles_type[a], c.particle_amount[a]);
    }
}

var normal_spark = 80;
var _dam = damage;

with (obj_player_parent)
{
    if (point_distance(other.x, other.y, x, y) < 112)
    {
        normal_spark = 4;
        
        if (scr_chance(35))
        {
            var dis_ = point_distance(x, y, other.x, other.y) + irandom_range(-4, 10);
            var dir_ = point_direction(x, y, other.x, other.y);
            scr_create_spark(dis_, dir_);
            
            if (player_get_local() == id)
                scr_anomaly_damage(_dam);
            
            scr_sound_at_position(snd_electric_spark, false, 96, 16);
            instance_create_depth(x, y, 0, obj_hud_get_hit);
            hit_shader = "BULLET_HIT_SHADER_NORMAL";
            alarm[3] = 3;
        }
    }
}

if (instance_exists(obj_npc_parent))
{
    var near = instance_nearest(x, y, obj_npc_parent);
    
    if (point_distance(near.x, near.y, x, y) < 112)
    {
        normal_spark = 4;
        
        if (scr_chance(35))
        {
            var dis_ = point_distance(near.x, near.y, x, y) + irandom_range(-4, 10);
            var dir_ = point_direction(x, y, near.x, near.y);
            scr_create_spark(dis_, dir_);
            
            with (near)
            {
                hp -= 0.6;
                scr_sound_at_position(snd_electric_spark, false, 96, 16);
            }
        }
    }
}

if (scr_chance(normal_spark))
{
    if (scr_chance(70))
    {
        var cc = choose(snd_electric_spark3, snd_electric_spark2);
        scr_sound_at_position(cc, false, 380, 96);
    }
    
    var dis_ = irandom(96) + 32;
    var dir_ = irandom(360);
    scr_create_spark(dis_, dir_);
}

enum UnknownEnum
{
    Value_20 = 20
}

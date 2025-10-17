if (instance_exists(obj_particles_controller))
{
    var ob = obj_particles_controller;
    timer_effect_1++;
    
    if (timer_effect_1 >= timer_effect_1_max)
    {
        timer_effect_1 = 0;
        var a = UnknownEnum.Value_62;
        part_emitter_region(ob.particles_system[a], ob.partciles_emitter[a], x, x, y, y, 0, 0);
        part_emitter_burst(ob.particles_system[a], ob.partciles_emitter[a], ob.particles_type[a], 2);
    }
    
    timer_effect_2++;
    
    if (timer_effect_2 >= timer_effect_2_max)
    {
        timer_effect_2 = 0;
        var a = UnknownEnum.Value_63;
        var _r = 2;
        part_emitter_region(ob.particles_system[a], ob.partciles_emitter[a], x - _r, x + _r, y - _r, y + _r, 0, 0);
        part_emitter_burst(ob.particles_system[a], ob.partciles_emitter[a], ob.particles_type[a], 1);
    }
    
    timer_effect_3++;
    
    if (timer_effect_3 >= timer_effect_2_max)
    {
        timer_effect_3 = 0;
        var a = UnknownEnum.Value_64;
        var _r = 2;
        part_emitter_region(ob.particles_system[a], ob.partciles_emitter[a], x - _r, x + _r, y - _r, y + _r, 0, 0);
        part_emitter_burst(ob.particles_system[a], ob.partciles_emitter[a], ob.particles_type[a], 1);
    }
}

if (instance_exists(obj_npc_draw_text))
{
    if (obj_npc_draw_text.text_id == UnknownEnum.Value_223 || obj_npc_draw_text.text_id == UnknownEnum.Value_230)
        alarm[1] = 30;
}

if (instance_exists(obj_npc_draw_text))
{
    if (obj_npc_draw_text.text_id == UnknownEnum.Value_238 || obj_npc_draw_text.text_id == UnknownEnum.Value_260)
        alarm[2] = 30;
}

enum UnknownEnum
{
    Value_62 = 62,
    Value_63,
    Value_64,
    Value_223 = 223,
    Value_230 = 230,
    Value_238 = 238,
    Value_260 = 260
}

if (!instance_exists(linked_id))
{
    instance_destroy();
}
else
{
    image_xscale = linked_id.image_xscale;
    depth = linked_id.depth - 2;
    
    if (linked_id.human_state_now != UnknownEnum.Value_4)
    {
        instance_destroy();
        linked_id.draw_weapon = true;
    }
}

if (image_index > 7 && image_index < 12)
{
    if (instance_line_of_sight(x, y, player_get_local()))
    {
        var a = UnknownEnum.Value_41;
        var ob = obj_particles_controller;
        
        if (image_xscale == 1)
            part_type_direction(ob.particles_type[a], -10, 10, 0, 0);
        else
            part_type_direction(ob.particles_type[a], 170, 190, 0, 0);
        
        part_emitter_region(ob.particles_system[a], ob.partciles_emitter[a], x + (2 * image_xscale), x + (2 * image_xscale), y + 2, y + 2, 0, 1);
        part_emitter_burst(ob.particles_system[a], ob.partciles_emitter[a], ob.particles_type[a], 1);
    }
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_41 = 41
}

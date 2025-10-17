if (instance_exists(obj_map_generator))
{
    var o = obj_map_generator;
    
    if (o.can_draw_surface_snow)
    {
        if (!surface_exists(surface_snow))
        {
            surface_snow = surface_create(room_width, o.map_height);
            surface_set_target(surface_snow);
            draw_clear_alpha(c_black, 0);
            
            for (var yy = 1; yy < (o.grid_tile_w - 1); yy++)
            {
                for (var xx = 1; xx < (o.grid_tile_h - 1); xx++)
                {
                    var newx = xx * 16;
                    var newy = yy * 16;
                    
                    if (ds_grid_get(o.grid_snow, xx, yy) == true)
                    {
                        if (scr_chance(30))
                            draw_sprite(s_floor_snow_2, 0, newx, newy);
                        else if (scr_chance(30))
                            draw_sprite(s_floor_snow_3, 0, newx, newy);
                        else if (scr_chance(5))
                            draw_sprite(s_floor_snow_4, 0, newx, newy);
                        else
                            draw_sprite(s_floor_snow_1, 0, newx, newy);
                    }
                }
            }
            
            surface_reset_target();
            trace("Surface Snow created");
        }
        
        draw_surface_part(surface_snow, x - 480, y - 270, 960, 540, x - 480, y - 270);
    }
}

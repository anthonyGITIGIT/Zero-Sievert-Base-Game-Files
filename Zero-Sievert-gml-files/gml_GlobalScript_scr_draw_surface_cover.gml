function scr_draw_surface_cover()
{
    if (is_in_raid())
    {
        var surf_a = 0.5;
        
        if (global.quest_unique_done[UnknownEnum.Value_170] == true)
            surf_a = 0.2;
        
        var surf_w = (room_width div 16) * 1;
        var surf_h = (room_height div 16) * 1;
        
        if (!surface_exists(obj_minimap.surface_cover))
            obj_minimap.surface_cover = surface_create(surf_w, surf_h);
        
        surface_set_target(obj_minimap.surface_cover);
        draw_clear_alpha(c_black, 0);
        var o = obj_map_generator;
        
        for (var xx = 0; xx < o.grid_tile_w; xx++)
        {
            for (var yy = 0; yy < o.grid_tile_h; yy++)
            {
                if (ds_grid_get(obj_minimap.grid_surface_cover, xx, yy) == false)
                    draw_sprite_ext(s_minimap_floor_wall, 0, xx * 1, yy * 1, 1, 1, 0, #1A1A1A, surf_a);
            }
        }
        
        surface_reset_target();
    }
}

enum UnknownEnum
{
    Value_170 = 170
}

var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);

if (is_in_raid())
{
    var cell_w = obj_map_generator.grid_tile_w;
    var cell_h = obj_map_generator.grid_tile_h;
    var sx = 240 - (cell_w / 2);
    var sy = 135 - (cell_h / 2);
    
    if (start_drawing_surface == true)
    {
        if (!surface_exists(surface_map))
        {
            var _off = 48;
            var surf_w = (cell_w * 1) + _off;
            var surf_h = (cell_h * 1) + _off;
            surface_map = surface_create(surf_w, surf_h);
            surface_set_target(surface_map);
            draw_clear_alpha(#1A1A1A, 1);
            
            for (var yy = 1; yy < (cell_w - 1); yy++)
            {
                for (var xx = 1; xx < (cell_h - 1); xx++)
                {
                    var posx = sx + xx;
                    var posy = sy + yy;
                    
                    if (ds_grid_get(obj_map_generator.grid_tile, xx, yy) == -1)
                    {
                        var cc = 16777215;
                        
                        if (obj_map_generator.area_tileset_floor_box[obj_map_generator.area] == 1)
                            cc = 5345873;
                        
                        if (obj_map_generator.area_tileset_floor_box[obj_map_generator.area] == 2)
                            cc = 5345873;
                        
                        if (obj_map_generator.area_tileset_floor_box[obj_map_generator.area] == 6)
                            cc = 5345873;
                        
                        if (obj_map_generator.area_tileset_floor_box[obj_map_generator.area] == 4)
                            cc = 7581644;
                        
                        scr_draw_minimap_pixel(s_minimap_floor_wall, xx, yy, cc);
                    }
                }
            }
            
            for (var yy = 1; yy < (cell_w - 1); yy++)
            {
                for (var xx = 1; xx < (cell_h - 1); xx++)
                {
                    var posx = xx;
                    var posy = yy;
                    var cc = 16777215;
                    var floor_2 = ds_grid_get(obj_map_generator.grid_floor2, xx, yy);
                    
                    switch (floor_2)
                    {
                        case 0:
                            cc = 4608871;
                            break;
                        
                        case 6:
                            cc = 4608871;
                            break;
                        
                        case 4:
                            cc = 4608871;
                            break;
                        
                        case 1:
                            cc = 7960175;
                            break;
                        
                        case 7:
                            cc = 3570616;
                            break;
                    }
                    
                    if (cc != 16777215)
                        scr_draw_minimap_pixel(s_minimap_floor_wall, posx, posy, cc);
                }
            }
            
            for (var yy = 1; yy < (cell_w - 1); yy++)
            {
                for (var xx = 1; xx < (cell_h - 1); xx++)
                {
                    if (ds_grid_get(obj_map_generator.grid_water, xx, yy) == -1)
                        scr_draw_minimap_pixel(s_minimap_floor_wall, xx, yy, 14803014);
                }
            }
            
            var road_w = obj_map_generator.grid_strada_w;
            var road_h = obj_map_generator.grid_strada_h;
            
            for (var yy = 1; yy < (road_w - 1); yy++)
            {
                for (var xx = 1; xx < (road_h - 1); xx++)
                {
                    if (ds_grid_get(obj_map_generator.grid_strada, xx, yy) == true)
                    {
                        var posx = xx * 6;
                        var posy = yy * 6;
                        draw_sprite_ext(s_minimap_floor_wall, 0, posx * 1, posy * 1, 6, 6, 0, #34373A, 1);
                    }
                }
            }
            
            if (obj_map_generator.area != UnknownEnum.Value_4)
            {
                var map_w = obj_map_generator.grid_map_w;
                var map_h = obj_map_generator.grid_map_h;
                
                for (var yy = 0; yy < map_w; yy++)
                {
                    for (var xx = 0; xx < map_h; xx++)
                    {
                        if (ds_grid_get(obj_map_generator.grid_map, xx, yy) == -7)
                            draw_sprite_ext(s_minimap_floor_wall, 0, xx * 2 * 1, yy * 2 * 1, 2, 2, 0, #1A1A1A, 1);
                    }
                }
            }
            
            surface_reset_target();
            trace("Surface map created");
        }
    }
}

enum UnknownEnum
{
    Value_4 = 4
}

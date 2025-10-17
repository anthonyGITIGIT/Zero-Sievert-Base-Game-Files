function scr_generate_snow_grid()
{
    var _snow_accumulation = weather_get_snow_accumulation();
    var _tilemap_wall = obj_map_generator.layer_tileset_wall_below_indoor;
    var _tilemap_floor_detail = obj_map_generator.layer_floor_detail;
    
    for (var yy = 1; yy < (grid_tile_w - 1); yy++)
    {
        for (var xx = 1; xx < (grid_tile_h - 1); xx++)
        {
            if (scr_chance(6 * _snow_accumulation))
            {
                var grandezza = round((irandom(3) + 3) * (0.5 + (_snow_accumulation / 2)));
                
                if (ds_grid_get(grid_strada, xx div 6, yy div 6) == true)
                {
                    if (scr_chance(75))
                        grandezza = 0;
                }
                
                for (var fx = 0; fx < grandezza; fx++)
                {
                    for (var fy = 0; fy < grandezza; fy++)
                    {
                        if (scr_chance(70))
                        {
                            var _newx = xx + fx;
                            var _newy = yy + fy;
                            var g96x = _newx div 6;
                            var g96y = _newx div 6;
                            var _place = false;
                            
                            if (ds_grid_get(grid_water, _newx, _newy) == -7)
                                _place = true;
                            
                            if (ds_grid_get(grid_floor2, _newx, _newy) == 1)
                            {
                                if (scr_chance(50))
                                    _place = false;
                            }
                            
                            if (_place)
                                ds_grid_set(grid_snow, _newx, _newy, true);
                            
                            if (scr_chance(75))
                            {
                                tilemap_set(_tilemap_wall, 0, _newx, _newy);
                                tilemap_set(_tilemap_floor_detail, 0, _newx, _newy);
                            }
                        }
                    }
                }
            }
        }
    }
}

if (is_in_raid())
{
    var o = obj_map_generator;
    var _layer_id = o.layer_tileset_floor_indoor;
    
    for (var xx = 0; xx < o.g_indoor_w; xx++)
    {
        for (var yy = o.grid_tile_h; yy < o.g_indoor_h; yy++)
        {
            var get_cell = tilemap_get(_layer_id, xx, yy);
            
            if (get_cell == 32)
                mp_grid_add_cell(global.grid_move, xx, yy);
        }
    }
}

mp_grid_add_instances(global.grid_move, obj_solid, true);
mp_grid_add_instances(global.grid_move, obj_solid_can_see, true);
mp_grid_to_ds_grid(global.grid_move, grid_motion);

if (is_in_raid())
{
    var o = obj_map_generator;
    
    for (var xx = 0; xx < o.grid_tile_w; xx++)
    {
        for (var yy = 0; yy < o.grid_tile_h; yy++)
        {
            if (ds_grid_get(o.grid_tile, xx, yy) == -7)
            {
                ds_grid_set(grid_motion, xx, yy, -1);
                mp_grid_add_cell(global.grid_move, xx, yy);
            }
        }
    }
}

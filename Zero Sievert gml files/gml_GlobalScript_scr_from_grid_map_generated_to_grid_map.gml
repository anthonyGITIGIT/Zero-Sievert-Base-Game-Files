function scr_from_grid_map_generated_to_grid_map()
{
    for (var xx = 0; xx < grid_map_w; xx++)
    {
        for (var yy = 0; yy < grid_map_h; yy++)
        {
            if (ds_grid_get(grid_map_generated, xx, yy) == true)
                ds_grid_set(grid_map, xx, yy, -1);
        }
    }
}

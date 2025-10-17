function scr_autotiling_water()
{
    if (area == UnknownEnum.Value_1 || area == UnknownEnum.Value_2 || area == UnknownEnum.Value_4)
    {
        for (var xx = 0; xx < grid_tile_w; xx++)
        {
            for (var yy = 0; yy < grid_tile_h; yy++)
            {
                var eccezione_swamp = false;
                
                if (area == UnknownEnum.Value_4)
                {
                    if (xx > swamp_exception_autotiling_water_x && yy < swamp_exception_autotiling_water_y)
                        eccezione_swamp = true;
                }
                
                if (ds_grid_get(grid_water, xx, yy) == -1 && eccezione_swamp == false)
                {
                    ds_grid_set(grid_tile, xx, yy, -7);
                    var cell = tilemap_get(layer_tileset_water, xx, yy);
                    
                    if (cell == 0)
                    {
                        var which_tileset = 0;
                        
                        if (area == UnknownEnum.Value_1 || area == UnknownEnum.Value_2 || area == UnknownEnum.Value_4)
                            which_tileset = 2;
                        
                        var tt = which_tileset * 30;
                        var tile_sopra = ds_grid_get(grid_water, xx, yy - 1) == -1;
                        var tile_sx = ds_grid_get(grid_water, xx - 1, yy) == -1;
                        var tile_dx = ds_grid_get(grid_water, xx + 1, yy) == -1;
                        var tile_sotto = ds_grid_get(grid_water, xx, yy + 1) == -1;
                        var tile_sotto_sx = ds_grid_get(grid_water, xx - 1, yy + 1) == -1;
                        var tile_sotto_dx = ds_grid_get(grid_water, xx + 1, yy + 1) == -1;
                        var tile_sopra_sx = ds_grid_get(grid_water, xx - 1, yy - 1) == -1;
                        var tile_sopra_dx = ds_grid_get(grid_water, xx + 1, yy - 1) == -1;
                        
                        if (tile_sopra && tile_sotto && tile_dx && tile_sx)
                        {
                            tilemap_set(layer_tileset_water, 5 + tt, xx, yy);
                            
                            if (!tile_sopra_dx)
                                tilemap_set(layer_tileset_water, 20 + tt, xx, yy);
                            
                            if (!tile_sopra_sx)
                                tilemap_set(layer_tileset_water, 21 + tt, xx, yy);
                            
                            if (!tile_sotto_dx)
                                tilemap_set(layer_tileset_water, 15 + tt, xx, yy);
                            
                            if (!tile_sotto_sx)
                                tilemap_set(layer_tileset_water, 16 + tt, xx, yy);
                        }
                        
                        if (!tile_sopra && tile_sotto && tile_dx && !tile_sx)
                            tilemap_set(layer_tileset_water, 1 + tt, xx, yy);
                        
                        if (!tile_sopra && tile_sotto && tile_dx && tile_sx)
                            tilemap_set(layer_tileset_water, 2 + tt, xx, yy);
                        
                        if (!tile_sopra && tile_sotto && !tile_dx && tile_sx)
                            tilemap_set(layer_tileset_water, 3 + tt, xx, yy);
                        
                        if (tile_sopra && tile_sotto && tile_dx && !tile_sx)
                            tilemap_set(layer_tileset_water, 6 + tt, xx, yy);
                        
                        if (tile_sopra && tile_sotto && !tile_dx && tile_sx)
                            tilemap_set(layer_tileset_water, 8 + tt, xx, yy);
                        
                        if (tile_sopra && !tile_sotto && tile_dx && !tile_sx)
                            tilemap_set(layer_tileset_water, 11 + tt, xx, yy);
                        
                        if (tile_sopra && !tile_sotto && tile_dx && tile_sx)
                            tilemap_set(layer_tileset_water, 12 + tt, xx, yy);
                        
                        if (tile_sopra && !tile_sotto && !tile_dx && tile_sx)
                            tilemap_set(layer_tileset_water, 13 + tt, xx, yy);
                    }
                }
            }
        }
    }
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_4 = 4
}

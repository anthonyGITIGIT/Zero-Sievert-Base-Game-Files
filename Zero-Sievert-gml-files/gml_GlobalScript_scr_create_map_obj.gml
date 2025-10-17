function scr_create_map_obj(arg0, arg1, arg2, arg3)
{
    var amount = 0;
    var max_ = arg0;
    var raggio_ = arg1;
    
    if (max_ > 0)
    {
        var j = 0;
        
        while (amount < max_)
        {
            j++;
            
            if (j > 10000)
                exit;
            
            if (amount < max_)
            {
                var xx = irandom(grid_tile_w);
                var yy = irandom(grid_tile_h);
                
                if (ds_grid_get(grid_tile, xx, yy) == -1 && ds_grid_get(g_building, xx, yy) == UnknownEnum.Value_0)
                {
                    var can_place = true;
                    
                    for (var sx = 0; sx < (raggio_ * 2); sx++)
                    {
                        for (var sy = 0; sy < (raggio_ * 2); sy++)
                        {
                            if (ds_grid_get(grid_tile, xx + sx, yy + sy) == -7 || ds_grid_get(grid_building, xx + sx, yy + sy) != UnknownEnum.Value_0)
                                can_place = false;
                        }
                    }
                    
                    if (can_place == true)
                    {
                        ds_grid_set_disk(grid_building, xx + raggio_, yy + raggio_, raggio_, UnknownEnum.Value_2);
                        amount += 1;
                        var wolfx = (xx + raggio_) * 16;
                        var wolfy = (yy + raggio_) * 16;
                        instance_create_depth(wolfx, wolfy, -y, arg2);
                    }
                }
            }
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_2 = 2
}

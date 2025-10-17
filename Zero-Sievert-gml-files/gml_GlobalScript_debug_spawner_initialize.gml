function debug_spawner_initialize()
{
    if (instance_exists(obj_editor))
        exit;
    
    global.item_spawn_tx = 56;
    global.item_spawn_ty = 16;
    global.item_spawn_tw = 80;
    global.item_spawn_th = 16;
    global.item_spawn_subpage_x = 112;
    global.item_spawn_subpage_y = 2;
    global.item_spawn_subpage_w = 16;
    global.item_spawn_cat = global.debug_spawner_array[0];
    global.item_spawn_page = 0;
    global.item_spawn_page_tot = 0;
    
    for (var i = 0; i < array_length(global.debug_spawner_array); i++)
    {
        var _spawner_id = global.debug_spawner_array[i];
        var _spawner_data = variable_struct_get(global.item_debug_spawner_data, _spawner_id);
        var _raw_array = _spawner_data.raw_array;
        var _loot_array = _spawner_data.loot_array;
        var _page = 0;
        var _grid_w = 22;
        var _grid_h = 15;
        var _grid = ds_grid_create(_grid_w, _grid_h);
        ds_grid_clear(_grid, false);
        
        for (var j = 0; j < array_length(_raw_array); j++)
        {
            var _id = _raw_array[j];
            show_debug_message(_id);
            var necessario_w = sprite_get_width(item_get_sprite_inv(_id)) div 16;
            var necessario_h = sprite_get_height(item_get_sprite_inv(_id)) div 16;
            var placed = false;
            
            while (!placed)
            {
                for (var yy = 0; yy < _grid_h; yy++)
                {
                    for (var xx = 0; xx < _grid_w; xx++)
                    {
                        if (ds_grid_get(_grid, xx, yy) == false)
                        {
                            if (placed == false)
                            {
                                var can_place = true;
                                
                                if ((xx + necessario_w) > _grid_w)
                                    can_place = false;
                                
                                if ((yy + necessario_h) > _grid_h)
                                    can_place = false;
                                
                                for (var ix = 0; ix < necessario_w; ix++)
                                {
                                    for (var iy = 0; iy < necessario_h; iy++)
                                    {
                                        if (ds_grid_get(_grid, xx + ix, yy + iy) == true)
                                            can_place = false;
                                    }
                                }
                                
                                if (can_place == true)
                                {
                                    placed = true;
                                    
                                    for (var ix = 0; ix < necessario_w; ix++)
                                    {
                                        for (var iy = 0; iy < necessario_h; iy++)
                                            ds_grid_set(_grid, xx + ix, yy + iy, true);
                                    }
                                    
                                    var _loot = new class_loot(_id, 1, xx * 16, yy * 16, 0, "craft inventory");
                                    loot_set_from_trader(_loot, 0, _page);
                                    array_push(_loot_array, _loot);
                                }
                            }
                        }
                    }
                }
                
                if (!placed)
                {
                    _page++;
                    ds_grid_clear(_grid, false);
                }
            }
        }
        
        ds_grid_destroy(_grid);
    }
}

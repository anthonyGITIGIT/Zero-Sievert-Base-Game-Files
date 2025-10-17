function player_puppet_init_new_game_items()
{
    var t_id = db_read_ext(inventory_target_db(), "loadout", "id", "equipment_1");
    var grid_w = 8;
    var grid_h = 11;
    var grid_item_ = ds_grid_create(grid_w, grid_h);
    ds_grid_clear(grid_item_, false);
    var n_items = 1;
    var _i = 0;
    
    repeat (loadout_get_item_count(t_id))
    {
        var id_item = loadout_get_item_id(t_id, _i);
        var placed = false;
        var necessario_w = sprite_get_width(item_get_sprite_inv(id_item)) div 16;
        var necessario_h = sprite_get_height(item_get_sprite_inv(id_item)) div 16;
        
        for (var yy = 0; yy < grid_h; yy++)
        {
            for (var xx = 0; xx < grid_w; xx++)
            {
                if (ds_grid_get(grid_item_, xx, yy) == false)
                {
                    if (placed == false)
                    {
                        var can_place = true;
                        
                        if ((xx + necessario_w) > grid_w)
                            can_place = false;
                        
                        if ((yy + necessario_h) > grid_h)
                            can_place = false;
                        
                        for (var ix = 0; ix < necessario_w; ix++)
                        {
                            for (var iy = 0; iy < necessario_h; iy++)
                            {
                                if (ds_grid_get(grid_item_, xx + ix, yy + iy) == true)
                                    can_place = false;
                            }
                        }
                        
                        if (can_place == true)
                        {
                            for (var ix = 0; ix < necessario_w; ix++)
                            {
                                for (var iy = 0; iy < necessario_h; iy++)
                                    ds_grid_set(grid_item_, xx + ix, yy + iy, true);
                            }
                            
                            if (item_get_category(id_item) == "backpack")
                                backpack_now = id_item;
                            
                            n_items++;
                            placed = true;
                        }
                    }
                }
            }
        }
        
        _i++;
    }
    
    inventory_calculate_max_weight(backpack_now);
    ds_grid_destroy(grid_item_);
}

function scr_enemy_search_range_position(arg0)
{
    var list_x = ds_list_create();
    var list_y = ds_list_create();
    var list_length = ds_list_create();
    var _array;
    _array[0] = 0;
    _array[1] = 0;
    var pos_found = 0;
    var pos_found_max = 7;
    var _g_w = 16;
    var _g_x = x div _g_w;
    var _g_y = y div _g_w;
    var _grid_max = 7;
    var _grid_check = ds_grid_create(_grid_max * 2, _grid_max * 2);
    ds_grid_clear(_grid_check, false);
    
    for (var _grid_now = 1; _grid_now < _grid_max; _grid_now++)
    {
        for (var xx = 0; xx <= (_grid_now * 2); xx++)
        {
            for (var yy = 0; yy <= (_grid_now * 2); yy++)
            {
                if (pos_found < pos_found_max)
                {
                    if (ds_grid_get(_grid_check, xx, yy) == false)
                    {
                        ds_grid_set(_grid_check, xx, yy, true);
                        var _sx = (_g_x - _grid_now) + xx;
                        var _sy = (_g_y - _grid_now) + yy;
                        
                        if (ds_grid_get(obj_controller.grid_motion, _sx, _sy) == 0)
                        {
                            var _new_x = (_sx * 16) + 8;
                            var _new_y = (_sy * 16) + 8;
                            var _new_dist = point_distance(_new_x, _new_y, last_seen_x, last_seen_y);
                            
                            if (_new_dist >= arg0.ok_min && _new_dist <= arg0.ok_max)
                            {
                                pos_found++;
                                var _length = point_distance(x, y, _new_x, _new_y);
                                ds_list_add(list_x, _new_x);
                                ds_list_add(list_y, _new_y);
                                ds_list_add(list_length, _length);
                            }
                        }
                    }
                }
            }
        }
    }
    
    if (pos_found > 0)
    {
        var _index = 0;
        var _l = 9999;
        
        for (var i = 0; i < ds_list_size(list_x); i++)
        {
            if (ds_list_find_value(list_length, i) < _l)
            {
                _index = i;
                _l = ds_list_find_value(list_length, i);
            }
        }
        
        _array[0] = ds_list_find_value(list_x, _index);
        _array[1] = ds_list_find_value(list_y, _index);
    }
    
    ds_list_destroy(list_x);
    ds_list_destroy(list_y);
    ds_list_destroy(list_length);
    ds_grid_destroy(_grid_check);
    return _array;
}

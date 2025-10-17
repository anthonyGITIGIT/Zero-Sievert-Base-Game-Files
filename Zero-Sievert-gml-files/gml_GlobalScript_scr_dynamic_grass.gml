vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_custom(vertex_type_float1, vertex_usage_texcoord);
vertex_format_add_custom(vertex_type_float1, vertex_usage_texcoord);
global.grass_vertex_format = vertex_format_end();

function scr_dynamic_grass(arg0, arg1)
{
    arg1 *= settings_get("amount grass");
    
    if (arg1 <= 0)
        exit;
    
    var _region_pixel_width = region_pixel_width;
    var _region_pixel_height = region_pixel_height;
    var _region_width = region_width;
    var _region_height = region_height;
    var _vbuff_array = vbuff_array;
    var g_w = obj_map_generator.grid_water;
    var g_t = obj_map_generator.grid_tile;
    var g_f2 = obj_map_generator.grid_floor2;
    var g_r = obj_map_generator.grid_strada;
    var g_s = obj_map_generator.grid_snow;
    var _area = obj_map_generator.area;
    var _area_is_mall = _area == UnknownEnum.Value_6;
    var _area_is_swamp = _area == UnknownEnum.Value_4;
    var _swampy_grass = _area == UnknownEnum.Value_4 && arg0 == UnknownEnum.Value_6;
    var _check_chests = instance_exists(obj_chest_general);
    var _grass_image = global.grass_image[arg0];
    var _image_randomizer = sprite_get_number(_grass_image) - 1;
    var spr_w = sprite_get_width(_grass_image);
    var spr_h = sprite_get_height(_grass_image);
    gpu_set_ztestenable(true);
    var _uv_cache_l = array_create(sprite_get_number(_grass_image), undefined);
    var _uv_cache_t = array_create(sprite_get_number(_grass_image), undefined);
    var _uv_cache_r = array_create(sprite_get_number(_grass_image), undefined);
    var _uv_cache_b = array_create(sprite_get_number(_grass_image), undefined);
    var _i = 0;
    
    repeat (sprite_get_number(_grass_image))
    {
        var _uvs = sprite_get_uvs(_grass_image, _i);
        _uv_cache_l[_i] = _uvs[0];
        _uv_cache_t[_i] = _uvs[1];
        _uv_cache_r[_i] = _uvs[2];
        _uv_cache_b[_i] = _uvs[3];
        _i++;
    }
    
    if (arg0 == UnknownEnum.Value_7)
    {
        if (instance_exists(obj_anomaly_emitter_parent))
        {
            with (obj_anomaly_emitter_parent)
            {
                repeat (arg1)
                {
                    var rand_dist = random(24);
                    var rand_dir = random(360);
                    var left = floor(x + lengthdir_x(rand_dist, rand_dir));
                    var top = floor(y + lengthdir_y(rand_dist, rand_dir));
                    var _vbuff, yy;
                    
                    if (is_in_raid())
                    {
                        var _region_x = clamp(floor(left / _region_pixel_width), 0, _region_width - 1);
                        var _region_y = clamp(floor(top / _region_pixel_height), 0, _region_height - 1);
                        var _region_index = _region_x + (_region_width * _region_y);
                        _vbuff = _vbuff_array[_region_index];
                        var xx = left + (spr_w / 2);
                        yy = top + (spr_h / 2);
                        var x1 = xx div 16;
                        var y1 = yy div 16;
                        var x96 = xx div 96;
                        var y96 = yy div 96;
                        
                        if (_swampy_grass)
                        {
                            if (ds_grid_get(g_w, x1, y1) == -1 && scr_chance(80))
                                continue;
                        }
                        else if (ds_grid_get(g_w, x1, y1) == -1)
                        {
                            continue;
                        }
                        
                        if (ds_grid_get(g_t, x1, y1) == -7)
                            continue;
                        
                        var gf2 = ds_grid_get(g_f2, x1, y1);
                        
                        if (gf2 == 1 || gf2 == 6 || gf2 == 0 || gf2 == 5)
                        {
                            if (scr_chance(95))
                                continue;
                        }
                        
                        var gs = ds_grid_get(g_s, x1, y1);
                        
                        if (gs == true)
                        {
                            if (scr_chance(0))
                                continue;
                        }
                        
                        var gr = ds_grid_get(g_r, x96, y96);
                        
                        if (gr == true)
                        {
                            if (scr_chance(95))
                                continue;
                        }
                        
                        if (gf2 == 10 && arg0 != UnknownEnum.Value_10)
                            continue;
                        
                        if (_check_chests)
                        {
                            var near = instance_nearest(xx, yy, obj_chest_general);
                            
                            if (point_distance(xx, yy, near.x, near.y) < 16)
                            {
                                if (scr_chance(100))
                                    continue;
                            }
                        }
                        
                        if (_area_is_mall)
                        {
                            if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                continue;
                        }
                        
                        if (_area_is_swamp)
                        {
                            if (x1 >= 212 && x1 <= 220 && y1 >= 89 && y1 <= 93)
                                continue;
                        }
                    }
                    
                    var im_ind = irandom(_image_randomizer);
                    var uv_left = _uv_cache_l[im_ind];
                    var uv_top = _uv_cache_t[im_ind];
                    var uv_right = _uv_cache_r[im_ind];
                    var uv_bottom = _uv_cache_b[im_ind];
                    var right = left + spr_w;
                    var bottom = top + spr_h;
                    var dep = -bottom + 2;
                    vertex_position_3d(_vbuff, left, top, dep);
                    vertex_texcoord(_vbuff, uv_left, uv_top);
                    vertex_float1(_vbuff, 1);
                    vertex_float1(_vbuff, yy);
                    vertex_position_3d(_vbuff, right, top, dep);
                    vertex_texcoord(_vbuff, uv_right, uv_top);
                    vertex_float1(_vbuff, 1);
                    vertex_float1(_vbuff, yy);
                    vertex_position_3d(_vbuff, left, bottom, dep);
                    vertex_texcoord(_vbuff, uv_left, uv_bottom);
                    vertex_float1(_vbuff, 0);
                    vertex_float1(_vbuff, yy);
                    vertex_position_3d(_vbuff, right, top, dep);
                    vertex_texcoord(_vbuff, uv_right, uv_top);
                    vertex_float1(_vbuff, 1);
                    vertex_float1(_vbuff, yy);
                    vertex_position_3d(_vbuff, right, bottom, dep);
                    vertex_texcoord(_vbuff, uv_right, uv_bottom);
                    vertex_float1(_vbuff, 0);
                    vertex_float1(_vbuff, yy);
                    vertex_position_3d(_vbuff, left, bottom, dep);
                    vertex_texcoord(_vbuff, uv_left, uv_bottom);
                    vertex_float1(_vbuff, 0);
                    vertex_float1(_vbuff, yy);
                }
            }
        }
    }
    else if (arg0 == UnknownEnum.Value_10)
    {
        if (instance_exists(obj_cristallo_viola))
        {
            var _range_min = global.grass_range_min[arg0];
            var _range_max = global.grass_range_max[arg0];
            
            with (obj_cristallo_viola)
            {
                repeat (arg1)
                {
                    var rand_dist = irandom_range(_range_min, _range_max);
                    var rand_dir = random(360);
                    var left = floor(x + lengthdir_x(rand_dist, rand_dir));
                    var top = floor(y + lengthdir_y(rand_dist, rand_dir));
                    var _vbuff, yy;
                    
                    if (is_in_raid())
                    {
                        var _region_x = clamp(floor(left / _region_pixel_width), 0, _region_width - 1);
                        var _region_y = clamp(floor(top / _region_pixel_height), 0, _region_height - 1);
                        var _region_index = _region_x + (_region_width * _region_y);
                        _vbuff = _vbuff_array[_region_index];
                        var xx = left + (spr_w / 2);
                        yy = top + (spr_h / 2);
                        var x1 = xx div 16;
                        var y1 = yy div 16;
                        var x96 = xx div 96;
                        var y96 = yy div 96;
                        
                        if (_swampy_grass)
                        {
                            if (ds_grid_get(g_w, x1, y1) == -1 && scr_chance(80))
                                continue;
                        }
                        else if (ds_grid_get(g_w, x1, y1) == -1)
                        {
                            continue;
                        }
                        
                        if (ds_grid_get(g_t, x1, y1) == -7)
                            continue;
                        
                        var gf2 = ds_grid_get(g_f2, x1, y1);
                        
                        if (gf2 == 1 || gf2 == 6 || gf2 == 0 || gf2 == 5)
                        {
                            if (scr_chance(95))
                                continue;
                        }
                        
                        var gs = ds_grid_get(g_s, x1, y1);
                        
                        if (gs == true)
                        {
                            if (scr_chance(0))
                                continue;
                        }
                        
                        var gr = ds_grid_get(g_r, x96, y96);
                        
                        if (gr == true)
                        {
                            if (scr_chance(95))
                                continue;
                        }
                        
                        if (gf2 == 10 && arg0 != UnknownEnum.Value_10)
                            continue;
                        
                        if (_check_chests)
                        {
                            var near = instance_nearest(xx, yy, obj_chest_general);
                            
                            if (point_distance(xx, yy, near.x, near.y) < 16)
                            {
                                if (scr_chance(100))
                                    continue;
                            }
                        }
                        
                        if (_area_is_mall)
                        {
                            if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                                continue;
                        }
                        
                        if (_area_is_swamp)
                        {
                            if (x1 >= 212 && x1 <= 220 && y1 >= 89 && y1 <= 93)
                                continue;
                        }
                    }
                    
                    var im_ind = irandom(_image_randomizer);
                    var uv_left = _uv_cache_l[im_ind];
                    var uv_top = _uv_cache_t[im_ind];
                    var uv_right = _uv_cache_r[im_ind];
                    var uv_bottom = _uv_cache_b[im_ind];
                    var right = left + spr_w;
                    var bottom = top + spr_h;
                    var dep = -bottom + 2;
                    vertex_position_3d(_vbuff, left, top, dep);
                    vertex_texcoord(_vbuff, uv_left, uv_top);
                    vertex_float1(_vbuff, 1);
                    vertex_float1(_vbuff, yy);
                    vertex_position_3d(_vbuff, right, top, dep);
                    vertex_texcoord(_vbuff, uv_right, uv_top);
                    vertex_float1(_vbuff, 1);
                    vertex_float1(_vbuff, yy);
                    vertex_position_3d(_vbuff, left, bottom, dep);
                    vertex_texcoord(_vbuff, uv_left, uv_bottom);
                    vertex_float1(_vbuff, 0);
                    vertex_float1(_vbuff, yy);
                    vertex_position_3d(_vbuff, right, top, dep);
                    vertex_texcoord(_vbuff, uv_right, uv_top);
                    vertex_float1(_vbuff, 1);
                    vertex_float1(_vbuff, yy);
                    vertex_position_3d(_vbuff, right, bottom, dep);
                    vertex_texcoord(_vbuff, uv_right, uv_bottom);
                    vertex_float1(_vbuff, 0);
                    vertex_float1(_vbuff, yy);
                    vertex_position_3d(_vbuff, left, bottom, dep);
                    vertex_texcoord(_vbuff, uv_left, uv_bottom);
                    vertex_float1(_vbuff, 0);
                    vertex_float1(_vbuff, yy);
                }
            }
        }
    }
    else
    {
        var _max_y = is_in_raid() ? (obj_map_generator.map_height - 16) : room_height;
        
        repeat (arg1)
        {
            var left = irandom_range(-spr_w, room_width);
            var top = irandom_range(-spr_h, _max_y);
            var _vbuff, yy;
            
            if (is_in_raid())
            {
                var _region_x = clamp(floor(left / _region_pixel_width), 0, _region_width - 1);
                var _region_y = clamp(floor(top / _region_pixel_height), 0, _region_height - 1);
                var _region_index = _region_x + (_region_width * _region_y);
                _vbuff = _vbuff_array[_region_index];
                var xx = left + (spr_w / 2);
                yy = top + (spr_h / 2);
                var x1 = xx div 16;
                var y1 = yy div 16;
                var x96 = xx div 96;
                var y96 = yy div 96;
                
                if (_swampy_grass)
                {
                    if (ds_grid_get(g_w, x1, y1) == -1 && scr_chance(80))
                        continue;
                }
                else if (ds_grid_get(g_w, x1, y1) == -1)
                {
                    continue;
                }
                
                if (ds_grid_get(g_t, x1, y1) == -7)
                    continue;
                
                var gf2 = ds_grid_get(g_f2, x1, y1);
                
                if (gf2 == 1 || gf2 == 6 || gf2 == 0 || gf2 == 5)
                {
                    if (scr_chance(95))
                        continue;
                }
                
                var gs = ds_grid_get(g_s, x1, y1);
                
                if (gs == true)
                {
                    if (scr_chance(0))
                        continue;
                }
                
                var gr = ds_grid_get(g_r, x96, y96);
                
                if (gr == true)
                {
                    if (scr_chance(95))
                        continue;
                }
                
                if (gf2 == 10 && arg0 != UnknownEnum.Value_10)
                    continue;
                
                if (_check_chests)
                {
                    var near = instance_nearest(xx, yy, obj_chest_general);
                    
                    if (point_distance(xx, yy, near.x, near.y) < 16)
                    {
                        if (scr_chance(100))
                            continue;
                    }
                }
                
                if (_area_is_mall)
                {
                    if (x1 >= 89 && x1 <= 230 && y1 >= 59 && y1 <= 133)
                        continue;
                }
                
                if (_area_is_swamp)
                {
                    if (x1 >= 212 && x1 <= 220 && y1 >= 89 && y1 <= 93)
                        continue;
                }
            }
            
            var im_ind = irandom(_image_randomizer);
            var uv_left = _uv_cache_l[im_ind];
            var uv_top = _uv_cache_t[im_ind];
            var uv_right = _uv_cache_r[im_ind];
            var uv_bottom = _uv_cache_b[im_ind];
            var right = left + spr_w;
            var bottom = top + spr_h;
            var dep = -bottom + 2;
            vertex_position_3d(_vbuff, left, top, dep);
            vertex_texcoord(_vbuff, uv_left, uv_top);
            vertex_float1(_vbuff, 1);
            vertex_float1(_vbuff, yy);
            vertex_position_3d(_vbuff, right, top, dep);
            vertex_texcoord(_vbuff, uv_right, uv_top);
            vertex_float1(_vbuff, 1);
            vertex_float1(_vbuff, yy);
            vertex_position_3d(_vbuff, left, bottom, dep);
            vertex_texcoord(_vbuff, uv_left, uv_bottom);
            vertex_float1(_vbuff, 0);
            vertex_float1(_vbuff, yy);
            vertex_position_3d(_vbuff, right, top, dep);
            vertex_texcoord(_vbuff, uv_right, uv_top);
            vertex_float1(_vbuff, 1);
            vertex_float1(_vbuff, yy);
            vertex_position_3d(_vbuff, right, bottom, dep);
            vertex_texcoord(_vbuff, uv_right, uv_bottom);
            vertex_float1(_vbuff, 0);
            vertex_float1(_vbuff, yy);
            vertex_position_3d(_vbuff, left, bottom, dep);
            vertex_texcoord(_vbuff, uv_left, uv_bottom);
            vertex_float1(_vbuff, 0);
            vertex_float1(_vbuff, yy);
        }
    }
}

enum UnknownEnum
{
    Value_4 = 4,
    Value_6 = 6,
    Value_7,
    Value_10 = 10
}

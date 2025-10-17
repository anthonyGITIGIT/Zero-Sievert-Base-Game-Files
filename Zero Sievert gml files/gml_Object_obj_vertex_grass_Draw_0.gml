if (settings_get("amount grass") <= 0)
    exit;

gpu_set_alphatestenable(true);
shader_set(shd_grass);

if (settings_get("dynamic grass"))
{
    var _grass_wind = grass_wind;
    var _grass_speed = grass_speed;
    var _wind_hsp = wind_hsp;
    
    if (global.state_emission_now > UnknownEnum.Value_19)
    {
        _grass_wind = 3;
        _grass_speed = 3;
        _wind_hsp = 0.8;
    }
    
    shader_set_uniform_f(uni_time, current_time);
    shader_set_uniform_f(uni_dist, _grass_wind);
    shader_set_uniform_f(uni_slow, 200 / _grass_speed);
    shader_set_uniform_f(uni_spd, -4.5 * _wind_hsp);
    shader_set_uniform_f(uni_patbool, patbool);
    shader_set_uniform_f(uni_pattern, pattern);
}
else
{
    shader_set_uniform_f(uni_time, 0);
    shader_set_uniform_f(uni_dist, 0);
    shader_set_uniform_f(uni_slow, 1);
    shader_set_uniform_f(uni_spd, 0);
    shader_set_uniform_f(uni_patbool, 0);
    shader_set_uniform_f(uni_pattern, 0);
}

if (instance_exists(obj_map_generator))
{
    var _texture = sprite_get_texture(global.grass_image[0], 0);
    var _region_l = floor((obj_map_generator.x - 240 - 100) / region_pixel_width);
    var _region_t = floor((obj_map_generator.y - 135 - 100) / region_pixel_height);
    var _region_r = floor((obj_map_generator.x + 240 + 100) / region_pixel_width);
    var _region_b = floor((obj_map_generator.y + 135 + 100) / region_pixel_height);
    _region_l = clamp(_region_l, 0, region_width - 1);
    _region_t = clamp(_region_t, 0, region_height - 1);
    _region_r = clamp(_region_r, 0, region_width - 1);
    _region_b = clamp(_region_b, 0, region_height - 1);
    var _y = _region_t;
    
    repeat ((1 + _region_b) - _region_t)
    {
        var _x = _region_l;
        
        repeat ((1 + _region_r) - _region_l)
        {
            vertex_submit(vbuff_array[_x + (region_width * _y)], pr_trianglelist, _texture);
            _x++;
        }
        
        _y++;
    }
}

gpu_set_alphatestenable(false);
shader_reset();

enum UnknownEnum
{
    Value_19 = 19
}

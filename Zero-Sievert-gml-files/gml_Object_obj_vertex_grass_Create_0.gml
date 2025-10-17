var a = UnknownEnum.Value_0;
global.grass_id[a] = a;
global.grass_image[a] = s_grass_forest;
global.grass_range_min[a] = 64;
global.grass_range_max[a] = 128;
a = UnknownEnum.Value_1;
global.grass_id[a] = a;
global.grass_image[a] = s_grass_forest_tall;
global.grass_range_min[a] = 32;
global.grass_range_max[a] = 96;
a = UnknownEnum.Value_2;
global.grass_id[a] = a;
global.grass_image[a] = s_grass_camp_low;
global.grass_range_min[a] = 32;
global.grass_range_max[a] = 96;
a = UnknownEnum.Value_3;
global.grass_id[a] = a;
global.grass_image[a] = s_grass_camp_tall;
global.grass_range_min[a] = 32;
global.grass_range_max[a] = 96;
a = UnknownEnum.Value_4;
global.grass_id[a] = a;
global.grass_image[a] = s_grass_swamp_low;
global.grass_range_min[a] = 32;
global.grass_range_max[a] = 96;
a = UnknownEnum.Value_5;
global.grass_id[a] = a;
global.grass_image[a] = s_grass_swamp_medium;
global.grass_range_min[a] = 32;
global.grass_range_max[a] = 96;
a = UnknownEnum.Value_6;
global.grass_id[a] = a;
global.grass_image[a] = s_grass_swamp_tall;
global.grass_range_min[a] = 32;
global.grass_range_max[a] = 96;
a = UnknownEnum.Value_7;
global.grass_id[a] = a;
global.grass_image[a] = s_grass_dead_medium;
global.grass_range_min[a] = 32;
global.grass_range_max[a] = 96;
a = UnknownEnum.Value_8;
global.grass_id[a] = a;
global.grass_image[a] = s_grass_dead_low;
global.grass_range_min[a] = 32;
global.grass_range_max[a] = 96;
a = UnknownEnum.Value_10;
global.grass_id[a] = a;
global.grass_image[a] = s_grass_viola_medium;
global.grass_range_min[a] = 0;
global.grass_range_max[a] = 140;
a = UnknownEnum.Value_9;
global.grass_id[a] = a;
global.grass_image[a] = s_tree5;
global.grass_range_min[a] = 16;
global.grass_range_max[a] = 96;
a = UnknownEnum.Value_17;
global.grass_id[a] = a;
global.grass_image[a] = s_grass_snow_low;
global.grass_range_min[a] = 16;
global.grass_range_max[a] = 96;
a = UnknownEnum.Value_18;
global.grass_id[a] = a;
global.grass_image[a] = s_grass_snow_medium;
global.grass_range_min[a] = 16;
global.grass_range_max[a] = 96;
a = UnknownEnum.Value_12;
global.grass_id[a] = a;
global.grass_image[a] = s_grass_forest_snow_medium;
global.grass_range_min[a] = 16;
global.grass_range_max[a] = 96;
a = UnknownEnum.Value_14;
global.grass_id[a] = a;
global.grass_image[a] = s_grass_camp_snow_medium;
global.grass_range_min[a] = 16;
global.grass_range_max[a] = 96;
a = UnknownEnum.Value_16;
global.grass_id[a] = a;
global.grass_image[a] = s_grass_swamp_snow_medium;
global.grass_range_min[a] = 16;
global.grass_range_max[a] = 96;
a = UnknownEnum.Value_11;
global.grass_id[a] = a;
global.grass_image[a] = s_grass_forest_snow_low;
global.grass_range_min[a] = 16;
global.grass_range_max[a] = 96;
a = UnknownEnum.Value_13;
global.grass_id[a] = a;
global.grass_image[a] = s_grass_camp_snow_low;
global.grass_range_min[a] = 16;
global.grass_range_max[a] = 96;
a = UnknownEnum.Value_15;
global.grass_id[a] = a;
global.grass_image[a] = s_grass_swamp_snow_low;
global.grass_range_min[a] = 16;
global.grass_range_max[a] = 96;
grass_wind = 0;
grass_speed = 0;
wind_hsp = 0;
patbool = 1;
pattern = 0.02;
grass_wind_k = 0.01;
grass_speed_k = 0.01;
wind_hsp_k = 0.0002;
pattern_size_k = 0.05;
uni_time = shader_get_uniform(shd_grass, "time");
uni_dist = shader_get_uniform(shd_grass, "wave_dist");
uni_slow = shader_get_uniform(shd_grass, "slow");
uni_spd = shader_get_uniform(shd_grass, "wind_spd");
uni_patbool = shader_get_uniform(shd_grass, "patbool");
uni_pattern = shader_get_uniform(shd_grass, "pattern");
wind_index = 0;
weather_assign_wind_values();
region_pixel_width = 100;
region_pixel_height = 100;
region_width = ceil(room_width / region_pixel_width);
region_height = ceil(room_height / region_pixel_height);
vbuff_array = array_create(region_width * region_height, undefined);
var _i = 0;

repeat (array_length(vbuff_array))
{
    var _vbuff = vertex_create_buffer();
    vbuff_array[_i] = _vbuff;
    vertex_begin(_vbuff, global.grass_vertex_format);
    
    repeat (3)
    {
        vertex_position_3d(_vbuff, 0, 0, 0);
        vertex_texcoord(_vbuff, 0, 0);
        vertex_float1(_vbuff, 0);
        vertex_float1(_vbuff, 0);
    }
    
    _i++;
}

var _snow_accumulation = weather_get_snow_accumulation();
var _threshold = 0.6;
var _full = false;

if (_snow_accumulation >= _threshold)
    _full = true;

switch (obj_map_generator.area)
{
    case UnknownEnum.Value_10:
        scr_dynamic_grass(UnknownEnum.Value_7, 8);
        scr_dynamic_grass(UnknownEnum.Value_0, 325000);
        scr_dynamic_grass(UnknownEnum.Value_1, 90000);
        scr_dynamic_grass(UnknownEnum.Value_2, 225000);
        break;
    
    case UnknownEnum.Value_1:
        scr_dynamic_grass(UnknownEnum.Value_7, 8);
        
        if (_full)
            scr_dynamic_grass(UnknownEnum.Value_17, 150000 * _snow_accumulation);
        
        if (_full)
            scr_dynamic_grass(UnknownEnum.Value_18, 50000 * _snow_accumulation);
        
        scr_dynamic_grass(UnknownEnum.Value_12, 100000 * _snow_accumulation);
        scr_dynamic_grass(UnknownEnum.Value_11, 250000 * _snow_accumulation);
        scr_dynamic_grass(UnknownEnum.Value_0, (325000 * (1 - _snow_accumulation)) + 75000);
        scr_dynamic_grass(UnknownEnum.Value_1, (90000 * (1 - _snow_accumulation)) + 50000);
        scr_dynamic_grass(UnknownEnum.Value_2, (225000 * (1 - _snow_accumulation)) + 75000);
        break;
    
    case UnknownEnum.Value_2:
        scr_dynamic_grass(UnknownEnum.Value_7, 8);
        scr_dynamic_grass(UnknownEnum.Value_13, 150000 * _snow_accumulation);
        scr_dynamic_grass(UnknownEnum.Value_11, 100000 * _snow_accumulation);
        scr_dynamic_grass(UnknownEnum.Value_14, 125000 * _snow_accumulation);
        
        if (_full)
            scr_dynamic_grass(UnknownEnum.Value_17, 150000 * _snow_accumulation);
        
        if (_full)
            scr_dynamic_grass(UnknownEnum.Value_18, 100000 * _snow_accumulation);
        
        scr_dynamic_grass(UnknownEnum.Value_2, (260000 * (1 - _snow_accumulation)) + 75000);
        scr_dynamic_grass(UnknownEnum.Value_3, (150000 * (1 - _snow_accumulation)) + 50000);
        scr_dynamic_grass(UnknownEnum.Value_0, (100000 * (1 - _snow_accumulation)) + 50000);
        break;
    
    case UnknownEnum.Value_3:
        scr_dynamic_grass(UnknownEnum.Value_13, 150000 * _snow_accumulation);
        scr_dynamic_grass(UnknownEnum.Value_11, 100000 * _snow_accumulation);
        scr_dynamic_grass(UnknownEnum.Value_14, 125000 * _snow_accumulation);
        
        if (_full)
            scr_dynamic_grass(UnknownEnum.Value_17, 150000 * _snow_accumulation);
        
        if (_full)
            scr_dynamic_grass(UnknownEnum.Value_18, 100000 * _snow_accumulation);
        
        scr_dynamic_grass(UnknownEnum.Value_2, (260000 * (1 - _snow_accumulation)) + 75000);
        scr_dynamic_grass(UnknownEnum.Value_3, (150000 * (1 - _snow_accumulation)) + 50000);
        scr_dynamic_grass(UnknownEnum.Value_0, (100000 * (1 - _snow_accumulation)) + 50000);
        break;
    
    case UnknownEnum.Value_4:
        scr_dynamic_grass(UnknownEnum.Value_7, 8);
        scr_dynamic_grass(UnknownEnum.Value_10, 2000);
        
        if (_full)
            scr_dynamic_grass(UnknownEnum.Value_17, 125000 * _snow_accumulation);
        
        if (_full)
            scr_dynamic_grass(UnknownEnum.Value_18, 75000 * _snow_accumulation);
        
        scr_dynamic_grass(UnknownEnum.Value_15, 15000 * _snow_accumulation);
        scr_dynamic_grass(UnknownEnum.Value_16, 125000 * _snow_accumulation);
        scr_dynamic_grass(UnknownEnum.Value_4, (350000 * (1 - _snow_accumulation)) + 50000);
        scr_dynamic_grass(UnknownEnum.Value_5, (250000 * (1 - _snow_accumulation)) + 50000);
        scr_dynamic_grass(UnknownEnum.Value_6, (100000 * (1 - _snow_accumulation)) + 75000);
        break;
    
    case UnknownEnum.Value_6:
        scr_dynamic_grass(UnknownEnum.Value_7, 8);
        scr_dynamic_grass(UnknownEnum.Value_13, 150000 * _snow_accumulation);
        scr_dynamic_grass(UnknownEnum.Value_11, 100000 * _snow_accumulation);
        scr_dynamic_grass(UnknownEnum.Value_14, 125000 * _snow_accumulation);
        
        if (_full)
            scr_dynamic_grass(UnknownEnum.Value_17, 150000 * _snow_accumulation);
        
        if (_full)
            scr_dynamic_grass(UnknownEnum.Value_18, 100000 * _snow_accumulation);
        
        scr_dynamic_grass(UnknownEnum.Value_2, (260000 * (1 - _snow_accumulation)) + 75000);
        scr_dynamic_grass(UnknownEnum.Value_3, (100000 * (1 - _snow_accumulation)) + 50000);
        scr_dynamic_grass(UnknownEnum.Value_0, (125000 * (1 - _snow_accumulation)) + 50000);
        break;
    
    case UnknownEnum.Value_8:
        scr_dynamic_grass(UnknownEnum.Value_7, 8);
        scr_dynamic_grass(UnknownEnum.Value_13, 150000 * _snow_accumulation);
        scr_dynamic_grass(UnknownEnum.Value_11, 100000 * _snow_accumulation);
        scr_dynamic_grass(UnknownEnum.Value_14, 125000 * _snow_accumulation);
        
        if (_full)
            scr_dynamic_grass(UnknownEnum.Value_17, 150000 * _snow_accumulation);
        
        if (_full)
            scr_dynamic_grass(UnknownEnum.Value_18, 100000 * _snow_accumulation);
        
        scr_dynamic_grass(UnknownEnum.Value_2, (260000 * (1 - _snow_accumulation)) + 75000);
        scr_dynamic_grass(UnknownEnum.Value_3, (100000 * (1 - _snow_accumulation)) + 50000);
        scr_dynamic_grass(UnknownEnum.Value_0, (125000 * (1 - _snow_accumulation)) + 50000);
        break;
}

_i = 0;

repeat (array_length(vbuff_array))
{
    var _vbuff = vbuff_array[_i];
    vertex_end(_vbuff);
    vertex_freeze(_vbuff);
    _i++;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18
}

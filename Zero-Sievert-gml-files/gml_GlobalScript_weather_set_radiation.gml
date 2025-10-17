function weather_set_radiation(arg0 = false)
{
    if (is_in_hub())
        exit;
    
    if (!is_in_raid())
        exit;
    
    var _weather_now = weather_get_weather_now();
    var _weather_before = global.weather.weather_before;
    
    if (!is_string(global.weather.weather_before))
        _weather_before = "sun_1";
    
    if (_weather_now == _weather_before && !arg0)
        exit;
    
    var _w = room_width div 8;
    var _h = obj_map_generator.map_height div 8;
    var _rad_amount_now = weather_get_amount_radiation(_weather_now);
    var _rad_amount_before = weather_get_amount_radiation(_weather_before);
    
    if (!arg0 && _rad_amount_before != 0)
        ds_grid_add_region(obj_map_generator.grid_radiation, 0, 0, _w, _h, -_rad_amount_before);
    
    if (_rad_amount_now != 0)
        ds_grid_add_region(obj_map_generator.grid_radiation, 0, 0, _w, _h, _rad_amount_now);
}

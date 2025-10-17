function weather_assign_wind_values()
{
    var _weather_now = weather_get_weather_now();
    var _index = weather_choose_wind(_weather_now);
    
    with (obj_vertex_grass)
    {
        wind_index = _index;
        grass_wind = weather_get_wind_speed(_index);
        grass_speed = weather_get_wind_offset(_index);
        pattern = weather_get_wind_pattern(_index);
        wind_hsp = weather_get_wind_incline(_index);
    }
}

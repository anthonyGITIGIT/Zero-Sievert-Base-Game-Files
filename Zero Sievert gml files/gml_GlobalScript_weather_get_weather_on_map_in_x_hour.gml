function weather_get_weather_on_map_in_x_hour(arg0, arg1)
{
    var _weather_now = "sun_1";
    arg1 = clamp(arg1, 0, 23);
    
    for (var i = 0; i < array_length(global.weather.map); i++)
    {
        if (global.weather.map[i].map_id == arg0)
            _weather_now = global.weather.map[i].weather_type[arg1];
    }
    
    _weather_now = weather_decide_snow(_weather_now);
    return _weather_now;
}

function weather_get_temperature_hour(arg0, arg1)
{
    arg0 = clamp(arg0, 0, 23);
    var _map = arg1;
    
    if (!is_string(_map))
        _map = from_map_enum_to_map_macro(_map);
    
    for (var i = 0; i < array_length(global.weather.map); i++)
    {
        if (global.weather.map[i].map_id == _map)
            return global.weather.map[i].temperature[arg0];
    }
    
    return 10;
}

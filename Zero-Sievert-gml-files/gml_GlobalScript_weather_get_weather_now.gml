function weather_get_weather_now()
{
    var _weather_now = "sun_1";
    var _map_macro;
    
    if (instance_exists(obj_map_generator))
    {
        var _map_enum = obj_map_generator.area;
        
        if (_map_enum == UnknownEnum.Value_10)
            return "sun_1";
        
        _map_macro = from_map_enum_to_map_macro(_map_enum);
    }
    else
    {
        _map_macro = "forest";
    }
    
    for (var i = 0; i < array_length(global.weather.map); i++)
    {
        if (global.weather.map[i].map_id == _map_macro)
            _weather_now = global.weather.map[i].weather_type[0];
    }
    
    _weather_now = weather_decide_snow(_weather_now);
    return _weather_now;
}

enum UnknownEnum
{
    Value_10 = 10
}

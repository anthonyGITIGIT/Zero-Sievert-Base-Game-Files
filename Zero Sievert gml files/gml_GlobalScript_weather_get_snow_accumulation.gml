function weather_get_snow_accumulation()
{
    var _k = 0;
    var _map_macro;
    
    if (instance_exists(obj_map_generator))
    {
        var _map_enum = obj_map_generator.area;
        _map_macro = from_map_enum_to_map_macro(_map_enum);
    }
    else
    {
        _map_macro = "forest";
    }
    
    for (var i = 0; i < array_length(global.weather.map); i++)
    {
        if (global.weather.map[i].map_id == _map_macro)
            return global.weather.map[i].snow_accumulation;
    }
    
    return 0;
}

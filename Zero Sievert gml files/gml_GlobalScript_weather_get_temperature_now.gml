function weather_get_temperature_now()
{
    var _map_enum = UnknownEnum.Value_1;
    
    if (is_in_raid() && instance_exists(obj_map_generator))
        _map_enum = obj_map_generator.area;
    
    var _temp_floored_hour = weather_get_temperature_hour(0, _map_enum);
    var _temp_next_hour = weather_get_temperature_hour(1, _map_enum);
    var _k = time_get_minutes() / 60;
    var _temp_now = lerp(_temp_floored_hour, _temp_next_hour, _k);
    return _temp_now;
}

enum UnknownEnum
{
    Value_1 = 1
}

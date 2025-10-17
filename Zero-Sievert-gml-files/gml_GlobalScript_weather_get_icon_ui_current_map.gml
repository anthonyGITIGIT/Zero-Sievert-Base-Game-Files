function weather_get_icon_ui_current_map(arg0)
{
    var _map_enum = UnknownEnum.Value_1;
    
    if (is_in_raid())
        _map_enum = obj_map_generator.area;
    
    var _map_macro = from_map_enum_to_map_macro(_map_enum);
    var _weather = weather_get_weather_on_map_in_x_hour(_map_macro, arg0);
    return weather_get_icon_pda(_weather);
}

enum UnknownEnum
{
    Value_1 = 1
}

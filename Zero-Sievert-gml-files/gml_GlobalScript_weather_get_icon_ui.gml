function weather_get_icon_ui(arg0, arg1)
{
    var _weather = weather_get_weather_on_map_in_x_hour(arg0, arg1);
    return weather_get_icon(_weather);
}

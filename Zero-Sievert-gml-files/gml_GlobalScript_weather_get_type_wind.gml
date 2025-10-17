function weather_get_type_wind(arg0)
{
    return variable_struct_get(global.weather_data.type, arg0).wind;
}

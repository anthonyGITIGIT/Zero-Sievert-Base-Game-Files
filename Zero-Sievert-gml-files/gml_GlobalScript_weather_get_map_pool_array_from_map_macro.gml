function weather_get_map_pool_array_from_map_macro(arg0)
{
    return variable_struct_get(global.weather_data.map, arg0).pool;
}

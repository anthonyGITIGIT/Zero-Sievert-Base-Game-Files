function weather_get_map_temperature_variation_array(arg0)
{
    var _map = from_map_enum_to_map_macro(arg0);
    return variable_struct_get(global.weather_data.map, _map).temperature_variation;
}

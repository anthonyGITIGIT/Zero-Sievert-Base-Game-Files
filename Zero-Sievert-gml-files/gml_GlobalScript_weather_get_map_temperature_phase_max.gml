function weather_get_map_temperature_phase_max(arg0, arg1)
{
    var _map = arg0;
    
    if (!is_string(_map))
        _map = from_map_enum_to_map_macro(_map);
    
    return variable_struct_get(global.weather_data.map, _map).temperature_phase[arg1][1];
}

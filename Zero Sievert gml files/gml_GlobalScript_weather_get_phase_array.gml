function weather_get_phase_array()
{
    var _array = global.weather_data.phase;
    
    if (!is_array(_array))
        trace_error("Weather file has not .phase data");
    
    return _array;
}

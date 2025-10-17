function weather_generate_temperature(arg0, arg1)
{
    var _struct = weather_dont_know_how_to_call_this();
    var _phase_temp_min = weather_get_map_temperature_phase_min(arg1, _struct.phase);
    var _phase_temp_max = weather_get_map_temperature_phase_max(arg1, _struct.phase);
    var _next_phase_temp_min = weather_get_map_temperature_phase_min(arg1, _struct.next_phase);
    var _next_phase_temp_max = weather_get_map_temperature_phase_max(arg1, _struct.next_phase);
    var _phase_k = _struct.hour_passed / _struct.total_hour;
    var _current_temp_min = lerp(_phase_temp_min, _next_phase_temp_min, _phase_k);
    var _current_temp_max = lerp(_phase_temp_max, _next_phase_temp_max, _phase_k);
    var _max_temp_shift = 9;
    var _normalized_hour = ((arg0 - _max_temp_shift) + 24) % 24;
    var _angle_deg = (_normalized_hour / 24) * 360;
    var _angle_rad = degtorad(_angle_deg);
    var _temp_k = (sin(_angle_rad) + 1) / 2;
    var _temperature = lerp(_current_temp_min, _current_temp_max, _temp_k);
    return _temperature;
}

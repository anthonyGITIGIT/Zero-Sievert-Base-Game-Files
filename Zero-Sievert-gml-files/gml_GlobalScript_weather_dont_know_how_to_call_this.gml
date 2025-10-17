function weather_dont_know_how_to_call_this()
{
    var _phase_count = array_length(weather_get_phase_array());
    var _phase = global.weather.phase;
    var _phase_day = global.weather.phase_day + 1;
    
    if (_phase_day >= 4)
    {
        _phase += 1;
        _phase_day = 0;
    }
    
    if (_phase >= _phase_count)
        _phase = 0;
    
    if (_phase_day < 2)
        _phase = ((_phase - 1) + _phase_count) % _phase_count;
    
    var _next_phase = (_phase + 1) % _phase_count;
    var _total_hour = (weather_get_phase_length(_phase) * 12) + (weather_get_phase_length(_next_phase) * 12);
    var _hour_passed;
    
    if (_phase_day < 2)
        _hour_passed = (weather_get_phase_length(_phase) * 12) + (_phase_day * 24) + global.weather.hour_now;
    else
        _hour_passed = ((_phase_day - 2) * 24) + global.weather.hour_now;
    
    var _struct = 
    {
        phase: _phase,
        phase_day: _phase_day,
        next_phase: _next_phase,
        total_hour: _total_hour,
        hour_passed: _hour_passed
    };
    return _struct;
}

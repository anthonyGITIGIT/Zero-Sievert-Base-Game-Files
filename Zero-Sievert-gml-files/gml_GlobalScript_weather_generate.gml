function weather_generate(arg0 = false)
{
    var _array_map = global.weather.map;
    global.weather.hour_now = time_get_hours();
    var _repeat_amount = 1;
    
    if (arg0)
        _repeat_amount = 23;
    
    var _j = 0;
    
    repeat (_repeat_amount)
    {
        var _hour_to_generate = global.weather.hour_now + _j;
        
        for (var i = 0; i < array_length(_array_map); i++)
        {
            var _map_id = _array_map[i].map_id;
            var _array_weather_forecast = _array_map[i].weather_type;
            var new_array_weather_forecast = array_move_down_value(_array_weather_forecast);
            
            if (_array_map[i].hour_since_last_change > 2)
            {
                var _chance = ((_array_map[i].hour_since_last_change - 2) * 25) + 50;
                
                if (scr_chance(_chance))
                {
                    _array_map[i].hour_since_last_change = 0;
                    var _new_weather_id = weather_choose_new_weather(_array_map[i].map_id);
                    new_array_weather_forecast[23] = _new_weather_id;
                }
                else
                {
                    _array_weather_forecast[23] = _array_weather_forecast[23];
                }
            }
            
            _array_map[i].weather_type = new_array_weather_forecast;
            _array_map[i].hour_since_last_change += 1;
            var _array_temperature = _array_map[i].temperature;
            _array_temperature = array_move_down_value(_array_temperature);
            _array_temperature[23] = weather_generate_temperature(_hour_to_generate, _map_id);
        }
        
        _j++;
    }
    
    weather_save();
}

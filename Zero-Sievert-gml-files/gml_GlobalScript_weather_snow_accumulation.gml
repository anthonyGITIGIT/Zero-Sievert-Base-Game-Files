function weather_snow_accumulation()
{
    for (var i = 0; i < array_length(global.weather.map); i++)
    {
        var _weather_now = global.weather.map[i].weather_type[0];
        _weather_now = weather_decide_snow(_weather_now);
        var _snow_accumulation_factor = 0;
        
        switch (_weather_now)
        {
            case "snow_1":
                _snow_accumulation_factor = 0.05;
            
            case "snow_2":
                _snow_accumulation_factor = 0.1;
            
            case "snow_3":
                _snow_accumulation_factor = 0.15;
        }
        
        var _temp = weather_get_temperature_hour(0, global.weather.map[i].map_id);
        var _snow_metling_factor = 0;
        
        if (_temp >= 3)
            _snow_metling_factor = 0.025;
        
        global.weather.map[i].snow_accumulation += _snow_accumulation_factor - _snow_metling_factor;
        global.weather.map[i].snow_accumulation = clamp(global.weather.map[i].snow_accumulation, 0, 1);
    }
}

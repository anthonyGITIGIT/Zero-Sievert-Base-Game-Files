player_follow_local();

if (player_any_exists())
    global.emission_timer_now += 1;

var _hour_now = time_get_hours();

if (_hour_now != global.weather.last_generated_hour)
{
    part_smoother_now = 0;
    global.weather.weather_before = weather_get_weather_now();
    var hours_skipped = ((_hour_now - global.weather.last_generated_hour) + 24) % 24;
    
    if (hours_skipped > 1)
        weather_particle_array_clear();
    
    for (var i = 1; i <= hours_skipped; i++)
    {
        var _current_hour = (global.weather.last_generated_hour + i) % 24;
        
        if (_current_hour == 0)
        {
            global.weather.phase_day += 1;
            global.weather.new_day = true;
            
            if (global.weather.phase_day >= weather_get_phase_length(global.weather.phase))
            {
                global.weather.phase_day = 0;
                global.weather.phase = (global.weather.phase + 1) % 4;
            }
        }
        
        for (var j = 0; j < array_length(global.weather_particle); j++)
        {
            global.weather_particle[j].amount_before = global.weather_particle[j].amount_now;
            global.weather_particle[j].chance_before = global.weather_particle[j].chance_now;
        }
        
        weather_generate();
        weather_snow_accumulation();
        weather_transition(pp_transition, false);
        weather_assign_wind_values();
    }
    
    global.weather.last_generated_hour = _hour_now;
}

weather_particle_array_controller();

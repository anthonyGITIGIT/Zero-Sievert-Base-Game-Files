function weather_add_particle()
{
    var _weather_now = weather_get_weather_now();
    
    for (var j = 0; j < array_length(global.weather_particle); j++)
    {
        global.weather_particle[j].amount_now = 0;
        global.weather_particle[j].chance_now = 0;
        var _particle_array = weather_get_particle_array(_weather_now);
        
        for (var i = 0; i < array_length(_particle_array); i++)
        {
            var _particle_enum_id = weather_get_GM_particle_enum_id(_weather_now, i);
            
            if (global.weather_particle[j].part_enum_id == _particle_enum_id)
            {
                global.weather_particle[j].amount_now = weather_get_particle_amount(_weather_now, i);
                global.weather_particle[j].chance_now = weather_get_particle_chance(_weather_now, i);
            }
        }
    }
}

function weather_particle_array_controller()
{
    part_smoother_now += part_smoother_increase;
    part_smoother_now = clamp(part_smoother_now, 0, 1);
    
    for (var i = 0; i < array_length(global.weather_particle); i++)
    {
        var _now = global.weather_particle[i].amount_now;
        var _before = global.weather_particle[i].amount_before;
        
        if (_now != 0 || _before != 0)
        {
            global.weather_particle[i].amount_to_create = ceil(lerp(_before, _now, part_smoother_now));
            global.weather_particle[i].amount_to_create = clamp(global.weather_particle[i].amount_to_create, 0, 99999);
            global.weather_particle[i].chance_to_create = lerp(global.weather_particle[i].chance_before, global.weather_particle[i].chance_now, part_smoother_now);
            global.weather_particle[i].chance_to_create = clamp(global.weather_particle[i].chance_to_create, 0, 99999);
        }
    }
}

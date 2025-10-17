function weather_particle_array_alrady_in_it(arg0)
{
    for (var i = 0; i < array_length(global.weather_particle); i++)
    {
        if (arg0 == global.weather_particle[i].part_enum_id)
            return true;
    }
    
    return false;
}

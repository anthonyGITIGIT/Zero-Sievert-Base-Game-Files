function weather_particle_array_clear()
{
    for (var i = 0; i < array_length(global.weather_particle); i++)
        global.weather_particle[i] = weather_particle_array_default_struct(global.weather_particle[i].part_enum_id);
}

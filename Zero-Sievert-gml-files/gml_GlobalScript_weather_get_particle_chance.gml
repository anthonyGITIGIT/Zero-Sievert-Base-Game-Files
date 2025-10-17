function weather_get_particle_chance(arg0, arg1)
{
    var _data = weather_get_particle_array(arg0);
    var _chance = _data[arg1].particle_chance;
    return _chance;
}

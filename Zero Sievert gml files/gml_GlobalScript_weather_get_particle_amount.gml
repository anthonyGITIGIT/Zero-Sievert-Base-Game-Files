function weather_get_particle_amount(arg0, arg1)
{
    var _data = weather_get_particle_array(arg0);
    var _chance = _data[arg1].particle_amount;
    return _chance;
}

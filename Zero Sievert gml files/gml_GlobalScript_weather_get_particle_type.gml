function weather_get_particle_type(arg0, arg1)
{
    var _data = weather_get_particle_array(arg0);
    var _type = _data[arg1].particle_type;
    return _type;
}

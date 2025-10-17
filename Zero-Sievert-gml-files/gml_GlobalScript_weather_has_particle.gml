function weather_has_particle(arg0)
{
    var _data = weather_get_particle_array(arg0);
    return array_length(_data) > 0;
}

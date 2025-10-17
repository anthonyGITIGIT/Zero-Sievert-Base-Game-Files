function weather_transition(arg0 = 1, arg1 = false)
{
    weather_add_particle();
    weather_shader(arg0);
    weather_set_radiation(arg1);
}

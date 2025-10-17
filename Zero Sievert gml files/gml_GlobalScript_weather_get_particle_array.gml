function weather_get_particle_array(arg0)
{
    var _data = variable_struct_get(global.weather_data.type, arg0).particle;
    
    if (!is_array(_data))
        _data = [];
    
    return _data;
}

function weather_get_darkness(arg0)
{
    var _data = variable_struct_get(global.weather_data.type, arg0).darkness;
    
    if (is_undefined(_data))
        _data = 0;
    
    return _data;
}

function weather_get_amount_radiation(arg0)
{
    var _data = variable_struct_get(global.weather_data.type, arg0).amount_radiation;
    
    if (is_undefined(_data))
        _data = 0;
    
    return _data;
}

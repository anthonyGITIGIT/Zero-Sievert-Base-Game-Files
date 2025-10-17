function weather_choose_new_weather(arg0)
{
    var _array_pool;
    
    if (instance_exists(obj_meteo_controller))
        _array_pool = variable_struct_get(obj_meteo_controller.weather_pool, arg0);
    else
        _array_pool = ["sun_1", "sun_1"];
    
    var _index = irandom(array_length(_array_pool) - 1);
    return _array_pool[_index];
}

function weather_choose_wind(arg0)
{
    var _array = weather_get_type_wind(arg0);
    return _array[irandom(array_length(_array) - 1)];
}

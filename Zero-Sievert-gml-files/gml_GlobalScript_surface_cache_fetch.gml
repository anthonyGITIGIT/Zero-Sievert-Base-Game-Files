function surface_cache_fetch(arg0)
{
    var _cache = __surface_cache();
    var _surface_data = variable_struct_get(_cache, arg0);
    
    if (_surface_data == undefined)
    {
        _surface_data = new surface_cache_new();
        variable_struct_set(_cache, arg0, _surface_data);
    }
    
    _surface_data.__last_room = room;
    _surface_data.__last_time = current_time;
    return _surface_data;
}

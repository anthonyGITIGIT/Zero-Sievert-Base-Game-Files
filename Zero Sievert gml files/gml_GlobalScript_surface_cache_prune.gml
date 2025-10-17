function surface_cache_prune(arg0 = 1000)
{
    var _cache = __surface_cache();
    var _names_array = variable_struct_get_names(_cache);
    var _i = 0;
    
    repeat (array_length(_names_array))
    {
        var _name = _names_array[_i];
        var _surface_data = variable_struct_get(_cache, _name);
        
        if (!surface_exists(_surface_data.__surface))
        {
            variable_struct_remove(_cache, _name);
        }
        else if ((current_time - _surface_data.__last_time) > arg0)
        {
            surface_free(_surface_data.__surface);
            variable_struct_remove(_cache, _name);
        }
        
        _i++;
    }
}

function weather_map_pool()
{
    weather_pool = {};
    var _array = variable_struct_get_names(global.weather_data.map);
    
    for (var i = 0; i < array_length(_array); i++)
    {
        var _map_macro = _array[i];
        var _array_chance = weather_get_map_pool_array_from_map_macro(_map_macro);
        var _array_pool = [];
        
        for (var j = 0; j < array_length(_array_chance); j++)
        {
            repeat (_array_chance[j].chance)
                array_push(_array_pool, _array_chance[j].id);
        }
        
        variable_struct_set(weather_pool, _map_macro, _array_pool);
    }
}

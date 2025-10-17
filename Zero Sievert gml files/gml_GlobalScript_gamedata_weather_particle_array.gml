function gamedata_weather_particle_array()
{
    global.weather_particle = [];
    var _struct_name_array = variable_struct_get_names(global.weather_data.type);
    
    for (var i = 0; i < array_length(_struct_name_array); i++)
    {
        var _array_part = weather_get_particle_array(_struct_name_array[i]);
        
        for (var j = 0; j < array_length(_array_part); j++)
        {
            var _particle_enum_id = weather_get_GM_particle_enum_id(_struct_name_array[i], j);
            
            if (!weather_particle_array_alrady_in_it(_particle_enum_id))
            {
                var _struct = weather_particle_array_default_struct(_particle_enum_id);
                array_push(global.weather_particle, _struct);
            }
        }
    }
}

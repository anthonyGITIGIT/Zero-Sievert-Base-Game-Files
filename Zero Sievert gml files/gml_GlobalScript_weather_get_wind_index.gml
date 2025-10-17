function weather_get_wind_index()
{
    if (instance_exists(obj_vertex_grass))
        return obj_vertex_grass.wind_index;
    
    return 0;
}

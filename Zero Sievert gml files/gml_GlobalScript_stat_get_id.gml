function stat_get_id(arg0)
{
    if (arg0 < 0)
        return undefined;
    
    if (arg0 >= array_length(global.stat_data_array))
        return undefined;
    
    return global.stat_data_array[arg0];
}

function stat_increment(arg0)
{
    if (!variable_struct_exists(global.stat_data, arg0))
        trace_error("Stat \"", arg0, "\" not recognised");
    
    variable_struct_set(global.stat_value, arg0, (variable_struct_get(global.stat_value, arg0) ?? 0) + 1);
}

function stat_set_value(arg0, arg1)
{
    if (!variable_struct_exists(global.stat_data, arg0))
        trace_error("Stat \"", arg0, "\" not recognised");
    
    variable_struct_set(global.stat_value, arg0, arg1);
}

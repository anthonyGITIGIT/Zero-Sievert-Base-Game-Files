function stat_get_name(arg0)
{
    if (!variable_struct_exists(global.stat_data, arg0))
        trace_error("Stat \"", arg0, "\" not recognised");
    
    return language_get_string_iterative(variable_struct_get(global.stat_data, arg0).name);
}

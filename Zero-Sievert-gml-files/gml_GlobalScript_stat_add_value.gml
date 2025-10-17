function stat_add_value(arg0, arg1)
{
    if (!variable_struct_exists(global.stat_data, arg0))
        trace_error("Stat \"", arg0, "\" not recognised");
    
    arg1 *= difficulty_get("pro_exp_multiplier");
    variable_struct_set(global.stat_value, arg0, (variable_struct_get(global.stat_value, arg0) ?? 0) + arg1);
}

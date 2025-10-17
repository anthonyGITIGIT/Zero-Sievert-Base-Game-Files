function chest_get_chance_legendary(arg0)
{
    var _struct = variable_struct_get(global.chest_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Chest \"", arg0, "\" not recognised");
    
    return _struct.chance_legendary;
}

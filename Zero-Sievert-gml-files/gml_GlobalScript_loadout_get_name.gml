function loadout_get_name(arg0)
{
    var _struct = variable_struct_get(global.loadout_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Loadout \"", arg0, "\" not recognised");
    
    return _struct.name;
}

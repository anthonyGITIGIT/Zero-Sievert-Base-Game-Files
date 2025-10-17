function caliber_get_name(arg0)
{
    var _struct = variable_struct_get(global.caliber_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Caliber \"", arg0, "\" not recognised");
    
    return _struct.name;
}

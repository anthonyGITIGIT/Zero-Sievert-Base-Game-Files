function mod_pos_get_name(arg0)
{
    var _struct = variable_struct_get(global.mod_pos_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Mod position \"", arg0, "\" not recognised");
    
    return _struct.name;
}

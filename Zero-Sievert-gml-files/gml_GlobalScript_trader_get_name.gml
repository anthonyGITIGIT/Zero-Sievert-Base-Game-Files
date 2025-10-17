function trader_get_name(arg0)
{
    var _struct = variable_struct_get(global.trader_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Trader \"", arg0, "\" not recognised");
    
    return _struct.name;
}

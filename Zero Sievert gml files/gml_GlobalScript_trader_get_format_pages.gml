function trader_get_format_pages(arg0)
{
    var _struct = variable_struct_get(global.trader_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Trader \"", arg0, "\" not recognised");
    
    return _struct.format_pages;
}

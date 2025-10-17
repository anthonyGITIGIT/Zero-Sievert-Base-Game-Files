function trader_pages_get_title(arg0)
{
    if (!variable_struct_exists(global.trader_pages_data, arg0))
    {
        trace_error("Trade page alias \"", arg0, "\" not recognised");
        exit;
    }
    
    return variable_struct_get(global.trader_pages_data, arg0).title;
}

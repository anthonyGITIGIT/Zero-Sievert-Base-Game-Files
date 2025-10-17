function trader_pages_get_alias(arg0)
{
    if (arg0 < 0)
    {
        trace_error("Invalid index (", arg0, ")");
        exit;
    }
    
    if (arg0 >= array_length(global.trader_pages_data_array))
    {
        trace_error("Trader page index too large (got ", arg0, ", length of array is ", array_length(global.trader_pages_data_array), ")");
        exit;
    }
    
    return global.trader_pages_data_array[arg0];
}

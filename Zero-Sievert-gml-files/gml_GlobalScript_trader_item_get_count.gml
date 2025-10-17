function trader_item_get_count(arg0)
{
    var _struct = variable_struct_get(global.trader_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Trader \"", arg0, "\" not recognised");
    
    return array_length(_struct.items);
}

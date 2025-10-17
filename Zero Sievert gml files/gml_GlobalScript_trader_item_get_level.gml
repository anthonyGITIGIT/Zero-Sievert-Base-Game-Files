function trader_item_get_level(arg0, arg1)
{
    var _struct = variable_struct_get(global.trader_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Trader \"", arg0, "\" not recognised");
    
    var _item_array = trader_get_item_array(arg0);
    
    if (arg1 < 0)
        trace_error("Trader item index ", arg1, " invalid (must be greater than or equal to 0)");
    
    if (arg1 >= array_length(_item_array))
        trace_error("Trader item index ", arg1, " invalid (must be less than the size of the item array ", array_length(_item_array), ")");
    
    return struct_get_from_hash(array_get(_item_array, arg1), variable_get_hash("level")) ?? 0;
}

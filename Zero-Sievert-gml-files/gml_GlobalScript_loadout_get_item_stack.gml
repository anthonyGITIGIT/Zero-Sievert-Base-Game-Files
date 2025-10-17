function loadout_get_item_stack(arg0, arg1)
{
    var _struct = variable_struct_get(global.loadout_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Loadout \"", arg0, "\" not recognised");
    
    var _array = struct_get_from_hash(_struct, variable_get_hash("items"));
    
    if (!is_array(_array))
        trace_error("Loadout \"", arg0, "\" .item array not found");
    
    if (arg1 < 0)
        trace_error("Trader item index ", arg1, " invalid (must be greater than or equal to 0)");
    
    if (arg1 >= array_length(_array))
        trace_error("Trader item index ", arg1, " invalid (must be less than the size of the item array ", array_length(_array), ")");
    
    return struct_get_from_hash(array_get(_array, arg1), variable_get_hash("stack")) ?? 1;
}

function loadout_get_item_count(arg0)
{
    var _struct = variable_struct_get(global.loadout_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Loadout \"", arg0, "\" not recognised");
    
    var _array = struct_get_from_hash(_struct, variable_get_hash("items"));
    
    if (!is_array(_array))
        trace_error("Loadout \"", arg0, "\" .item array not found");
    
    return array_length(_array);
}

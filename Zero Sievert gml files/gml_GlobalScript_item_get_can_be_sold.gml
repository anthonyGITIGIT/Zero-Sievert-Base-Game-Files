function item_get_can_be_sold(arg0)
{
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("basic"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .basic data");
    
    return struct_get_from_hash(_struct, variable_get_hash("can_be_sold"));
}

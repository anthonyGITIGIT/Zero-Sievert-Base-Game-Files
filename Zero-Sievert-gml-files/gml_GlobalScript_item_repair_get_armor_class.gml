function item_repair_get_armor_class(arg0)
{
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("repair"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .repair data");
    
    var _value = _struct.armor_class;
    return _value;
}

function item_document_get_reputation(arg0)
{
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("document"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .document data");
    
    return _struct.reputation;
}

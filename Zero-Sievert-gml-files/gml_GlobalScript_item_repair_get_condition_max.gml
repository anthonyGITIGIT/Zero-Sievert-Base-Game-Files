function item_repair_get_condition_max(arg0)
{
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("repair"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .repair data");
    
    var _value = _struct.condition_max;
    
    switch (_value)
    {
        case "{weapon low}":
            _value = 60;
            break;
        
        case "{weapon high}":
            _value = 100;
            break;
        
        case "{armor low}":
            _value = 60;
            break;
        
        case "{armor high}":
            _value = 100;
            break;
    }
    
    return _value;
}

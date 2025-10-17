function item_mod_get_laser_color(arg0)
{
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("laser"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .laser data");
    
    var _value = int64(ptr(_struct.color));
    _value = ((_value & 255) << 16) | (_value & 65280) | ((_value & 16711680) >> 16);
    return _value;
}

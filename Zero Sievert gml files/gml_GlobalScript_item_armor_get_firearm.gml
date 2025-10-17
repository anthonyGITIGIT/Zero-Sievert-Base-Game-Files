function item_armor_get_firearm(arg0)
{
    if (!item_fits_category(arg0, "armor"))
        return 0;
    
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("armor"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .armor data");
    
    return _struct.firearm;
}

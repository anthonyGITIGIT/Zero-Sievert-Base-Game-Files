function item_ammo_get_recoil(arg0)
{
    if (!item_exists(arg0))
        return 0;
    
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("ammo"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .ammo data");
    
    return _struct.recoil;
}

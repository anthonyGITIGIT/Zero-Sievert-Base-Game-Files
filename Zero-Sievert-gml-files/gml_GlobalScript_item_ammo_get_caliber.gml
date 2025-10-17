function item_ammo_get_caliber(arg0)
{
    if (!item_exists(arg0))
        return "not_ammo";
    
    if (!item_fits_category(arg0, "ammo"))
        return "not_ammo";
    
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("ammo"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .ammo data");
    
    return _struct.caliber;
}

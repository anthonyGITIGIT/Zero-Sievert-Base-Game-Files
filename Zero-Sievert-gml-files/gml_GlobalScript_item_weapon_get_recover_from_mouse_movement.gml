function item_weapon_get_recover_from_mouse_movement(arg0)
{
    if (!item_fits_category(arg0, "weapon"))
        return undefined;
    
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("weapon"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .weapon data");
    
    var _value = struct_get_from_hash(_struct, variable_get_hash("recover_from_mouse_movement"));
    
    if (_value == undefined)
        trace_error("Item \"", arg0, "\" has no .recover_from_mouse_movement data");
    
    if (_value == "{use_weapon_type}")
    {
        var _type = item_weapon_get_type(arg0);
        _value = glance_get_recover_from_mouse_movement(_type);
    }
    
    return _value;
}

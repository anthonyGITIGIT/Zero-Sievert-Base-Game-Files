function item_weapon_get_bullet_speed(arg0)
{
    if (!item_fits_category(arg0, "weapon"))
        return 0;
    
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("weapon"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .weapon data");
    
    var _value = _struct.bullet_speed;
    
    if (_value == "{standard}")
        _value = 20;
    
    return _value;
}

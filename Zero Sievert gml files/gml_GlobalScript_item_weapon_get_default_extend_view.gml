function item_weapon_get_default_extend_view(arg0)
{
    if (!item_fits_category(arg0, "weapon"))
        return undefined;
    
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("weapon"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .weapon data");
    
    var _value = struct_get_from_hash(_struct, variable_get_hash("default_extend_view"));
    
    if (_value == undefined)
        trace_error("Item \"", arg0, "\" has no .default_extend_view data");
    
    if (_value == "{use_weapon_type}")
    {
        var _type = item_weapon_get_type(arg0);
        _value = glance_get_default_extend_view(_type);
    }
    
    return _value;
}

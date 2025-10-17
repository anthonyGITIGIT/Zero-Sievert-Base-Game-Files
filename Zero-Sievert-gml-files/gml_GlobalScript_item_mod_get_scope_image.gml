function item_mod_get_scope_image(arg0)
{
    if (!item_exists(arg0))
        return s_vuoto;
    
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("weapon_mod"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .weapon_mod data");
    
    if (is_string(_struct.scope_image))
        return variable_struct_get(global.Mods_Sprite_Weapon_Scopes, _struct.scope_image);
    else
        return _struct.scope_image;
}

function item_mod_get_silencer_sound(arg0)
{
    if (!item_exists(arg0))
        return -4;
    
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("weapon_mod"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .weapon_mod data");
    
    if (is_string(_struct.silencer_sound))
        return variable_struct_get(global.Mods_Audio_Data, _struct.silencer_sound);
    else
        return _struct.silencer_sound;
}

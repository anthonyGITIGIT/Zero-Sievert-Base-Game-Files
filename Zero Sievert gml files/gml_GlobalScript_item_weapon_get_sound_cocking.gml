function item_weapon_get_sound_cocking(arg0)
{
    if (!item_fits_category(arg0, "weapon"))
        return -4;
    
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("weapon"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .weapon data");
    
    return variable_struct_get(global.Mods_Audio_Data, _struct.sound_cocking);
}

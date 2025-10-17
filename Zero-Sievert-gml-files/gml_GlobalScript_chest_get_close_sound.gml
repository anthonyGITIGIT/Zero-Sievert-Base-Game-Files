function chest_get_close_sound(arg0)
{
    var _struct = variable_struct_get(global.chest_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Chest \"", arg0, "\" not recognised");
    
    var _chest_sound = _struct.sound_type;
    return variable_struct_get(global.Mods_Audio_Data, variable_struct_get(global.chest_sound_data, _chest_sound).close);
}

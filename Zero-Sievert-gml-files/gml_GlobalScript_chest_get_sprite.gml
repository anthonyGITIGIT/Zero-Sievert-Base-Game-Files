function chest_get_sprite(arg0)
{
    var _struct = variable_struct_get(global.chest_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Chest \"", arg0, "\" not recognised");
    
    if (is_string(_struct.sprite))
        return variable_struct_get(global.Mods_Sprite_Ingame_Data, _struct.sprite);
    else
        return _struct.sprite;
}

function item_backpack_get_sprite(arg0)
{
    if (!item_exists(arg0))
        return s_vuoto;
    
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("backpack"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .backpack data");
    
    if (is_string(_struct.sprite_game))
        return variable_struct_get(global.Mods_Sprite_Backpack_Data, _struct.sprite_game);
    else
        return _struct.sprite_game;
}

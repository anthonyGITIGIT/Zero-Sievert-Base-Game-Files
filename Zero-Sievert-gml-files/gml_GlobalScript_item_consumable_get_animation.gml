function item_consumable_get_animation(arg0)
{
    var _struct = variable_struct_get(global.item_data, arg0);
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" not recognised");
    
    _struct = struct_get_from_hash(_struct, variable_get_hash("consumable"));
    
    if (!is_struct(_struct))
        trace_error("Item \"", arg0, "\" has no .consumable data");
    
    if (is_string(_struct.animation))
        return variable_struct_get(global.Mods_Sprite_Consumable_Animation_Data, _struct.animation);
    else
        return _struct.animation;
}

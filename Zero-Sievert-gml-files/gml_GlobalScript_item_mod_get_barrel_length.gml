function item_mod_get_barrel_length(arg0)
{
    if (item_mod_get_type(arg0) != "barrel")
        trace_error("Item \"", arg0, "\" is not a barrel weapon mod");
    
    return sprite_get_width(item_get_sprite_ingame(arg0));
}

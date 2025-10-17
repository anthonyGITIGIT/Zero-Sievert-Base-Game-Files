function trader_pages_get_sprite(arg0)
{
    if (!variable_struct_exists(global.trader_pages_data, arg0))
    {
        trace_error("Trade page alias \"", arg0, "\" not recognised");
        exit;
    }
    
    var _sprite = asset_get_index(variable_struct_get(global.trader_pages_data, arg0).sprite);
    return sprite_exists(_sprite) ? _sprite : s_vuoto;
}

function loot_draw_on_grid(arg0, arg1, arg2, arg3 = undefined, arg4 = 4, arg5 = 16777215, arg6 = 1)
{
    if (!is_struct(arg0))
        exit;
    
    var _width = loot_get_sprite_width(arg0, arg3);
    var _height = loot_get_sprite_height(arg0, arg3);
    var _grid_width = 16 * ceil(_width / 16);
    var _grid_height = 16 * ceil(_height / 16);
    arg1 += (0.5 * arg4 * (_grid_width - _width));
    arg2 += (0.5 * arg4 * (_grid_height - _height));
    return loot_draw(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
}

function loot_draw_centred(arg0, arg1, arg2, arg3 = undefined, arg4 = 4, arg5 = 16777215, arg6 = 1)
{
    if (!is_struct(arg0))
        exit;
    
    arg1 -= (0.5 * arg4 * loot_get_sprite_width(arg0));
    arg2 -= (0.5 * arg4 * loot_get_sprite_height(arg0));
    return loot_draw(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
}

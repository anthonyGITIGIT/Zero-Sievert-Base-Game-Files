function item_draw(arg0, arg1, arg2, arg3 = 4)
{
    if (!item_exists(arg0))
        exit;
    
    draw_sprite_ext(item_get_sprite_inv(arg0), 0, arg1, arg2, arg3, arg3, 0, c_white, 1);
}

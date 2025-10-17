function scr_draw_minimap_pixel(arg0, arg1, arg2, arg3)
{
    var s_ = arg0;
    var xx = arg1;
    var yy = arg2;
    var cc = arg3;
    var a = 0.1;
    draw_sprite_ext(s_, 0, xx * 1, yy * 1, 1, 1, 0, cc, 1);
    draw_sprite_ext(s_, 0, (xx - 1) * 1, yy * 1, 1, 1, 0, cc, a);
    draw_sprite_ext(s_, 0, (xx + 1) * 1, yy * 1, 1, 1, 0, cc, a);
    draw_sprite_ext(s_, 0, xx * 1, (yy - 1) * 1, 1, 1, 0, cc, a);
    draw_sprite_ext(s_, 0, xx * 1, (yy + 1) * 1, 1, 1, 0, cc, a);
}

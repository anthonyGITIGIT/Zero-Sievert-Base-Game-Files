function scr_draw_text_outlined_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7)
{
    var xx = arg0 + global.language_font_offset.x;
    var yy = arg1 + global.language_font_offset.y;
    var t = arg2;
    var c1 = arg3;
    var c2 = arg4;
    var s = arg5;
    var o = arg6;
    var _a = arg7;
    draw_text_transformed_color(xx + o, yy, t, s, s, 0, c2, c2, c2, c2, _a);
    draw_text_transformed_color(xx - o, yy, t, s, s, 0, c2, c2, c2, c2, _a);
    draw_text_transformed_color(xx - o, yy - o, t, s, s, 0, c2, c2, c2, c2, _a);
    draw_text_transformed_color(xx + o, yy - o, t, s, s, 0, c2, c2, c2, c2, _a);
    draw_text_transformed_color(xx - o, yy + o, t, s, s, 0, c2, c2, c2, c2, _a);
    draw_text_transformed_color(xx + o, yy + o, t, s, s, 0, c2, c2, c2, c2, _a);
    draw_text_transformed_color(xx, yy + o, t, s, s, 0, c2, c2, c2, c2, _a);
    draw_text_transformed_color(xx, yy - o, t, s, s, 0, c2, c2, c2, c2, _a);
    draw_text_transformed_color(xx, yy, t, s, s, 0, c1, c1, c1, c1, _a);
}

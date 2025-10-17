function scr_draw_ui_horizontal_progress_bar()
{
    var _value = clamp(value, 0, 1);
    draw_sprite_stretched_ext(s_1pixel, 0, __drawLeft, __drawTop, __localRight - __localLeft, __localBottom - __localTop, colour_outside, 1);
    draw_sprite_stretched_ext(s_1pixel, 0, __drawLeft + border, __drawTop + border, (__localRight - __localLeft - (border * 2)) * value, __localBottom - __localTop - (border * 2), colour_inside, 1);
}

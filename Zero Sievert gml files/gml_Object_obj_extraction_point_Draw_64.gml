display_set_gui_size(480, 270);

if (timer_exit > 0 && player_get_local_hp() > 0 && draw_timer == true)
{
    language_set_font(UnknownEnum.Value_0);
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    var _text = language_get_string("Extract time");
    _text = string_replace(_text, "[TIME_REMAINING]", string_format((timer_exit_max - timer_exit) / 60, 0, 2));
    var _x = 187 + global.language_font_offset.x;
    var _y = 95 + global.language_font_offset.y;
    draw_set_colour(#191B19);
    draw_text_transformed(_x + 2, _y, _text, 2, 2, 0);
    draw_text_transformed(_x - 2, _y, _text, 2, 2, 0);
    draw_text_transformed(_x - 2, _y - 2, _text, 2, 2, 0);
    draw_text_transformed(_x + 2, _y - 2, _text, 2, 2, 0);
    draw_text_transformed(_x - 2, _y + 2, _text, 2, 2, 0);
    draw_text_transformed(_x + 2, _y + 2, _text, 2, 2, 0);
    draw_text_transformed(_x, _y + 2, _text, 2, 2, 0);
    draw_text_transformed(_x, _y - 2, _text, 2, 2, 0);
    draw_set_colour(c_lime);
    draw_text_transformed(_x, _y, _text, 2, 2, 0);
    draw_set_colour(c_white);
}

display_set_gui_size(480, 270);

enum UnknownEnum
{
    Value_0
}

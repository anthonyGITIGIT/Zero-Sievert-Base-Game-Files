language_set_font(UnknownEnum.Value_0);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

if (counter < string_length(t))
    counter += text_speed;

if (counter >= (string_length(t) - 2) && counter < (string_length(t) - 1))
    alarm[0] = text_timer;

var sub_t = string_copy(t, 1, ceil(counter));
var c2 = 0;
var c1 = 16777215;
scr_draw_text_outlined(x + global.language_font_offset.x, (y + global.language_font_offset.y) - 24, sub_t, c1, c2, 1, 1);

enum UnknownEnum
{
    Value_0
}

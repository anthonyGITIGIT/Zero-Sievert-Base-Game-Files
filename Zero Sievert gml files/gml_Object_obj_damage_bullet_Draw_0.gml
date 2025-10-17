language_set_font(UnknownEnum.Value_0);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
var _value = dmg;

if (round_value)
    _value = round(dmg);

draw_text(x + global.language_font_offset.x, y + global.language_font_offset.y + draw_y, language_get_string(text) + " " + language_get_string(string(_value)));

enum UnknownEnum
{
    Value_0
}

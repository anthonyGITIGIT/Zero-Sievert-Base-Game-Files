function scr_draw_text_sopra_character(arg0, arg1)
{
    var id_ = arg0;
    var t = arg1;
    language_set_font(UnknownEnum.Value_0);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    var cc = 15063770;
    var cc2 = 1710618;
    draw_text_color(id_.x + global.language_font_offset.x, (id_.y + global.language_font_offset.y) - 18, t, cc2, cc2, cc2, cc2, 1);
    draw_text_color(id_.x + global.language_font_offset.x, (id_.y + global.language_font_offset.y) - 19, t, cc, cc, cc, cc, 1);
}

enum UnknownEnum
{
    Value_0
}

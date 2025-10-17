display_set_gui_size(480, 270);

if (state == UnknownEnum.Value_8)
{
    draw_rectangle_color(-1, -1, 481, cinema_h / 2, c_black, c_black, c_black, c_black, false);
    draw_rectangle_color(-1, 270 - (cinema_h * 1.5), 481, 271, c_black, c_black, c_black, c_black, false);
    language_set_font(UnknownEnum.Value_0);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    
    if (!obj_gamepad.last_input_keyboard)
    {
        var _str = language_get_string("skip");
        var _str_w = string_width(_str);
        draw_text(240 + global.language_font_offset.x, (270 - cinema_h) + global.language_font_offset.y, _str);
        draw_gamepad_action_button(UnknownEnum.Value_6, 240 - (_str_w / 2) - 8, (270 - cinema_h) + 7, 1, false);
    }
    else
    {
        draw_text(240 + global.language_font_offset.x, (270 - cinema_h) + global.language_font_offset.y, "[SPACE] " + language_get_string("skip"));
    }
    
    if (skip_go == true)
    {
        if (skip_alpha > 0)
        {
            draw_set_alpha(skip_alpha);
            draw_rectangle_color(-1, -1, 481, 271, c_black, c_black, c_black, c_black, false);
            draw_set_alpha(1);
        }
    }
}

if (state == UnknownEnum.Value_9)
{
    if (skip_go == true)
    {
        if (skip_alpha > 0)
        {
            draw_set_alpha(skip_alpha);
            draw_rectangle_color(-1, -1, 481, 271, c_black, c_black, c_black, c_black, false);
            draw_set_alpha(1);
        }
    }
}

display_set_gui_size(1920, 1080);

enum UnknownEnum
{
    Value_0,
    Value_6 = 6,
    Value_8 = 8,
    Value_9
}

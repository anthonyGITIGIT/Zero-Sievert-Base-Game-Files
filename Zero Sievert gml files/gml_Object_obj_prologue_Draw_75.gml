if (instance_exists(obj_map_generator) && obj_map_generator.state == UnknownEnum.Value_21 && screen_alpha > 0)
{
    var _col = 0;
    draw_set_alpha(screen_alpha);
    draw_rectangle_color(-10, -10, 490, 280, _col, _col, _col, _col, false);
    draw_set_alpha(1);
    
    if (state == UnknownEnum.Value_1 || state == UnknownEnum.Value_2)
    {
        language_set_font(UnknownEnum.Value_0);
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        
        if (text_counter < string_length(text_now))
            text_counter += text_speed;
        
        var sub_t = string_copy(text_now, 1, ceil(text_counter));
        draw_text(240, 135, sub_t);
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_21 = 21
}

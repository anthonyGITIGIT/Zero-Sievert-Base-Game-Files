display_set_gui_size(480, 270);

if (obj_map_generator.state != UnknownEnum.Value_21)
{
    var c1 = 0;
    draw_rectangle_color(-1, -1, 481, 271, c1, c1, c1, c1, false);
    var _image = s_vuoto;
    
    switch (obj_map_generator.area)
    {
        case UnknownEnum.Value_1:
            _image = s_loading_forest;
            break;
        
        case UnknownEnum.Value_2:
            _image = s_loading_makeshift_camp;
            break;
        
        case UnknownEnum.Value_3:
            _image = s_loading_industrial_area;
            break;
        
        case UnknownEnum.Value_4:
            _image = s_loading_swamp;
            break;
        
        case UnknownEnum.Value_6:
            _image = s_loading_mall;
            break;
        
        case UnknownEnum.Value_8:
            _image = s_loading_zakov;
            break;
    }
    
    display_set_gui_size(1920, 1080);
    draw_sprite(_image, 0, 0, 0);
    display_set_gui_size(480, 270);
    var bar_sprite = s_hud_loading_bar_2;
    var step_max = UnknownEnum.Value_20;
    var step = obj_map_generator.state;
    var barw = sprite_get_width(bar_sprite);
    var barh = sprite_get_height(bar_sprite);
    var barx = 240 - (barw / 2);
    var bary = 240;
    var c2 = 16777215;
    var _off = 7;
    c1 = 0;
    draw_set_alpha(0.5);
    draw_rectangle_color(0, bary - (_off * 1.5), 480, bary + barh + _off, c1, c1, c1, c1, false);
    draw_set_alpha(1);
    draw_sprite_ext(bar_sprite, 0, barx, bary, 1, 1, 0, c_white, 1);
    var step_now = (barw * step) / step_max;
    draw_sprite_part(bar_sprite, 1, 0, 0, step_now, barh, barx, bary);
    var t_ = "";
    
    switch (obj_map_generator.state)
    {
        case UnknownEnum.Value_0:
            t_ = "Preparing";
            break;
        
        case UnknownEnum.Value_1:
            t_ = "Generating tearrain";
            break;
        
        case UnknownEnum.Value_2:
            t_ = "Generating railroad and road";
            break;
        
        case UnknownEnum.Value_3:
            t_ = "Generating terrain variants";
            break;
        
        case UnknownEnum.Value_4:
            t_ = "Autotiling of the road and railroad";
            break;
        
        case UnknownEnum.Value_5:
            t_ = "Choosing train's stop position";
            break;
        
        case UnknownEnum.Value_6:
            t_ = "General grid adjustment";
            break;
        
        case UnknownEnum.Value_7:
            t_ = "Generating water";
            break;
        
        case UnknownEnum.Value_8:
            t_ = "Autotiling of the terrain";
            break;
        
        case UnknownEnum.Value_9:
            t_ = "Generating solid object";
            break;
        
        case UnknownEnum.Value_10:
            t_ = "Placing building - may take a while";
            break;
        
        case UnknownEnum.Value_11:
            t_ = "Placing building - may take a while";
            break;
        
        case UnknownEnum.Value_12:
            t_ = "Generating environment";
            break;
        
        case UnknownEnum.Value_13:
            t_ = "General adjustment";
            break;
        
        case UnknownEnum.Value_14:
            t_ = "Quest generation";
            break;
        
        case UnknownEnum.Value_15:
            t_ = "Generating dynamic grass";
            break;
        
        case UnknownEnum.Value_16:
            t_ = "Generating shadows and minimap";
            break;
        
        case UnknownEnum.Value_17:
            t_ = "Generate Dynamic NPC";
            break;
        
        case UnknownEnum.Value_18:
            t_ = "Calculating dynamic NPC path";
            break;
        
        case UnknownEnum.Value_19:
            t_ = "Almost ready";
            break;
        
        case UnknownEnum.Value_20:
            break;
    }
    
    language_set_font(UnknownEnum.Value_0);
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    c2 = 16777215;
    draw_text_color(barx + global.language_font_offset.x, (bary + global.language_font_offset.y) - 8, language_get_string(t_) + "...", c2, c2, c2, c2, 1);
    language_set_font(UnknownEnum.Value_0);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_alpha(0.5);
    c2 = 16777215;
    var _text = text_split(language_get_string(global.suggerimento_text[tip]), 400, true);
    draw_rectangle_color(0, (215 + global.language_font_offset.y) - string_height(_text) - 4, 480, 215 + global.language_font_offset.y, c1, c1, c1, c1, false);
    draw_set_alpha(1);
    draw_text_color(240 + global.language_font_offset.x, (215 + global.language_font_offset.y) - (string_height(_text) * 0.5), _text, c2, c2, c2, c2, 1);
}

if (obj_map_generator.state == UnknownEnum.Value_20)
{
    language_set_font(UnknownEnum.Value_0);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    var c2 = 16777215;
    var _text = language_get_string("continue");
    
    if (!obj_gamepad.last_input_keyboard)
    {
        var _str_w = string_width(_text);
        var _str_h = string_height(_text);
        draw_set_color(c_black);
        draw_set_alpha(0.5);
        draw_rectangle(232 - (_str_w / 2) - 12, (67.5 + global.language_font_offset.y) - (_str_h * 0.5) - 4, 240 + global.language_font_offset.x + (_str_w * 0.5) + 4, 67.5 + global.language_font_offset.y + (_str_h * 0.5) + 2, false);
        draw_set_color(c_white);
        draw_set_alpha(1);
        draw_gamepad_action_button(UnknownEnum.Value_6, 232 - (_str_w / 2), 66.5, 1, false);
    }
    else
    {
        _text = "[Space] " + _text;
        var _str_w = string_width(_text);
        var _str_h = string_height(_text);
        draw_set_color(c_black);
        draw_set_alpha(0.5);
        draw_rectangle((240 + global.language_font_offset.x) - (_str_w * 0.5) - 4, (67.5 + global.language_font_offset.y) - (_str_h * 0.5) - 4, 240 + global.language_font_offset.x + (_str_w * 0.5) + 4, 67.5 + global.language_font_offset.y + (_str_h * 0.5) + 2, false);
        draw_set_color(c_white);
        draw_set_alpha(1);
    }
    
    draw_text_color(240 + global.language_font_offset.x, 67.5 + global.language_font_offset.y, _text, c2, c2, c2, c2, 1);
}

if (obj_map_generator.state == UnknownEnum.Value_21)
{
    var c1 = 0;
    draw_set_alpha(alpha_screen);
    draw_rectangle_color(0, 0, 480, 270, c1, c1, c1, c1, false);
    draw_set_alpha(1);
}

if (global.general_debug)
{
    language_set_font(UnknownEnum.Value_0);
    draw_set_halign(fa_right);
    draw_set_valign(fa_top);
    draw_text(400 + global.language_font_offset.x, 1 + global.language_font_offset.y, "seed: " + string(global.map_seed));
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

display_set_gui_size(1920, 1080);

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21
}

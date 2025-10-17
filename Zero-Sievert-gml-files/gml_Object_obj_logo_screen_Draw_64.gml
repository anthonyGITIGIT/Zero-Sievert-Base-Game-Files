draw_clear(c_black);
var _video_state = video_draw();
var _video_status = _video_state[0];

if (_video_status == 0 && surface_exists(_video_state[1]))
    draw_surface(_video_state[1], 0, 0);

if (show_prompt)
    prompt_alpha = clamp(prompt_alpha + 0.1, 0, 1);
else
    prompt_alpha = clamp(prompt_alpha - 0.05, 0, 1);

if (global.is_steamdeck)
{
    if (prompt_alpha == 0 && prompt_seen == false)
        draw_sprite(spr_videoreplacement_splashscreen, 0, 0, 0);
}

if (prompt_alpha > 0)
    prompt_seen = true;

bar_x = (display_get_gui_width() / 2) - (bar_width / 2);
bar_y = display_get_gui_height() - 180;
display_set_gui_size(1920, 1080);

if (fade_out)
    draw_set_alpha(prompt_alpha);

draw_set_colour(c_white);
draw_rectangle(bar_x - 4, bar_y - 4, bar_x + bar_width + 4, bar_y + bar_height + 4, false);
draw_healthbar(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, (phase / final_phase) * 100, c_black, c_white, c_white, 0, true, false);
draw_set_alpha(prompt_alpha);

if (phase >= final_phase)
{
    var _text_y = floor(bar_y + (bar_height / 2)) + 8;
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    language_set_font(UnknownEnum.Value_0);
    draw_set_colour(c_black);
    var _text = language_get_string("continue");
    
    if (!obj_gamepad.last_input_keyboard || global.is_steamdeck)
    {
        var _str_w = string_width(_text) * 4;
        draw_gamepad_action_button(UnknownEnum.Value_6, floor(display_get_gui_width() / 2) - 30 - (_str_w / 2), _text_y - 6, 4, false);
    }
    else
    {
        _text = "[Space] " + _text;
    }
    
    draw_text_transformed(floor(display_get_gui_width() / 2) + global.language_font_offset.x, _text_y + global.language_font_offset.y, _text, 4, 4, 0);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

draw_set_alpha(1);

if (logo_fade_in)
{
    logo_fade_in_dec += 0.05;
    logo_fade_in_dec = clamp(logo_fade_in_dec, 0, 1);
    draw_sprite_ext(s_zs_title_main_menu, 0, display_get_gui_width() / 2, 400, 1, 1, 0, c_white, min(logo_fade_in_dec, prompt_alpha));
}

draw_set_colour(c_white);

enum UnknownEnum
{
    Value_0,
    Value_6 = 6
}

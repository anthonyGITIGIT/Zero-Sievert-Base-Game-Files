var _left = use_left;
var _top = use_top;
var _bg_colour_to_use = gui_hover ? display_background_colour_hover : display_background_colour;
draw_set_colour(_bg_colour_to_use);
draw_set_alpha(0.5);
draw_rectangle(_left, _top, _left + display_width, _top + display_height, false);
draw_set_alpha(1);
var _text_running_x = _left + display_margin_left;
var _text_running_y = _top + display_margin_top;
var _text_new_mod = "New Mod Found:";
draw_set_font(font_death_screen);
draw_set_colour(c_yellow);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(_text_running_x, _text_running_y, _text_new_mod);
draw_set_colour(c_white);

if (mod_name != "")
    draw_text(_text_running_x + string_width(_text_new_mod) + 5, _text_running_y, mod_name);

_text_running_y += 32;

if (error)
{
    draw_text(_text_running_x, _text_running_y, "Contents of mod was not as expected.");
    _text_running_y += 27;
}

if (error_string != "")
{
    draw_text(_text_running_x, _text_running_y, error_string);
    _text_running_y += 27;
}

if (note_string != "")
{
}

if (download_status == 1)
{
    draw_text(_text_running_x, _text_running_y, download_string);
    _text_running_y += 27;
}

var _bar_colour = 65535;

if (mod_status == 2)
    _bar_colour = 16777215;

if (mod_status != 2)
{
    var _text = "Unknown Status";
    
    switch (install_status)
    {
        case 0:
            _text = "Downloading...";
            break;
        
        case 1:
            _text = "Processing...";
            break;
        
        case 2:
            _text = "Extracting...";
            break;
        
        case 3:
            _text = "Installing...";
            break;
    }
}
else
{
    draw_text(_text_running_x, _text_running_y, "Successfully installed!");
    _text_running_y += 27;
}

var _bar_y = (_top + display_height) - 20;
draw_healthbar(_text_running_x, _bar_y, _text_running_x + 375, _bar_y + 8, download_decimal * 100, c_black, _bar_colour, _bar_colour, 0, true, true);

if (mod_status != 2)
{
    var _cycle_x = _left + 38;
    var _cycle_y = _top + (display_height / 2);
    var _dist = 18;
    var _square_size = 4;
    var _square_size_half = _square_size / 2;
    var _angle = current_time / 8;
    draw_set_colour(c_white);
    var _square_x = lengthdir_x(_dist, _angle);
    var _square_y = lengthdir_y(_dist, _angle);
    draw_rectangle((_cycle_x + _square_x) - _square_size, (_cycle_y + _square_y) - _square_size, _cycle_x + _square_x + _square_size, _cycle_y + _square_y + _square_size, false);
    _square_x = lengthdir_x(_dist, _angle + 90);
    _square_y = lengthdir_y(_dist, _angle + 90);
    draw_rectangle((_cycle_x + _square_x) - _square_size, (_cycle_y + _square_y) - _square_size, _cycle_x + _square_x + _square_size, _cycle_y + _square_y + _square_size, false);
    _square_x = lengthdir_x(_dist, _angle + 180);
    _square_y = lengthdir_y(_dist, _angle + 180);
    draw_rectangle((_cycle_x + _square_x) - _square_size, (_cycle_y + _square_y) - _square_size, _cycle_x + _square_x + _square_size, _cycle_y + _square_y + _square_size, false);
    _square_x = lengthdir_x(_dist, _angle + 270);
    _square_y = lengthdir_y(_dist, _angle + 270);
    draw_rectangle((_cycle_x + _square_x) - _square_size, (_cycle_y + _square_y) - _square_size, _cycle_x + _square_x + _square_size, _cycle_y + _square_y + _square_size, false);
}
else
{
    var _tick_x = _left + 38;
    var _tick_y = _top + (display_height / 2);
    draw_sprite(s_menu_ugc_tick, 0, _tick_x, _tick_y);
}

var _player = player_get_local();
var _current_ammo = player_loadout_get_ammo_item(_player, _player.weapon_slot_now);
display_set_gui_size(480, 270);
var _draw_x = display_get_gui_width() / 2;
var _draw_y = display_get_gui_height() / 2;
draw_sprite_ext(s_radial_bg, 0, _draw_x, _draw_y, 1, 1, 0, c_gray, 0.7);

if (obj_gamepad.input_value[UnknownEnum.Value_26])
    draw_sprite_ext(s_radial_part, 0, _draw_x, _draw_y, 1, 1, obj_gamepad.input_decimal[UnknownEnum.Value_27] - 90, c_black, 0.2);

if (current_selected != -1)
{
    draw_sprite_ext(s_radial_part, 0, _draw_x, _draw_y, 1, 1, (current_selected * angle_of_option) - 90, c_red, 1);
    
    if (current_selected > -1 && current_selected < array_length(options_data) && !is_undefined(options_data[current_selected]))
    {
        var _this_option = options_data[current_selected];
        
        if (_this_option.text != "" && !is_undefined(_this_option.icon_sprite))
        {
            var _use_text = _this_option.text;
            var _ammo_now = _this_option.arg_in == _current_ammo;
            
            if (_ammo_now)
                _use_text = language_get_string("Current:") + " " + _use_text;
            
            scr_draw_text_outlined(_draw_x, _draw_y + 43, _use_text, 9564927, 0, 1, 1);
        }
    }
}

var _icon_dist = 31;
var _count = array_length(options_data);

for (var i = 0; i < _count; i++)
{
    var _this_option = options_data[i];
    var _ammo_now = _this_option.arg_in == _current_ammo;
    
    if (_ammo_now)
    {
        shader_set(shd_gray);
        shader_set_uniform_f(shader_gray_uniform, 1);
    }
    
    if (!is_undefined(_this_option) && !is_undefined(_this_option.icon_sprite))
    {
        var _use_scale = 0.4;
        var _offset_x = _this_option.sprite_x;
        var _offset_y = _this_option.sprite_y;
        draw_sprite_ext(_this_option.icon_sprite, 0, (_draw_x + lengthdir_x(_icon_dist, i * angle_of_option)) - _offset_x, (_draw_y + lengthdir_y(_icon_dist, i * angle_of_option)) - _offset_y, _use_scale * _this_option.sprite_scale, _use_scale * _this_option.sprite_scale, 0, c_white, 1);
    }
    
    if (!is_undefined(_this_option.icon_struct))
    {
        var _offset_x = 7;
        var _offset_y = 7;
        loot_draw_in_area(_this_option.icon_struct, (_draw_x + lengthdir_x(_icon_dist, i * angle_of_option)) - _offset_x, (_draw_y + lengthdir_y(_icon_dist, i * angle_of_option)) - _offset_y, 14, 14);
    }
    
    if (_ammo_now)
        shader_reset();
}

display_set_gui_size(1920, 1080);

enum UnknownEnum
{
    Value_26 = 26,
    Value_27
}

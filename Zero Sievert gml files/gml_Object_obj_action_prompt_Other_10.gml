if (!settings_get("display_ftue"))
    exit;

language_set_font(UnknownEnum.Value_0);
draw_set_valign(fa_top);
var _count_of_controls = 0;
var _longest_width_left = 0;
var _longest_width_right = 0;
var _array_of_controls = [];

if (player_local_state_is(scr_player_state_inventory) && (global.Dragging_Loot_Struct == undefined || global.Dragging_Loot_Struct.__stateDragging == false))
{
    for (var i = 0; i < UnknownEnum.Value_12; i++)
    {
        if ((screen[i] == UnknownEnum.Value_0 && !ui_trader_is_open()) || (screen[i] == UnknownEnum.Value_2 && ui_trader_is_open()))
        {
            if (type[i] == UnknownEnum.Value_0 || (type[i] == UnknownEnum.Value_1 && !!obj_gamepad.last_input_keyboard) || (type[i] == UnknownEnum.Value_2 && !obj_gamepad.last_input_keyboard))
            {
                _array_of_controls[_count_of_controls] = i;
                _count_of_controls++;
                _longest_width_left = max(_longest_width_left, string_width("[" + language_get_string(scr_key_map(global.kb_now[action[i]])) + "]"));
                _longest_width_right = max(_longest_width_right, string_width(language_get_string(text[i])));
            }
        }
    }
}

if (player_local_state_is(scr_player_state_inventory) && global.Dragging_Loot_Struct != undefined && global.Dragging_Loot_Struct.__stateDragging == true)
{
    for (var i = 0; i < UnknownEnum.Value_12; i++)
    {
        if ((screen[i] == UnknownEnum.Value_1 && !ui_trader_is_open()) || (screen[i] == UnknownEnum.Value_3 && ui_trader_is_open()))
        {
            if (type[i] == UnknownEnum.Value_0 || (type[i] == UnknownEnum.Value_1 && !!obj_gamepad.last_input_keyboard) || (type[i] == UnknownEnum.Value_2 && !obj_gamepad.last_input_keyboard))
            {
                _array_of_controls[_count_of_controls] = i;
                _count_of_controls++;
                _longest_width_left = max(_longest_width_left, string_width("[" + language_get_string(scr_key_map(global.kb_now[action[i]])) + "]"));
                _longest_width_right = max(_longest_width_right, string_width(language_get_string(text[i])));
            }
        }
    }
}

if (player_local_state_is(scr_player_state_talk) && __uiGlobal().__defaultOnion.HasInputReceiver() && uiGetData().quest_open && uiGetData().quest_reward_hover)
{
    for (var i = 0; i < UnknownEnum.Value_12; i++)
    {
        if (screen[i] == UnknownEnum.Value_6)
        {
            if (type[i] == UnknownEnum.Value_0 || (type[i] == UnknownEnum.Value_1 && !!obj_gamepad.last_input_keyboard) || (type[i] == UnknownEnum.Value_2 && !obj_gamepad.last_input_keyboard))
            {
                _array_of_controls[_count_of_controls] = i;
                _count_of_controls++;
                _longest_width_left = max(_longest_width_left, string_width("[" + language_get_string(scr_key_map(global.kb_now[action[i]])) + "]"));
                _longest_width_right = max(_longest_width_right, string_width(language_get_string(text[i])));
            }
        }
    }
}

uiGetData().quest_open = false;
uiGetData().quest_reward_hover = false;

if (is_in_raid() && player_local_state_is(scr_player_state_pda) && __uiGlobal().__defaultOnion.HasInputReceiver())
{
    var _minimap = uiFindRelaxed(uiLayerGetRoot("pda layer"), "minimap scroll box");
    
    if (_minimap != undefined)
    {
        var _over_marker = false;
        var _array = uiFindAllType(_minimap, "class_ui_minimap_custom_marker");
        var _i = 0;
        
        repeat (array_length(_array))
        {
            var _marker = _array[_i];
            
            if (_marker.__stateHover)
            {
                _over_marker = true;
                break;
            }
            
            _i++;
        }
        
        var _selection_to_use = _over_marker ? UnknownEnum.Value_5 : UnknownEnum.Value_4;
        
        for (var i = 0; i < UnknownEnum.Value_12; i++)
        {
            if (screen[i] == _selection_to_use)
            {
                if (type[i] == UnknownEnum.Value_0 || (type[i] == UnknownEnum.Value_1 && !!obj_gamepad.last_input_keyboard) || (type[i] == UnknownEnum.Value_2 && !obj_gamepad.last_input_keyboard))
                {
                    _array_of_controls[_count_of_controls] = i;
                    _count_of_controls++;
                    _longest_width_left = max(_longest_width_left, string_width("[" + language_get_string(scr_key_map(global.kb_now[action[i]])) + "]"));
                    _longest_width_right = max(_longest_width_right, string_width(language_get_string(text[i])));
                }
            }
        }
    }
}

if (_count_of_controls > 0)
{
    _longest_width_left += 6;
    var _width = _longest_width_left + _longest_width_right + 8;
    var _height_row = 12;
    var _height = (_height_row * _count_of_controls) + 1;
    var _border = 4;
    var _icon_offset_h = 8;
    var _icon_offset_v = 5;
    
    if (!obj_gamepad.last_input_keyboard)
    {
        _width -= _longest_width_left;
        _width += 12;
    }
    
    var _draw_at_x = 480 - _width;
    var _draw_at_y = 270 - _height;
    
    if (ui_stash_is_open() || ui_trader_is_open())
        _draw_at_x = 240 - (_width / 2);
    
    var _dat = uiGetData();
    
    if (!_dat.tooltip_open || !rectangle_in_rectangle(_draw_at_x * 4, _draw_at_y * 4, ((_draw_at_x + _width) - _border) * 4, ((_draw_at_y + _height) - _border) * 4, _dat.tooltip_tl_x, _dat.tooltip_tl_y, _dat.tooltip_br_x, _dat.tooltip_br_y))
    {
        scr_draw_box(s_box_testo_pop_up, _draw_at_x, _draw_at_y, _width - _border, _height - _border, 1);
        
        if (!obj_gamepad.last_input_keyboard)
        {
            for (var i = 0; i < _count_of_controls; i++)
            {
                var _lookup_id = _array_of_controls[i];
                draw_gamepad_action_button(action[_lookup_id], _draw_at_x + _icon_offset_h, _draw_at_y + (_height_row * i) + _icon_offset_v, 1, false);
                draw_text(_draw_at_x + 15, (_draw_at_y + (_height_row * i)) - 2, language_get_string(text[_lookup_id]));
            }
        }
        else
        {
            for (var i = 0; i < _count_of_controls; i++)
            {
                var _lookup_id = _array_of_controls[i];
                var _str = "[" + language_get_string(scr_key_map(global.kb_now[action[_lookup_id]])) + "]";
                draw_set_color(#FFF291);
                draw_set_halign(fa_right);
                draw_text((_draw_at_x + _longest_width_left) - 5, (_draw_at_y + (_height_row * i)) - 2, _str);
                draw_set_color(c_white);
                draw_set_halign(fa_left);
                draw_text(_draw_at_x + _longest_width_left, (_draw_at_y + (_height_row * i)) - 2, language_get_string(text[_lookup_id]));
            }
        }
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_12 = 12
}

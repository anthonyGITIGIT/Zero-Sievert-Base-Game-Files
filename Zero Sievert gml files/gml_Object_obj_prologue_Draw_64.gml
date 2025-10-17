if (global.general_debug)
{
    language_set_font(UnknownEnum.Value_0);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    var _x = 10;
    var _y = 150;
    var _h = 10;
    var _i = 0;
    var _t_state = "";
    
    switch (state)
    {
        case UnknownEnum.Value_0:
            _t_state = "black_screen";
            break;
        
        case UnknownEnum.Value_1:
            _t_state = "text_wake_up_1";
            break;
        
        case UnknownEnum.Value_2:
            _t_state = "text_wake_up_2";
            break;
        
        case UnknownEnum.Value_3:
            _t_state = "fade_in";
            break;
        
        case UnknownEnum.Value_4:
            _t_state = "npc_introduction";
            break;
        
        case UnknownEnum.Value_5:
            _t_state = "wolves_growl";
            break;
        
        case UnknownEnum.Value_6:
            _t_state = "npc_grab_a_gun";
            break;
        
        case UnknownEnum.Value_7:
            _t_state = "reload_gun";
            break;
        
        case UnknownEnum.Value_9:
            _t_state = "wolves_attack_spawn_enemies";
            break;
        
        case UnknownEnum.Value_10:
            _t_state = "check_if_wolves_alive";
            break;
        
        case UnknownEnum.Value_11:
            _t_state = "npc_hit";
            break;
        
        case UnknownEnum.Value_12:
            _t_state = "player_look_for_medical_box";
            break;
        
        case UnknownEnum.Value_13:
            _t_state = "player_loot_medical_box";
            break;
        
        case UnknownEnum.Value_14:
            _t_state = "player_go_back_to_npc";
            break;
        
        case UnknownEnum.Value_15:
            _t_state = "player_give_medkit";
            break;
        
        case UnknownEnum.Value_16:
            _t_state = "npc_has_medkit";
            break;
        
        case UnknownEnum.Value_17:
            _t_state = "player_heal";
            break;
        
        case UnknownEnum.Value_18:
            _t_state = "npc_after_player_heal";
            break;
        
        case UnknownEnum.Value_19:
            _t_state = "player_trade";
            break;
        
        case UnknownEnum.Value_20:
            _t_state = "npc_says_find_letter";
            break;
        
        case UnknownEnum.Value_21:
            _t_state = "player_open_map";
            break;
        
        case UnknownEnum.Value_22:
            _t_state = "player_add_marker";
            break;
        
        case UnknownEnum.Value_23:
            _t_state = "player_look_for_letter";
            break;
        
        case UnknownEnum.Value_25:
            _t_state = "player_looted_body";
            break;
        
        case UnknownEnum.Value_26:
            _t_state = "player_throw_bolt";
            break;
        
        case UnknownEnum.Value_27:
            _t_state = "player_throw_bolt_towards_anomaly";
            break;
        
        case UnknownEnum.Value_28:
            _t_state = "player_has_thrown_bolt";
            break;
        
        case UnknownEnum.Value_29:
            _t_state = "player_avoid_anomalies";
            break;
        
        case UnknownEnum.Value_30:
            _t_state = "player_go_to_extraction";
            break;
        
        case UnknownEnum.Value_31:
            _t_state = "last";
            break;
    }
    
    draw_text(_x, _y + (_h * _i), "state : " + _t_state);
    _i++;
    draw_text(_x, _y + (_h * _i), "timer_go : " + string(timer_go));
    _i++;
    draw_text(_x, _y + (_h * _i), "timer : " + string(timer));
    _i++;
    draw_text(_x, _y + (_h * _i), "timer_max : " + string(timer_max));
    _i++;
}

var _text_objective = "";
var _action = undefined;

if (state == UnknownEnum.Value_6)
    _text_objective = "Loot the chest and equip a gun";

if (state == UnknownEnum.Value_7)
{
    _text_objective = " To reload";
    _action = UnknownEnum.Value_7;
}

if (state == UnknownEnum.Value_12)
    _text_objective = "Find the medical box up North";

if (state == UnknownEnum.Value_13)
    _text_objective = "Loot the medical box";

if (state == UnknownEnum.Value_14)
    _text_objective = "Go back to Viktor";

if (state == UnknownEnum.Value_15)
    _text_objective = "Give Medkit to Viktor";

if (state == UnknownEnum.Value_17)
    _text_objective = "Use a medkit";

if (state == UnknownEnum.Value_19)
    _text_objective = "Trade with Viktor";

if (state == UnknownEnum.Value_21)
{
    _text_objective = " To open the map";
    _action = UnknownEnum.Value_11;
}

if (state == UnknownEnum.Value_22)
    _text_objective = " To add a marker";

if (state == UnknownEnum.Value_23)
    _text_objective = "Find the body right East";

if (state == UnknownEnum.Value_24)
    _text_objective = "Loot the letter from the body";

if (state == UnknownEnum.Value_25)
    _text_objective = "Go to the extraction point";

if (state == UnknownEnum.Value_27)
{
    _text_objective = " To throw a bolt at the anomaly";
    _action = UnknownEnum.Value_12;
}

if (state == UnknownEnum.Value_29)
    _text_objective = "Avoid the anomalies";

if (state == UnknownEnum.Value_30)
    _text_objective = "Go to the extraction point";

if (_text_objective != "" && player_state_is(player_get_local().mp_index, scr_player_state_move, scr_player_state_pda))
{
    language_set_font(UnknownEnum.Value_0);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    var _text_width = string_width(_text_objective);
    var _w = _text_width + 48;
    var _x1 = 240 - (_w / 2);
    var _y1 = 230;
    var _h = 14;
    var _y = _y1 + (_h / 2) + 1;
    scr_draw_box(s_box_prologue, _x1, _y1, _w, _h, 0.9);
    
    if (_action != undefined)
    {
        draw_text_outlined_with_control(240, _y, language_get_string(_text_objective), _action, 16777215, true);
    }
    else if (state == UnknownEnum.Value_22)
    {
        if (!obj_gamepad.last_input_keyboard)
        {
            draw_text_outlined_with_control(240, _y, language_get_string(_text_objective), UnknownEnum.Value_30, 16777215, true);
        }
        else
        {
            var _string = "[RMB] ";
            scr_draw_text_outlined(240, _y, language_get_string(_string) + language_get_string(_text_objective), 16777215, 0, 1, 1);
        }
    }
    else
    {
        scr_draw_text_outlined(240, _y, language_get_string(_text_objective), 16777215, 0, 1, 1);
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
    Value_7,
    Value_9 = 9,
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
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_31
}

depth = -15960;
ui_handle_input(4);
uiGetData().tooltip_open = false;
__uiGlobal().__defaultOnion.Step();
var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);

for (var i = 0; i < array_length(function_queue_step); i++)
    function_queue_step[i]();

function_queue_step = [];
player_follow_local();

if (player_exists_local())
{
    if (is_in_raid())
    {
        if (obj_map_generator.state == UnknownEnum.Value_21)
        {
            d_npc_tick++;
            
            if (d_npc_tick >= d_npc_tick_max)
            {
                d_npc_tick = 0;
                var _size = array_length_1d(global.list_n_id);
                
                if (_size > 0)
                {
                    var _start_now = d_npc_same_time_now;
                    
                    for (var i = _start_now; i < (_start_now + d_npc_same_time); i++)
                    {
                        if (global.list_n_follow_path[i] == true)
                        {
                            var _id = global.list_n_id[i];
                            
                            if (_id != -4)
                            {
                                var _inside_map = true;
                                var _off = 320;
                                
                                if (_id.x > (room_width - _off) || _id.x < _off || _id.y > (obj_map_generator.map_height - _off) || _id.y < _off)
                                    _inside_map = false;
                                
                                var _size_path = ds_list_size(_id.lista_path_x);
                                
                                if (_size_path > 0 && _inside_map == true)
                                {
                                    if (!point_in_rectangle(_id.x, _id.y, x - 480, y - 270, x + 480, y + 270))
                                    {
                                        var _amount = floor(dynamic_npc_speed * d_npc_tick_max * (_size div d_npc_same_time));
                                        
                                        if (ds_exists(_id.lista_path_x, ds_type_list) && ds_exists(_id.lista_path_y, ds_type_list))
                                        {
                                            repeat (_amount)
                                            {
                                                if ((_id.path_position_now + 1) < _size_path)
                                                {
                                                    var _next_x = ds_list_find_value(_id.lista_path_x, _id.path_position_now + 1);
                                                    var _next_y = ds_list_find_value(_id.lista_path_y, _id.path_position_now + 1);
                                                    var _prev_x = ds_list_find_value(_id.lista_path_x, _id.path_position_now);
                                                    var _prev_y = ds_list_find_value(_id.lista_path_y, _id.path_position_now);
                                                    
                                                    if (!is_undefined(_next_x) && !is_undefined(_next_y) && !is_undefined(_prev_x) && !is_undefined(_prev_y))
                                                    {
                                                        var _dir = point_direction(_prev_x, _prev_y, _next_x, _next_y);
                                                        global.list_n_x[i] += lengthdir_x(dynamic_npc_speed, _dir);
                                                        global.list_n_y[i] += lengthdir_y(dynamic_npc_speed, _dir);
                                                        _id.x = global.list_n_x[i];
                                                        _id.y = global.list_n_y[i];
                                                        
                                                        if (point_distance(_id.x, _id.y, _next_x, _next_y) < 2)
                                                            _id.path_position_now++;
                                                    }
                                                }
                                            }
                                            
                                            _id.x = global.list_n_x[i];
                                            _id.y = global.list_n_y[i];
                                        }
                                    }
                                }
                            }
                            
                            _id = global.list_n_id[i];
                            
                            if (_id != -4)
                            {
                                if (!point_in_rectangle(_id.x, _id.y, x - 480, y - 270, x + 480, y + 270))
                                {
                                    for (var j = 0; j < _size; j++)
                                    {
                                        if (scr_chance(40))
                                        {
                                            var _id_fight = global.list_n_id[j];
                                            
                                            if (_id_fight != -4)
                                            {
                                                if (!point_in_rectangle(_id_fight.x, _id_fight.y, x - 480, y - 270, x + 480, y + 270))
                                                {
                                                    var _id_npc_fight = global.list_n_npc_id[j];
                                                    var _id_npc = global.list_n_npc_id[i];
                                                    
                                                    if (point_distance(global.list_n_x[i], global.list_n_y[i], global.list_n_x[j], global.list_n_y[j]) < 120)
                                                    {
                                                        if (npc_get_faction(_id_npc) != npc_get_faction(_id_npc_fight))
                                                        {
                                                            var _rel = scr_get_relation(npc_get_faction(_id_npc), npc_get_faction(_id_npc_fight));
                                                            
                                                            if (_rel == UnknownEnum.Value_2)
                                                            {
                                                                var _power_fight = global.list_n_power[j];
                                                                var _power_mine = global.list_n_power[i];
                                                                var _min = min(_power_fight, _power_mine);
                                                                var _max = 0;
                                                                
                                                                if (_min == _power_fight)
                                                                    _max = _power_mine;
                                                                
                                                                if (_min == _power_mine)
                                                                    _max = _power_fight;
                                                                
                                                                var _chance_fight = (_min / (_max * 2)) * 100;
                                                                
                                                                if (scr_chance(_chance_fight))
                                                                {
                                                                    if (_min == _power_mine)
                                                                    {
                                                                        _id_fight.hp = -10;
                                                                        _id_fight.play_sound_death = false;
                                                                        _id_fight.dead_outside_game_window = false;
                                                                        global.list_n_hp[j] = -10;
                                                                        global.list_n_id[j] = -4;
                                                                    }
                                                                    
                                                                    if (_min == _power_fight)
                                                                    {
                                                                        _id.hp = -10;
                                                                        _id.play_sound_death = false;
                                                                        _id.dead_outside_game_window = false;
                                                                        global.list_n_hp[i] = -10;
                                                                        global.list_n_id[i] = -4;
                                                                    }
                                                                }
                                                                else
                                                                {
                                                                    if (_min == _power_mine)
                                                                    {
                                                                        _id.hp = -10;
                                                                        _id.play_sound_death = false;
                                                                        _id.dead_outside_game_window = false;
                                                                        global.list_n_hp[i] = -10;
                                                                        global.list_n_id[i] = -4;
                                                                    }
                                                                    
                                                                    if (_min == _power_fight)
                                                                    {
                                                                        _id_fight.hp = -10;
                                                                        _id_fight.play_sound_death = false;
                                                                        _id.dead_outside_game_window = false;
                                                                        global.list_n_hp[j] = -10;
                                                                        global.list_n_id[j] = -4;
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        d_npc_same_time_now++;
                        
                        if (d_npc_same_time_now > (_size - 1))
                        {
                            i = _size;
                            d_npc_same_time_now = 0;
                        }
                    }
                }
            }
        }
    }
    
    with (player_get_local())
    {
        if (player_local_state_is(scr_player_state_inventory))
        {
            if (!looting && !trading && !looting_player_stash)
                other.loot_name = "Ground";
        }
    }
    
    if (keyboard_check(vk_alt) && keyboard_check(vk_control) && keyboard_check_pressed(ord("P")))
    {
        if (global.general_debug)
        {
            global.general_debug = false;
            global.debug_modding = false;
            global.debug_speed = false;
        }
        else
        {
            global.general_debug = true;
            global.debug_modding = true;
        }
    }
    
    if (keyboard_check_pressed(vk_f11))
    {
        if (global.show_fps == true)
            global.show_fps = false;
        else
            global.show_fps = true;
    }
    
    if (global.general_debug)
    {
        if (keyboard_check_pressed(ord("P")))
        {
            if (disattiva_grid_radiation == false)
                disattiva_grid_radiation = true;
            else if (disattiva_grid_radiation == true)
                disattiva_grid_radiation = false;
        }
        
        if (keyboard_check(ord("L")))
        {
            if (keyboard_check(vk_right))
                global.xp += 150;
            
            if (keyboard_check_pressed(vk_left))
                global.xp -= 100;
            
            if (keyboard_check_pressed(vk_up))
                global.skill_points++;
            
            if (keyboard_check_pressed(vk_down))
                global.xp_survive += 10;
        }
    }
    
    if (settings_get("show_quickbar"))
    {
        var _w = 240;
        var _h = 30;
        
        if (scr_mouse_over_hud((camx + 240) - (_w / 2), (camy + 270) - _h, _w, _h * 2))
            show_quickbar_alpha -= 0.1;
        else
            show_quickbar_alpha += 0.1;
        
        show_quickbar_alpha = clamp(show_quickbar_alpha, 0, 1);
    }
    
    scr_check_level();
    
    if (player_exists_local())
    {
        var bleed = player_get_local().bleed;
        
        if (bleed > 0 && bleed < 25)
        {
            bleed_amount = 0;
            bleed_blink = 1;
        }
        
        if (bleed >= 25 && bleed < 60)
            bleed_amount = 0.05;
        
        if (bleed >= 60)
            bleed_amount = 0.1;
        
        bleed_blink -= (bleed_amount * bleed_blink_factor);
        
        if (bleed_blink <= 0 || bleed_blink >= 1)
            bleed_blink_factor *= -1;
    }
    
    global.sk_hud_hover_alpha += (0.05 * global.sk_hud_hover_alpha_factor);
    
    if (global.sk_hud_hover_alpha >= 1)
        global.sk_hud_hover_alpha_factor = -1;
    
    if (global.sk_hud_hover_alpha <= 0)
        global.sk_hud_hover_alpha_factor = 1;
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_21 = 21
}

var _player = player_get_local();
depth = -y - (sprite_get_height(sprite_index) / 2);
audio_emitter_position(emitter_shoot, x, y, 0);
audio_emitter_position(emitter_walk, x, y, 0);
audio_emitter_position(emitter_talk, x, y, 0);
var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);
var _lista_near_me = undefined;
alert_player -= 0.5;
alert_player = clamp(alert_player, 0, alert_player_max);

if (last_seen_delay == true)
{
    last_seen_delay_timer++;
    
    if (last_seen_delay_timer >= last_seen_delay_timer_max)
    {
        last_seen_delay = false;
        last_seen_x = last_seen_delay_x;
        last_seen_y = last_seen_delay_y;
    }
}

recoil_shooting -= 0.4;
recoil_shooting = clamp(recoil_shooting, 0, 10);

if (path_create_now == true)
{
    if (follow_path == true)
    {
        path_create_now = false;
        var _path_amount_max = array_length(path_goto_x);
        var _valid_x = x;
        var _valid_y = y;
        
        for (var i = 0; i < _path_amount_max; i++)
        {
            var _path = path_add();
            
            if (mp_grid_path(global.grid_move, _path, _valid_x, _valid_y, path_goto_x[i], path_goto_y[i], true))
            {
                var _path_size = path_get_number(_path);
                
                if (_path_size > 0)
                {
                    for (var j = 0; j < _path_size; j++)
                    {
                        var _p_x = path_get_point_x(_path, j);
                        var _p_y = path_get_point_y(_path, j);
                        ds_list_add(lista_path_x, _p_x);
                        ds_list_add(lista_path_y, _p_y);
                    }
                }
                
                _valid_x = path_goto_x[i];
                _valid_y = path_goto_y[i];
            }
            
            path_delete(_path);
        }
    }
}

if (can_talk_reset)
{
    can_talk_reset_timer++;
    
    if (can_talk_reset_timer >= can_talk_reset_timer_max)
    {
        can_talk = true;
        can_talk_reset = false;
    }
}

current_move_speed_multiplier = 1;
move_speed_multiplier_from_skills = 1;

if (frames_left_of_impaler_shot_1 >= 0)
{
    frames_left_of_impaler_shot_1--;
    move_speed_multiplier_from_skills *= global.skills_data.impaler_shot_1.value_1;
}

if (frames_left_of_impaler_shot_2 >= 0)
{
    frames_left_of_impaler_shot_2--;
    move_speed_multiplier_from_skills *= global.skills_data.impaler_shot_2.value_1;
}

current_move_speed_multiplier *= move_speed_multiplier_from_skills;

switch (state)
{
    case "dummy":
        break;
    
    case "dummy_bunker":
        hp = npc_get_hp(npc_id);
        target_for_image_scale = x - 16;
        break;
    
    case "human_no_move":
        if (player_exists_local())
            target_for_image_scale = _player.x;
        
        break;
    
    case "sacriel_hub":
        target_for_image_scale = x + 1;
        break;
    
    case "deactivate":
        if (human_tick >= human_tick_max)
        {
            human_tick_max = human_tick_max_ref + 10 + irandom_range(-2, 2);
            human_tick = 0;
            
            if (player_exists_local())
            {
                var _x_start = _player.x - 480;
                var _y_start = _player.y - 270;
                
                if (point_in_rectangle(x, y, _x_start, _y_start, _x_start + 960, _y_start + 540))
                    state = state_before;
            }
        }
        
        break;
    
    case "unknown_sewer":
        if (player_exists_local())
            target_for_image_scale = _player.x;
        
        if (can_talk == true)
        {
            if (global.az_done[UnknownEnum.Value_7] == false)
            {
                global.az_done[UnknownEnum.Value_7] = true;
                can_talk = false;
                scr_draw_npc_text(id, UnknownEnum.Value_145);
            }
        }
        
        target = scr_find_target_for_human();
        
        if (target != -4)
        {
            switch (target_relation)
            {
                case UnknownEnum.Value_2:
                    hspd = 0;
                    vspd = 0;
                    state = "human_shoot";
                    break;
                
                case UnknownEnum.Value_0:
                    break;
                
                case UnknownEnum.Value_1:
                    break;
            }
        }
        
        break;
    
    case "forest_trader":
        if (player_exists_local())
        {
            target_for_image_scale = _player.x;
            
            if (point_distance(x, y, _player.x, _player.y) < 80)
            {
                if (can_talk == true)
                {
                    can_talk = false;
                    var prima_volta_fatta = global.az_done[UnknownEnum.Value_0];
                    
                    if (prima_volta_fatta == false)
                    {
                        scr_draw_npc_text(id, UnknownEnum.Value_113);
                        global.az_done[UnknownEnum.Value_0] = true;
                    }
                    else
                    {
                        scr_draw_npc_text(id, UnknownEnum.Value_115);
                    }
                }
            }
        }
        
        break;
    
    case "junk_trader":
        target_for_image_scale = 1;
        
        if (player_exists_local())
        {
            if (point_distance(x, y, _player.x, _player.y) < 80)
            {
                if (can_talk == true)
                {
                    can_talk = false;
                    var prima_volta_fatta = global.az_done[UnknownEnum.Value_10];
                    
                    if (prima_volta_fatta == false)
                    {
                        scr_draw_npc_text(id, UnknownEnum.Value_120);
                        global.az_done[UnknownEnum.Value_10] = true;
                    }
                    else
                    {
                        scr_draw_npc_text(id, UnknownEnum.Value_125);
                    }
                }
            }
        }
        
        break;
    
    case "guardia_ingresso":
        if (scr_chance(2))
            weapon_pointing_amount = choose(-weapon_pointing_angle, weapon_pointing_angle, 0);
        
        weapon_pointing_direction += weapon_pointing_amount;
        weapon_pointing_direction = clamp(weapon_pointing_direction, 240, 300);
        target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
        
        if (object_index == obj_guardia_ingresso_2)
        {
            if (can_talk == true)
            {
                if (player_exists_local())
                {
                    if (_player.y > (y + 4) && _player.y < (y + 18) && instance_line_of_sight(x, y, _player))
                    {
                        var first_time_ = global.az_done[UnknownEnum.Value_2];
                        
                        if (first_time_ == false)
                        {
                            scr_draw_npc_text(id, UnknownEnum.Value_130);
                            global.az_done[UnknownEnum.Value_2] = true;
                            can_talk = false;
                        }
                        
                        first_time_ = global.az_done[UnknownEnum.Value_3];
                        
                        if (first_time_ == true)
                        {
                            var pp_ = UnknownEnum.Value_4;
                            var _first_time_ = global.az_done[pp_];
                            
                            if (_first_time_ == false)
                            {
                                scr_draw_npc_text(id, UnknownEnum.Value_137);
                                global.az_done[pp_] = true;
                                can_talk = false;
                            }
                        }
                    }
                }
            }
        }
        
        if (object_index == obj_guardia_ingresso_1)
        {
            if (can_talk == true)
            {
                if (player_exists_local())
                {
                    if (_player.y > (y + 4) && _player.y < (y + 18) && instance_line_of_sight(x, y, _player))
                    {
                        var _active = scr_check_quest_in_corso(UnknownEnum.Value_37);
                        
                        if (_active == UnknownEnum.Value_1)
                        {
                            can_talk = false;
                            scr_draw_npc_text(id, UnknownEnum.Value_142);
                        }
                        
                        _active = scr_check_quest_in_corso(UnknownEnum.Value_37);
                        
                        if ((_active == UnknownEnum.Value_2 || global.quest_unique_done[UnknownEnum.Value_37] == true) && global.az_done[UnknownEnum.Value_6] == false)
                        {
                            can_talk = false;
                            scr_draw_npc_text(id, UnknownEnum.Value_143);
                            global.az_done[UnknownEnum.Value_6] = true;
                        }
                    }
                }
            }
        }
        
        var point_player = false;
        
        if (player_exists_local())
        {
            if (object_index == obj_guardia_ingresso_1 || object_index == obj_guardia_ingresso_2)
            {
                if (instance_exists(obj_npc_draw_text))
                {
                    with (obj_npc_draw_text)
                    {
                        if (global.t_npc_text_next_id[text_id] == obj_guardia_ingresso_1 || global.t_npc_text_next_id[text_id] == obj_guardia_ingresso_2)
                            point_player = true;
                    }
                }
            }
            
            if (point_player == true)
            {
                weapon_pointing_direction = point_direction(x, y, _player.x, _player.y);
                target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
            }
        }
        
        break;
    
    case "guardia_iniziale":
        if (scr_chance(2))
            weapon_pointing_amount = choose(-weapon_pointing_angle, weapon_pointing_angle, 0);
        
        weapon_pointing_direction += weapon_pointing_amount;
        weapon_pointing_direction = clamp(weapon_pointing_direction, -100, 15);
        
        if (quest_is_complete("unlock_makeshift_camp") == false)
        {
            if (player_distance_local(x, y) < 48)
            {
                if (instance_line_of_sight(x, y, _player))
                {
                    weapon_pointing_direction = point_direction(x, y, _player.x, _player.y);
                    
                    if (can_talk == true)
                    {
                        can_talk = false;
                        scr_draw_npc_text(id, UnknownEnum.Value_105);
                    }
                }
            }
        }
        
        if (!instance_exists(obj_solid_bunker_green_army))
            npc_speaker_id = "guardia_iniziale_posso_passare";
        
        if (quest_is_complete("unlock_makeshift_camp") == true)
        {
            if (player_distance_local(x, y) < 16 && instance_line_of_sight(x, y, _player))
            {
                if (can_talk == true)
                {
                    can_talk = false;
                    scr_draw_npc_text(id, UnknownEnum.Value_106);
                }
            }
        }
        
        target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
        break;
    
    case "guardia_iniziale_posso_passare":
        if (scr_chance(2))
            weapon_pointing_amount = choose(-weapon_pointing_angle, weapon_pointing_angle, 0);
        
        weapon_pointing_direction += weapon_pointing_amount;
        weapon_pointing_direction = clamp(weapon_pointing_direction, -100, 15);
        target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
        break;
    
    case "crimson_ingresso_base":
        if (scr_chance(2))
            weapon_pointing_amount = choose(-weapon_pointing_angle, weapon_pointing_angle, 0);
        
        weapon_pointing_direction += weapon_pointing_amount;
        weapon_pointing_direction = clamp(weapon_pointing_direction, -100, 15);
        
        if (player_exists_local())
        {
            var _active = scr_check_quest_in_corso(UnknownEnum.Value_69);
            
            if (_active == UnknownEnum.Value_2)
            {
                if (player_distance_local(x, y) < 64)
                {
                    weapon_pointing_direction = point_direction(x, y, _player.x, _player.y);
                    
                    if (can_talk == true)
                    {
                        if (global.az_done[UnknownEnum.Value_9] == false)
                        {
                            scr_draw_npc_text(id, UnknownEnum.Value_151);
                            can_talk = false;
                            global.az_done[UnknownEnum.Value_9] = true;
                        }
                    }
                }
            }
            
            if (global.quest_unique_done[UnknownEnum.Value_69] == false || _active != UnknownEnum.Value_2)
            {
                if (player_distance_local(x, y) < 96)
                {
                    weapon_pointing_direction = point_direction(x, y, _player.x, _player.y);
                    
                    if (player_distance_local(x, y) < 64)
                    {
                        if (can_talk == true)
                        {
                            scr_draw_npc_text(id, UnknownEnum.Value_148);
                            can_talk = false;
                        }
                    }
                }
            }
            
            if (global.quest_unique_done[UnknownEnum.Value_70] == true)
            {
                if (player_distance_local(x, y) < 48)
                {
                    if (can_talk == true)
                    {
                        scr_draw_npc_text(id, UnknownEnum.Value_150);
                        can_talk = false;
                    }
                }
            }
        }
        
        target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
        target = scr_find_target_for_human();
        
        if (target != -4)
        {
            switch (target_relation)
            {
                case UnknownEnum.Value_2:
                    hspd = 0;
                    vspd = 0;
                    state = "human_shoot";
                    break;
                
                case UnknownEnum.Value_0:
                    break;
                
                case UnknownEnum.Value_1:
                    break;
            }
        }
        
        break;
    
    case "crimson_leader":
        if (!global.az_done[UnknownEnum.Value_8] && player_exists_local())
        {
            if (player_distance_local(x, y) < 128)
            {
                if (can_talk == true)
                {
                    can_talk = false;
                    global.az_done[UnknownEnum.Value_8] = true;
                    scr_draw_npc_text(id, UnknownEnum.Value_154);
                }
            }
        }
        
        break;
    
    case "human_fuma_sigaretta":
        scr_npc_state_arms(obj_arms_smoke);
        break;
    
    case "human_eat":
        scr_npc_state_arms(obj_arms_eat);
        break;
    
    case "human_drink":
        scr_npc_state_arms(obj_arms_drink);
        break;
    
    case "human_play_guitar":
        scr_npc_state_arms(obj_arms_guitar);
        break;
    
    case "human_go_near_fire":
        scr_enemy_path();
        
        if (point_distance(x, y, move_point_x, move_point_y) < 12)
        {
            path_end();
            
            if (!instance_exists(obj_arms_guitar))
                scr_npc_arms("human_play_guitar", obj_arms_guitar);
            else
                state = "human_patrol";
        }
        
        break;
    
    case "human_hub_general":
        if (is_in_hub())
        {
            if (x > (camx - 240) && x < (camx + 720) && y > (camy - 135) && y < (camy + 405))
            {
                scr_enemy_choose_idle_or_move();
                scr_collision();
            }
        }
        
        target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
        
        if (x > xprevious)
        {
            target_for_image_scale = x + 2;
            weapon_pointing_direction = 300;
        }
        else if (x == xprevious)
        {
        }
        else if (x < xprevious)
        {
            target_for_image_scale = x - 2;
            weapon_pointing_direction = 240;
        }
        
        break;
    
    case "human_go_to_bancone_hub":
        scr_enemy_path();
        
        if (point_distance(x, y, move_point_x, move_point_y) < 4)
        {
            path_end();
            move_point_x = original_x;
            move_point_y = original_y;
            
            if (scr_chance(50))
            {
                state = "human_eat";
                var aa = instance_create_depth(x, y, 0, obj_arms_eat);
                aa.linked_id = id;
                aa.image_xscale = image_xscale;
            }
            else
            {
                state = "human_drink";
                var aa = instance_create_depth(x, y, 0, obj_arms_drink);
                aa.linked_id = id;
                aa.image_xscale = image_xscale;
            }
        }
        
        break;
    
    case "human_go_to_original_position":
        scr_enemy_path();
        
        if (point_distance(x, y, move_point_x, move_point_y) < 4)
        {
            path_end();
            state = "human_hub_general";
        }
        
        break;
    
    case "human_patrol":
        scr_enemy_choose_idle_or_move();
        scr_collision();
        draw_weapon = true;
        
        if (is_in_hub())
        {
            target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
            
            if (x > xprevious)
            {
                target_for_image_scale = x + 2;
                weapon_pointing_direction = 300;
            }
            else if (x == xprevious)
            {
            }
            else if (x < xprevious)
            {
                target_for_image_scale = x - 2;
                weapon_pointing_direction = 240;
            }
        }
        else
        {
            if (scr_chance(2))
                weapon_pointing_amount = choose(-weapon_pointing_angle, weapon_pointing_angle, 0);
            
            weapon_pointing_direction += weapon_pointing_amount;
            
            if (object_index == obj_green_quest_swamp)
            {
                if (instance_exists(obj_faro))
                    weapon_pointing_direction = point_direction(x, y, obj_faro.x, obj_faro.y - 150);
            }
            
            target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
        }
        
        target = scr_find_target_for_human();
        
        if (target != -4)
        {
            switch (target_relation)
            {
                case UnknownEnum.Value_2:
                    hspd = 0;
                    vspd = 0;
                    state = "human_shoot";
                    break;
                
                case UnknownEnum.Value_0:
                    hspd = 0;
                    vspd = 0;
                    state = "human_aim_neutral_target";
                    break;
                
                case UnknownEnum.Value_1:
                    break;
            }
        }
        
        if (scr_chance(1))
        {
            if (faction == "Loners")
            {
                if (!instance_exists(obj_arms_guitar))
                {
                    if (instance_exists(obj_barrel_acciaio_fire))
                    {
                        var nearest = instance_nearest(x, y, obj_barrel_acciaio_fire);
                        
                        if (point_distance(x, y, nearest.x, nearest.y) < 160)
                        {
                            move_point_x = nearest.x + irandom_range(-10, 10);
                            move_point_y = nearest.y;
                            state = "human_go_near_fire";
                        }
                    }
                }
            }
        }
        
        break;
    
    case "human_aim_neutral_target":
        scr_collision();
        target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
        target = scr_find_target_for_human();
        
        if (target != -4)
        {
            switch (target_relation)
            {
                case UnknownEnum.Value_2:
                    hspd = 0;
                    vspd = 0;
                    state = "human_shoot";
                    break;
                
                case UnknownEnum.Value_0:
                    weapon_pointing_direction = point_direction(x, y, target.x, target.y);
                    var dis = point_distance(x, y, target.x, target.y);
                    
                    if (point_distance(x, y, mouse_x, mouse_y) < 8 && dis < 96)
                    {
                        if (can_talk == true)
                        {
                            can_talk = false;
                            scr_draw_npc_text(id, UnknownEnum.Value_29);
                        }
                    }
                    
                    if (!instance_line_of_sight(x, y, target))
                        state = "human_patrol";
                    
                    break;
                
                case UnknownEnum.Value_1:
                    state = "human_patrol";
                    break;
            }
        }
        else
        {
            state = "human_patrol";
        }
        
        break;
    
    case "human_bt":
        tick_from_roof = false;
        tick_now++;
        
        if (tick_now >= tick_max)
        {
            tick_from_roof = true;
            tick_now = 0;
            node_state_now = 3;
            pos_now = pos_roof;
            trace("\n\nNEW TICK\n");
            fun_bt_traverse(pos_now);
            
            for (var i = 0; i < array_length(tree_id); i++)
            {
                tree_condition_checked[i] += 1;
                tree_node_child_now[i] = 0;
            }
        }
        
        if (tick_from_roof == false)
        {
            node_state_now = 2;
            pos_now = node_running_now;
            fun_bt_traverse(pos_now);
        }
        
        break;
    
    case "human_general":
        var _next_state = -1;
        
        if (state_finito == true)
        {
            human_tick = human_tick_max;
            path_timer = path_timer_reset;
        }
        
        NPCrecoil.IncreaseRadius(NPCrecoil.radius_decreasing_value);
        
        if (instance_exists(target))
        {
            NPCrecoil.NewCenter(target);
            NPCrecoil.MoveCrosshair();
            NPCrecoil.StuckCheck();
            var _dis = point_distance(last_seen_x, last_seen_y, target.x, target.y);
            
            if (reflexes_can_change == true)
            {
                var _dis_target = point_distance(x, y, target.x, target.y);
                var _dir_target = point_direction(x, y, target.x, target.y);
                var _dir_weapon = weapon_pointing_direction;
                
                if (_dis < reflex_min_distance_last_known)
                {
                    if (reflexes_shot == true)
                    {
                        riflessi_max = reflexes_minimum;
                        reflexes_shot = false;
                    }
                    
                    if (!instance_line_of_sight(x, y, target))
                        riflessi_max = reflexes_minimum;
                }
                else
                {
                    reflexes_can_change = false;
                    reflexes_distance = lerp(reflexes_distance_min, reflexes_distance_max, _dis_target / 180);
                    reflexes_distance = clamp(reflexes_distance, reflexes_distance_min, reflexes_distance_max);
                    var _angle_diff = abs(angle_difference(_dir_target, _dir_weapon));
                    reflexes_angle = lerp(reflexes_angle_min, reflexes_angle_max, _angle_diff / 180);
                    reflexes_angle = clamp(reflexes_angle, reflexes_angle_min, reflexes_angle_max);
                    riflessi_max = reflexes_minimum + reflexes_distance + reflexes_angle;
                }
            }
            
            riflessi = clamp(riflessi, 0, riflessi_max);
        }
        
        scr_bullet_near();
        human_tick++;
        
        if (human_tick >= human_tick_max)
        {
            human_tick_max = human_tick_max_ref + irandom_range(-1, 1);
            human_tick = 0;
            target = scr_find_target_for_human();
            scr_enemy_alert_others();
            var _list_action = ds_priority_create();
            var _new_just_shot = just_shot;
            var _no_target_or_ally = false;
            
            if (target == -4)
                _no_target_or_ally = true;
            
            if (target != -4)
            {
                if (instance_exists(target))
                {
                    if (target_relation == UnknownEnum.Value_1)
                        _no_target_or_ally = true;
                }
            }
            
            var _my_faction = npc_get_faction(npc_id);
            
            if (_no_target_or_ally == true)
            {
                last_patrol_x = x;
                last_patrol_y = y;
                ds_priority_add(_list_action, UnknownEnum.Value_0, global.sub_ai_peso[UnknownEnum.Value_0]);
                
                if (scr_chance(1))
                {
                    var pp = choose(UnknownEnum.Value_3, UnknownEnum.Value_4, UnknownEnum.Value_2);
                    ds_priority_add(_list_action, pp, global.sub_ai_peso[pp]);
                }
                
                if (object_index == obj_scientist || object_index == obj_scientist_2)
                {
                    var p = UnknownEnum.Value_1;
                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                }
                
                if (object_index == obj_scientist_2)
                {
                    var p = UnknownEnum.Value_5;
                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                }
                
                if (object_index == obj_crimson_guardia_ingresso)
                {
                    var p = UnknownEnum.Value_6;
                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                }
                
                if (object_index == obj_crimson_guardia_ingresso)
                {
                    if (point_distance(x, y, original_x, original_y) > 20)
                    {
                        var p = UnknownEnum.Value_9;
                        ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                    }
                }
                
                if (scr_chance(1))
                {
                    if (faction == "Loners")
                    {
                        if (!instance_exists(obj_arms_guitar))
                        {
                            if (instance_exists(obj_barrel_acciaio_fire))
                            {
                                var nearest = instance_nearest(x, y, obj_barrel_acciaio_fire);
                                
                                if (point_distance(x, y, nearest.x, nearest.y) < 160)
                                {
                                    move_point_x = nearest.x + irandom_range(-10, 10);
                                    move_point_y = nearest.y;
                                    var p = UnknownEnum.Value_7;
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                }
                            }
                        }
                    }
                }
                
                var _my_id = id;
                var _alleato_morto_vicino = 0;
                var _ally_morto_x = 0;
                var _ally_morto_y = 0;
                var _id_chest_ally_dead = -4;
                
                if (alleato_morto_vicino != 2)
                {
                    if (instance_exists(obj_chest_general))
                    {
                        with (obj_chest_general)
                        {
                            if (chest_faction == _my_faction)
                            {
                                if (point_distance(x, y, _my_id.x, _my_id.y) < 260)
                                {
                                    if (instance_line_of_sight(x, y, _my_id))
                                    {
                                        _alleato_morto_vicino = 1;
                                        _ally_morto_x = x;
                                        _ally_morto_y = y;
                                        _id_chest_ally_dead = id;
                                    }
                                }
                            }
                        }
                    }
                }
                
                if (_alleato_morto_vicino == 1)
                {
                    alleato_morto_vicino = 1;
                    ally_morto_x = _ally_morto_x;
                    ally_morto_y = _ally_morto_y;
                    id_chest_ally_dead = _id_chest_ally_dead;
                }
                
                if (_alleato_morto_vicino == 1)
                {
                    var p = UnknownEnum.Value_28;
                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                }
                
                if (follow_path == true)
                {
                    var p = UnknownEnum.Value_10;
                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                }
            }
            
            var _grenade_close = false;
            var _grenade_close_same_faction = false;
            var _array_grenade_cover;
            
            if (instance_exists(obj_grenade_parent))
            {
                var __x = x;
                var __y = y;
                var _near = instance_nearest(x, y, obj_grenade_parent);
                
                if (grenade_close_id != _near)
                {
                    grenade_can_cover = true;
                    grenade_close_id = _near;
                }
                else
                {
                    grenade_can_cover = false;
                }
                
                if (_near.faction == npc_get_faction(npc_id))
                {
                    grenade_can_cover = true;
                    _grenade_close_same_faction = true;
                }
                
                if (grenade_can_cover == true)
                {
                    _array_grenade_cover = [0, 0];
                    
                    with (_near)
                    {
                        if (point_distance(x, y, __x, __y) < radius_min_damage)
                        {
                            if (!collision_line(x, y, __x, __y, obj_solid, true, true))
                            {
                                _grenade_close = true;
                                _array_grenade_cover = scr_enemy_search_cover_grenade(_near);
                            }
                        }
                    }
                }
            }
            
            var _grenade_flash = grenade_flash;
            var _array, _array_aim_moving, _array_cover, _array_change_cover, _grenade_id, _tx, _ty, _array_range_pos;
            
            if (target != -4)
            {
                _tx = target.x;
                _ty = target.y;
                var _line_of_sight = false;
                var _lo_vedo = false;
                target_visto = false;
                var _arma_dir_target = true;
                var _distanza_a_tiro = false;
                var _vedo_ultima_pos_vista_da_alleati = false;
                var _vedo_ultima_pos_vista_da_me = false;
                var _mouse_over_npc = false;
                var _counter_same_target = 0;
                var _counter_same_faction = 0;
                var _counter_first_time = 0;
                var _counter_array_action_ally, _counter_array_action_same_target;
                
                for (var i = 0; i < array_length_1d(global.sub_ai_peso); i++)
                {
                    _counter_array_action_ally[i] = 0;
                    _counter_array_action_same_target[i] = 0;
                }
                
                var _counter_near_me = 0;
                _lista_near_me = ds_list_create();
                var _cover_pos_found = false;
                var _sono_vicino_al_target = false;
                var _distance_to_target_in_sight = 0;
                var _distance_to_target = 0;
                _grenade_id = "no_item";
                var _player_grenade_flashed_k = 1;
                var _distance_target = point_distance(x, y, _tx, _ty);
                var _player_inscreen = scr_target_player_and_inscreen();
                var _struct_range = npc_ai_effective_range(arma_now, _distance_target, 20, 5, 0);
                _array_range_pos = scr_enemy_search_range_position(_struct_range);
                precision_uneffective_range = 0;
                
                if (can_shoot_uneffective_range == true)
                {
                    if (_distance_target <= _struct_range.ok_min)
                    {
                        _struct_range.range_type = UnknownEnum.Value_0;
                        precision_uneffective_range = 45;
                    }
                    
                    timer_shoot_uneffective_range += human_tick_max;
                    
                    if (timer_shoot_uneffective_range >= timer_shoot_uneffective_range_max)
                        timer_shoot_uneffective_range = 0;
                }
                
                var _eff_range_pos = [];
                var _same_faction_throw_grenade = false;
                var _same_faction_near_last_known = false;
                _distance_to_target = point_distance(x, y, target.x, target.y);
                
                if (instance_line_of_sight(x, y, target))
                {
                    _line_of_sight = true;
                    _distance_to_target_in_sight = point_distance(x, y, target.x, target.y);
                    
                    if (_distance_to_target_in_sight < 110)
                        _sono_vicino_al_target = true;
                }
                
                _lo_vedo = scr_enemy_target_inside_cone();
                
                if (!collision_line(x, y, last_seen_x, last_seen_y, obj_solid, true, true))
                    _vedo_ultima_pos_vista_da_alleati = true;
                
                if (!collision_line(x, y, last_known_x, last_known_y, obj_solid, true, true))
                    _vedo_ultima_pos_vista_da_me = true;
                
                with (obj_arms_grenade)
                {
                    if (instance_exists(linked_id))
                    {
                        var _npc_id = linked_id.npc_id;
                        var _faction = npc_get_faction(_npc_id);
                        
                        if (_faction == _my_faction)
                            _same_faction_throw_grenade = true;
                    }
                }
                
                if (_lo_vedo == true)
                {
                    last_seen_x = _tx;
                    last_seen_y = _ty;
                    last_known_x = _tx;
                    last_known_y = _ty;
                    last_my_target_seen_x = x;
                    last_my_target_seen_y = y;
                    target_seen = true;
                }
                else
                {
                    target_seen = false;
                    reflexes_can_change = true;
                }
                
                var _dir = point_direction(x, y, _tx, _ty);
                var _angle_diff = angle_difference(weapon_pointing_direction, _dir);
                
                if (abs(_angle_diff) > angle_min_to_rotate)
                {
                    _arma_dir_target = false;
                    direction_to_aim = _dir;
                    dir_to_aim_x = _tx;
                    dir_to_aim_y = _ty;
                }
                
                var _devo_ricaricare = scr_calcola_chance_reload();
                
                if (instance_exists(obj_mouse) && point_distance(x, y, obj_mouse.x, obj_mouse.y) < 10)
                    _mouse_over_npc = true;
                
                if (instance_exists(obj_hud_effect_flash))
                    _player_grenade_flashed_k = 3;
                
                _my_faction = faction;
                var _my_target = target;
                var _my_id = id;
                var _my_x = x;
                var _my_y = y;
                
                with (obj_npc_parent)
                {
                    if (id != _my_id)
                    {
                        if (faction == _my_faction)
                        {
                            _counter_same_faction++;
                            
                            if (human_state_now != -1)
                                _counter_array_action_ally[human_state_now] += 1;
                            
                            if (point_distance(x, y, _my_x, _my_y) < 10)
                            {
                                _counter_near_me++;
                                ds_list_add(_lista_near_me, id);
                            }
                            
                            if (target == _my_target)
                            {
                                _counter_same_target++;
                                
                                if (human_state_now != -1)
                                    _counter_array_action_same_target[human_state_now] += 1;
                            }
                        }
                    }
                }
                
                if (human_state_now != UnknownEnum.Value_12 && human_state_now != UnknownEnum.Value_13)
                {
                    _array_cover = scr_enemy_search_cover_position_2();
                    
                    if (_array_cover[0] != 0)
                    {
                        var _path_cover = path_add();
                        path_clear_points(_path_cover);
                        
                        if (mp_grid_path(global.grid_move, _path_cover, x, y, _array_cover[0], _array_cover[1], true))
                            _cover_pos_found = true;
                        
                        path_delete(_path_cover);
                    }
                }
                
                if (instance_exists(target))
                {
                    if (target_relation == UnknownEnum.Value_2)
                    {
                        if (_lo_vedo == true)
                        {
                            alarm[5] = timer_searching_target_max;
                            target_visto_prima_volta = true;
                            target_visto = true;
                            
                            if (_devo_ricaricare == false)
                            {
                                if ((_player_inscreen.inscreen || _player_inscreen.player == false) && (_struct_range.range_type == UnknownEnum.Value_0 || (_struct_range.range_type == UnknownEnum.Value_1 && _mouse_over_npc)))
                                {
                                    var p = UnknownEnum.Value_11;
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                    last_known_x = target.x;
                                    last_known_y = target.y;
                                    
                                    if (_arma_dir_target == false)
                                    {
                                        p = UnknownEnum.Value_21;
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                    }
                                }
                                
                                if (_array_range_pos[0] != 0)
                                {
                                    if (_struct_range.range_type != UnknownEnum.Value_0 && !_mouse_over_npc)
                                    {
                                        var p = UnknownEnum.Value_29;
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                    }
                                }
                            }
                            
                            if (_devo_ricaricare == true)
                            {
                                if (_cover_pos_found == true)
                                {
                                    if (!_sono_vicino_al_target || have_to_reload == true)
                                    {
                                        var p = UnknownEnum.Value_12;
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                    }
                                }
                            }
                            
                            if (_mouse_over_npc == true)
                            {
                                if (_cover_pos_found == true)
                                {
                                    if (scr_chance(7))
                                    {
                                        var p = UnknownEnum.Value_12;
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                    }
                                }
                            }
                            
                            if (scr_chance(1))
                            {
                                if (_cover_pos_found == true)
                                {
                                    var p = UnknownEnum.Value_12;
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                }
                            }
                            
                            if (_distance_target >= 100)
                            {
                                if (shooted_first_time == 1)
                                {
                                    shooted_first_time = 2;
                                    
                                    if (_cover_pos_found == true)
                                    {
                                        var p = UnknownEnum.Value_13;
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                    }
                                }
                            }
                        }
                        
                        if (_lo_vedo == false)
                        {
                            if (_devo_ricaricare == true)
                            {
                                var p = UnknownEnum.Value_20;
                                ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                            }
                            
                            if (_devo_ricaricare == false)
                            {
                                if (_vedo_ultima_pos_vista_da_alleati == false)
                                {
                                    _array = scr_enemy_search_shoot_position_2();
                                    
                                    if (_array[0] != 0)
                                    {
                                        var p = UnknownEnum.Value_15;
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                    }
                                    else if (target_visto_prima_volta == true)
                                    {
                                        var p = UnknownEnum.Value_16;
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                    }
                                    else
                                    {
                                    }
                                }
                                
                                if (_vedo_ultima_pos_vista_da_alleati == true)
                                {
                                    if (target.faction != "Mutants")
                                    {
                                        var _chance_tipo_weapon = 0;
                                        
                                        switch (tipo_arma_equipped)
                                        {
                                            case "pistol":
                                                _chance_tipo_weapon = 20;
                                                break;
                                            
                                            case "smg":
                                                _chance_tipo_weapon = 25;
                                                break;
                                            
                                            case "shotgun":
                                                _chance_tipo_weapon = 30;
                                                break;
                                            
                                            case "rifle":
                                                _chance_tipo_weapon = 15;
                                                break;
                                            
                                            case "dmr":
                                                _chance_tipo_weapon = 2;
                                                break;
                                            
                                            case "sniper":
                                                _chance_tipo_weapon = 0;
                                                break;
                                        }
                                        
                                        var _chance_counter_alleati_vicini = _counter_same_target;
                                        var _chance_totale = _chance_tipo_weapon * _chance_counter_alleati_vicini * _player_grenade_flashed_k;
                                        debug_chance_chase = _chance_totale;
                                        
                                        if (npc_id == "killa")
                                            _chance_totale = 100;
                                        
                                        if (scr_chance(_chance_totale))
                                        {
                                            if (target_visto_prima_volta == true)
                                            {
                                                if (_counter_array_action_same_target[UnknownEnum.Value_16] < 2)
                                                {
                                                    var p = UnknownEnum.Value_16;
                                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                                }
                                            }
                                        }
                                        else if (_counter_array_action_same_target[UnknownEnum.Value_24] < 2)
                                        {
                                            var p = UnknownEnum.Value_24;
                                            ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                        }
                                        
                                        if (instance_exists(obj_hud_effect_flash))
                                        {
                                            if (target == player_get_local())
                                            {
                                                var p = UnknownEnum.Value_16;
                                                ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                            }
                                        }
                                    }
                                }
                                
                                if (_vedo_ultima_pos_vista_da_alleati == true)
                                {
                                    if (point_distance(x, y, last_seen_x, last_seen_y) > 20)
                                    {
                                        _array_aim_moving = scr_enemy_search_aim_moving(last_target_cover_x, last_target_cover_y);
                                        
                                        if (_array_aim_moving[0] != 0)
                                        {
                                            var p = UnknownEnum.Value_25;
                                            ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                        }
                                    }
                                }
                                
                                if (human_state_now == UnknownEnum.Value_16 || human_state_now == UnknownEnum.Value_23)
                                {
                                    if (state_finito == true)
                                    {
                                        var p = UnknownEnum.Value_19;
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                    }
                                }
                                
                                if (_vedo_ultima_pos_vista_da_alleati == true)
                                {
                                    if (point_distance(x, y, last_seen_x, last_seen_y) < 10)
                                    {
                                        var p = UnknownEnum.Value_19;
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                    }
                                }
                                
                                if (human_state_now == UnknownEnum.Value_18)
                                {
                                    if (point_distance(_tx, _ty, last_seen_x, last_seen_y) > 48)
                                    {
                                        if (point_distance(x, y, last_seen_x, last_seen_y) < 8)
                                        {
                                            var p = UnknownEnum.Value_19;
                                            ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                        }
                                    }
                                }
                                
                                if (chase_new_target_location == true)
                                {
                                    var p = UnknownEnum.Value_18;
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                }
                                
                                if (target_visto_prima_volta == false && chase_new_target_location == true)
                                {
                                    var p = UnknownEnum.Value_18;
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                }
                                
                                if (hear_target_shoot == true && _vedo_ultima_pos_vista_da_alleati == false)
                                {
                                    hear_target_shoot = false;
                                    
                                    if (scr_chance(85))
                                    {
                                        var p = UnknownEnum.Value_23;
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                    }
                                }
                                
                                if (state_finito == true)
                                {
                                    if (human_state_now == UnknownEnum.Value_28)
                                    {
                                        var p = UnknownEnum.Value_19;
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                    }
                                }
                            }
                        }
                        
                        if (_line_of_sight == false)
                        {
                            alert_player = 0;
                            riflessi = 0;
                            counter_target_cover++;
                            
                            if (counter_target_cover >= counter_target_cover_max && counter_target_toggle == true)
                            {
                                last_target_cover_x = _tx;
                                last_target_cover_y = _ty;
                                counter_target_toggle = false;
                            }
                            
                            if (human_state_now == UnknownEnum.Value_12)
                            {
                                if (scr_chance(12))
                                {
                                    _array_change_cover = scr_enemy_change_cover_2();
                                    
                                    if (_array_change_cover[0] != 0)
                                    {
                                        var p = UnknownEnum.Value_14;
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                    }
                                }
                            }
                        }
                        
                        if (_line_of_sight == true)
                        {
                            counter_target_cover = 0;
                            counter_target_toggle = true;
                            
                            if (_arma_dir_target == true && (_player_inscreen.inscreen || _player_inscreen.player == false) && (_struct_range.range_type == UnknownEnum.Value_0 || (_struct_range.range_type == UnknownEnum.Value_1 && _mouse_over_npc) || _distance_to_target_in_sight < 100))
                            {
                                var p = UnknownEnum.Value_11;
                                ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                last_known_x = target.x;
                                last_known_y = target.y;
                            }
                            
                            if (_array_range_pos[0] != 0)
                            {
                                if (_arma_dir_target == true && _struct_range.range_type != UnknownEnum.Value_0)
                                {
                                    var p = UnknownEnum.Value_29;
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                }
                            }
                            
                            if (_arma_dir_target == false && just_shot == 2 && _sono_vicino_al_target == false)
                            {
                                if (_cover_pos_found == true)
                                {
                                    _new_just_shot = 0;
                                    var p = UnknownEnum.Value_13;
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                }
                            }
                            
                            if (_arma_dir_target == false && just_shot == 1)
                            {
                                _new_just_shot = 0;
                                var p = UnknownEnum.Value_21;
                                ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                            }
                            
                            if (_player_inscreen.player == true && _player_inscreen.inscreen == false)
                            {
                                var p = UnknownEnum.Value_21;
                                ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                            }
                        }
                        
                        if (must_take_cover == true)
                        {
                            must_take_cover = false;
                            
                            if (human_state_before != UnknownEnum.Value_12 && human_state_now != UnknownEnum.Value_12)
                            {
                                if (_cover_pos_found == true)
                                {
                                    var p = UnknownEnum.Value_12;
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                }
                            }
                        }
                        
                        if (_counter_near_me >= 1)
                        {
                            var p = UnknownEnum.Value_26;
                            ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                        }
                        
                        if (state_finito == true)
                        {
                            if (human_state_now == UnknownEnum.Value_13)
                            {
                                if (just_shot == 2)
                                {
                                    _new_just_shot = 0;
                                    var p = UnknownEnum.Value_27;
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                }
                            }
                        }
                        
                        if (grenade_amount_thrown < grenade_amount_max)
                        {
                            if (_vedo_ultima_pos_vista_da_alleati == true && _line_of_sight == false && _same_faction_throw_grenade == false)
                            {
                                if (scr_chance(npc_get_prob_grenade_throw(npc_id)))
                                {
                                    if (_distance_to_target < 160)
                                    {
                                        var _array_grenade_id = [];
                                        
                                        repeat (npc_get_prob_grenade_f1(npc_id))
                                            array_push(_array_grenade_id, "grenade_f1");
                                        
                                        repeat (npc_get_prob_grenade_rgd(npc_id))
                                            array_push(_array_grenade_id, "grenade_rgd5");
                                        
                                        repeat (npc_get_prob_grenade_flash(npc_id))
                                            array_push(_array_grenade_id, "grenade_flash");
                                        
                                        _grenade_id = _array_grenade_id[irandom(array_length(_array_grenade_id) - 1)];
                                        
                                        if (_grenade_id != "no_item")
                                        {
                                            var p = UnknownEnum.Value_32;
                                            ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    if (target_relation == UnknownEnum.Value_0)
                    {
                        if (_lo_vedo == true)
                        {
                            var p = UnknownEnum.Value_0;
                            ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                            
                            if (_mouse_over_npc)
                            {
                                if (_arma_dir_target == false)
                                {
                                    p = UnknownEnum.Value_21;
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                }
                                
                                if (_arma_dir_target == true && item_exists(player_get_local().arma_now))
                                {
                                    p = UnknownEnum.Value_37;
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                }
                            }
                            
                            if (_distance_target <= neutral_distance_target)
                            {
                                if (counter_target_seen_neutral == 0)
                                {
                                    if (_arma_dir_target == false)
                                    {
                                        p = UnknownEnum.Value_21;
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                    }
                                    
                                    if (_arma_dir_target == true)
                                    {
                                        p = UnknownEnum.Value_36;
                                        ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                    }
                                }
                            }
                        }
                        
                        if (_lo_vedo == false)
                        {
                            var p = UnknownEnum.Value_0;
                            ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                        }
                    }
                    
                    if (target_relation == UnknownEnum.Value_1)
                    {
                    }
                    
                    if (just_shot != 0)
                    {
                        _new_just_shot = 0;
                        
                        if (human_state_now != UnknownEnum.Value_11)
                        {
                            if (scr_chance(75))
                            {
                                if (_cover_pos_found == true && _distance_to_target_in_sight > 200)
                                {
                                    var p = UnknownEnum.Value_13;
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                }
                            }
                            
                            if (_lo_vedo == false && _line_of_sight == true)
                            {
                                if (_arma_dir_target == false)
                                {
                                    var p = UnknownEnum.Value_21;
                                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                                }
                            }
                        }
                    }
                }
                
                if (!instance_exists(target))
                {
                    var p = UnknownEnum.Value_0;
                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                }
            }
            
            if (_grenade_close == true && _grenade_close_same_faction == true)
            {
                if (_array_grenade_cover[0] != 0)
                {
                    if (scr_chance(npc_get_prob_grenade_cover(npc_id)))
                    {
                        var p = UnknownEnum.Value_30;
                        ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                    }
                }
            }
            
            if (_grenade_flash == true)
            {
                var p = UnknownEnum.Value_31;
                ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
            }
            
            if (global.is_emission_now == true)
            {
                if (!player_get_local_var("is_indoor", false))
                {
                    if (global.state_emission_now > UnknownEnum.Value_16)
                    {
                        var p = UnknownEnum.Value_33;
                        ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                    }
                }
            }
            
            if (have_to_reload == true)
            {
                var p = UnknownEnum.Value_20;
                ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
            }
            
            if (human_state_now == -1)
            {
                human_state_now = UnknownEnum.Value_0;
                var p = UnknownEnum.Value_0;
                ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
            }
            
            just_shot = _new_just_shot;
            
            if (npc_id == "green_army_quest_swamp" && target_relation == UnknownEnum.Value_2)
            {
                if (instance_exists(target) && distance_to_object(target) < 150)
                {
                    ds_priority_destroy(_list_action);
                    _list_action = ds_priority_create();
                    var p = UnknownEnum.Value_11;
                    ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                }
            }
            
            if (force_moving_towards_player)
            {
                var p = UnknownEnum.Value_38;
                ds_priority_add(_list_action, p, global.sub_ai_peso[p]);
                force_moving_towards_player = false;
            }
            
            if (ds_priority_size(_list_action) > 0)
            {
                _next_state = ds_priority_find_max(_list_action);
                debug_next_state = _next_state;
                var _change_state = false;
                
                if (_next_state != human_state_now)
                {
                    if (global.sub_ai_stop[human_state_now] == true || _next_state == UnknownEnum.Value_31)
                    {
                        if (global.sub_ai_peso[human_state_now] < global.sub_ai_peso[_next_state])
                            _change_state = true;
                    }
                }
                
                if (state_finito == true)
                    _change_state = true;
                
                if (_change_state == true)
                {
                    if (human_state_now != _next_state)
                        human_state_before = human_state_now;
                    
                    state_finito = true;
                    human_state_now = _next_state;
                    timer_last_state = current_time;
                    draw_weapon = true;
                }
                
                if (state_finito == true)
                {
                    state_finito = false;
                    
                    switch (_next_state)
                    {
                        case UnknownEnum.Value_15:
                            path_end();
                            move_point_x = _array[0];
                            move_point_y = _array[1];
                            break;
                        
                        case UnknownEnum.Value_25:
                            path_end();
                            move_point_x = _array_aim_moving[0];
                            move_point_y = _array_aim_moving[1];
                            break;
                        
                        case UnknownEnum.Value_12:
                            move_point_x = _array_cover[0];
                            move_point_y = _array_cover[1];
                            
                            if (scr_chance(50))
                                scr_draw_npc_text(id, UnknownEnum.Value_1);
                            
                            break;
                        
                        case UnknownEnum.Value_14:
                            path_end();
                            move_point_x = _array_change_cover[0];
                            move_point_y = _array_change_cover[1];
                            break;
                        
                        case UnknownEnum.Value_13:
                            move_point_x = _array_cover[0];
                            move_point_y = _array_cover[1];
                            
                            if (scr_chance(80))
                                scr_draw_npc_text(id, UnknownEnum.Value_10);
                            
                            break;
                        
                        case UnknownEnum.Value_30:
                            move_point_x = _array_grenade_cover[0];
                            move_point_y = _array_grenade_cover[1];
                            
                            if (scr_chance(50))
                                scr_draw_npc_text(id, UnknownEnum.Value_16);
                            
                            break;
                        
                        case UnknownEnum.Value_31:
                            path_end();
                            scr_draw_npc_text(id, UnknownEnum.Value_17);
                            break;
                        
                        case UnknownEnum.Value_32:
                            grenade_amount_thrown++;
                            path_end();
                            scr_draw_npc_text(id, UnknownEnum.Value_18);
                            draw_weapon = false;
                            var _sprite = item_grenade_get_animation(_grenade_id);
                            var aa = instance_create_depth(x, y, 0, obj_arms_grenade);
                            aa.linked_id = id;
                            aa.image_xscale = image_xscale;
                            aa.sprite_index = _sprite;
                            aa.target_x = last_seen_x;
                            aa.target_y = last_seen_y;
                            aa.grenade_id = _grenade_id;
                            aa.faction = npc_get_faction(npc_id);
                            break;
                        
                        case UnknownEnum.Value_16:
                            scr_enemy_choose_move_pos(last_seen_x, last_seen_y, 8);
                            
                            if (scr_chance(50))
                                scr_draw_npc_text(id, UnknownEnum.Value_8);
                            
                            break;
                        
                        case UnknownEnum.Value_17:
                            var _dir = point_direction(_tx, _ty, x, y);
                            var _dis = npc_get_alert_visual_distance(npc_id) / 2;
                            move_point_x = _tx + lengthdir_x(_dis, _dir);
                            move_point_y = _ty + lengthdir_y(_dis, _dir);
                            break;
                        
                        case UnknownEnum.Value_26:
                            path_end();
                            
                            if (ds_list_size(_lista_near_me) > 0)
                            {
                                var _id_near = ds_list_find_value(_lista_near_me, 0);
                                var _x_near = _id_near.x;
                                var _y_near = _id_near.y;
                                var _dir_near = point_direction(x, y, _x_near, _y_near);
                                hspd = -lengthdir_x(0.5, _dir_near);
                                vspd = -lengthdir_y(0.5, _dir_near);
                            }
                            
                            break;
                        
                        case UnknownEnum.Value_23:
                            scr_enemy_choose_move_pos(last_seen_x, last_seen_y, 8);
                            
                            if (scr_chance(50))
                                scr_draw_npc_text(id, UnknownEnum.Value_14);
                            
                            break;
                        
                        case UnknownEnum.Value_19:
                            path_end();
                            scr_enemy_choose_move_pos(last_seen_x + irandom_range(-7, 7), last_seen_y + irandom_range(-7, 7), 0);
                            
                            if (scr_chance(75))
                                scr_draw_npc_text(id, UnknownEnum.Value_9);
                            
                            break;
                        
                        case UnknownEnum.Value_27:
                            just_shot = 0;
                            
                            if (scr_chance(75))
                                scr_draw_npc_text(id, UnknownEnum.Value_13);
                            
                            break;
                        
                        case UnknownEnum.Value_18:
                            chase_new_target_location = false;
                            scr_enemy_choose_move_pos(last_seen_x, last_seen_y, 16);
                            
                            if (scr_chance(50))
                                scr_draw_npc_text(id, UnknownEnum.Value_11);
                            
                            break;
                        
                        case UnknownEnum.Value_20:
                            reloading = true;
                            alarm[0] = irandom(100) + 80;
                            path_end();
                            
                            if (scr_chance(50))
                                scr_draw_npc_text(id, UnknownEnum.Value_6);
                            
                            have_to_reload = false;
                            break;
                        
                        case UnknownEnum.Value_0:
                            path_end();
                            visto_prima_volta = false;
                            break;
                        
                        case UnknownEnum.Value_11:
                            path_end();
                            
                            if (human_state_before == UnknownEnum.Value_19)
                            {
                                if (scr_chance(50))
                                    scr_draw_npc_text(id, UnknownEnum.Value_12);
                            }
                            
                            break;
                        
                        case UnknownEnum.Value_21:
                            path_end();
                            
                            if (human_state_before == UnknownEnum.Value_19)
                            {
                                if (scr_chance(75))
                                    scr_draw_npc_text(id, UnknownEnum.Value_12);
                            }
                            
                            break;
                        
                        case UnknownEnum.Value_28:
                            scr_enemy_choose_move_pos(ally_morto_x, ally_morto_y, 8);
                            alleato_morto_vicino = 2;
                            scr_draw_npc_text(id, UnknownEnum.Value_15);
                            
                            if (instance_exists(id_chest_ally_dead.id_of_the_killer))
                                target = id_chest_ally_dead.id_of_the_killer;
                            
                            break;
                        
                        case UnknownEnum.Value_33:
                            var _y = y;
                            var _pos_found = false;
                            move_point_x = x + 64;
                            move_point_y = y;
                            break;
                        
                        case UnknownEnum.Value_29:
                            path_end();
                            move_point_x = _array_range_pos[0];
                            move_point_y = _array_range_pos[1];
                            break;
                        
                        case UnknownEnum.Value_36:
                            path_end();
                            
                            if (target == _player.id)
                            {
                                if (can_talk == true)
                                {
                                    if (scr_chance(50))
                                    {
                                        scr_npc_reset_talk(true, 180);
                                        scr_draw_npc_text(id, UnknownEnum.Value_3);
                                    }
                                }
                            }
                            
                            break;
                        
                        case UnknownEnum.Value_37:
                            path_end();
                            
                            if (target == _player.id)
                            {
                                if (can_talk == true)
                                {
                                    if (scr_chance(101))
                                    {
                                        scr_npc_reset_talk(true, 120);
                                        scr_draw_npc_text(id, UnknownEnum.Value_4);
                                    }
                                }
                            }
                            
                            break;
                        
                        case UnknownEnum.Value_9:
                            scr_enemy_choose_move_pos(x, y, 0);
                            break;
                        
                        case UnknownEnum.Value_10:
                            var _next_x = ds_list_find_value(lista_path_x, path_position_now + 1);
                            var _next_y = ds_list_find_value(lista_path_y, path_position_now + 1);
                            var _prev_x = ds_list_find_value(lista_path_x, path_position_now);
                            var _prev_y = ds_list_find_value(lista_path_y, path_position_now);
                            
                            if (!is_undefined(_next_x) && !is_undefined(_next_y) && !is_undefined(_prev_x) && !is_undefined(_prev_y))
                            {
                                move_point_x = _next_x;
                                move_point_y = _next_y;
                                path_position_now++;
                            }
                            
                            break;
                        
                        case UnknownEnum.Value_3:
                            path_end();
                            scr_npc_create_animation(obj_arms_drink);
                            break;
                        
                        case UnknownEnum.Value_4:
                            path_end();
                            scr_npc_create_animation(obj_arms_smoke);
                            break;
                        
                        case UnknownEnum.Value_2:
                            path_end();
                            scr_npc_create_animation(obj_arms_eat);
                            break;
                        
                        case UnknownEnum.Value_8:
                            path_end();
                            scr_npc_create_animation(obj_arms_guitar);
                            break;
                        
                        case UnknownEnum.Value_5:
                            path_end();
                            scr_npc_create_animation(obj_arms_scientist_working);
                            break;
                        
                        case UnknownEnum.Value_7:
                            path_end();
                            break;
                    }
                }
            }
            
            ds_priority_destroy(_list_action);
        }
        
        switch (human_state_now)
        {
            case UnknownEnum.Value_0:
                path_end();
                scr_enemy_choose_idle_or_move();
                scr_collision();
                draw_weapon = true;
                
                if (is_in_hub())
                {
                    target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
                    
                    if (x > xprevious)
                    {
                        target_for_image_scale = x + 2;
                        weapon_pointing_direction = 300;
                    }
                    else if (x == xprevious)
                    {
                    }
                    else if (x < xprevious)
                    {
                        target_for_image_scale = x - 2;
                        weapon_pointing_direction = 240;
                    }
                }
                else
                {
                    scr_move_arma_random(2, weapon_pointing_angle, 1);
                    
                    if (object_index == obj_green_quest_swamp)
                    {
                        if (instance_exists(obj_faro))
                            weapon_pointing_direction = point_direction(x, y, obj_faro.x, obj_faro.y - 150);
                    }
                    
                    target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
                }
                
                break;
            
            case UnknownEnum.Value_1:
                path_end();
                scr_collision();
                draw_weapon = true;
                scr_move_arma_random(2, weapon_pointing_angle, 1);
                target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
                
                if (object_index == obj_scientist_2)
                {
                    scr_npc_state_arms(obj_arms_scientist_working);
                    
                    if (scr_chance(0.5))
                        scr_draw_npc_text(id, UnknownEnum.Value_103);
                }
                
                break;
            
            case UnknownEnum.Value_11:
                var _termina_state = false;
                
                if (shoot_time == 0)
                {
                    path_end();
                    
                    if (scr_chance(75))
                    {
                        var _xx = irandom_range(-8, 8);
                        scr_enemy_choose_move_pos(x + _xx, y + _xx, 16);
                    }
                    else
                    {
                        move_point_x = x;
                        move_point_y = y;
                    }
                }
                
                if (instance_exists(target))
                {
                    if (target_relation == UnknownEnum.Value_2)
                    {
                        NPCrecoil.SetAimDirection();
                        weapon_pointing_direction = NPCrecoil.direction_aim;
                        scr_enemy_shoot();
                        shoot_time++;
                        
                        if (shoot_time >= shoot_time_max)
                        {
                            shoot_time = 0;
                            
                            if (scr_chance(30))
                                _termina_state = true;
                        }
                        
                        if (target_visto == false)
                            _termina_state = true;
                    }
                    else
                    {
                        _termina_state = true;
                    }
                }
                else
                {
                    _termina_state = true;
                }
                
                if (_termina_state == true)
                {
                    can_shoot_uneffective_range = false;
                    state_finito = true;
                }
                
                scr_enemy_path();
                break;
            
            case UnknownEnum.Value_20:
                if (reloading == false)
                {
                    state_finito = true;
                    
                    if (image_xscale == 1)
                        weapon_pointing_direction = 0;
                    else
                        weapon_pointing_direction = 180;
                }
                
                if (current_time > (timer_last_state + aim_still_timer))
                {
                    reloading = false;
                    state_finito = true;
                }
                
                break;
            
            case UnknownEnum.Value_23:
                scr_enemy_path();
                
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                    state_finito = true;
                
                break;
            
            case UnknownEnum.Value_16:
                scr_enemy_path();
                
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                    state_finito = true;
                
                break;
            
            case UnknownEnum.Value_17:
                scr_enemy_path();
                
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                    state_finito = true;
                
                break;
            
            case UnknownEnum.Value_26:
                scr_collision();
                var _my_faction = faction;
                var _my_target = target;
                var _my_id = id;
                var _my_x = x;
                var _my_y = y;
                var _exit_state = true;
                
                with (obj_npc_parent)
                {
                    if (id != _my_id)
                    {
                        if (faction == _my_faction)
                        {
                            if (point_distance(x, y, _my_x, _my_y) < 10)
                                _exit_state = false;
                        }
                    }
                }
                
                if (_exit_state == true)
                    state_finito = true;
                
                break;
            
            case UnknownEnum.Value_18:
                scr_enemy_path();
                
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                    state_finito = true;
                
                break;
            
            case UnknownEnum.Value_12:
                scr_enemy_path();
                
                if (point_distance(x, y, move_point_x, move_point_y) < 4)
                    state_finito = true;
                
                break;
            
            case UnknownEnum.Value_13:
                scr_enemy_path();
                
                if (point_distance(x, y, move_point_x, move_point_y) < 4)
                    state_finito = true;
                
                break;
            
            case UnknownEnum.Value_14:
                scr_enemy_path();
                
                if (point_distance(x, y, move_point_x, move_point_y) < 4)
                    state_finito = true;
                
                weapon_pointing_direction = point_direction(x, y, last_seen_x, last_seen_y);
                break;
            
            case UnknownEnum.Value_30:
                scr_enemy_path();
                
                if (point_distance(x, y, move_point_x, move_point_y) < 4)
                    state_finito = true;
                
                break;
            
            case UnknownEnum.Value_31:
                path_end();
                grenade_flash_timer++;
                
                if (grenade_flash_timer >= grenade_flash_timer_max)
                {
                    grenade_flash_timer = 0;
                    grenade_flash = false;
                    state_finito = true;
                }
                
                flash_weapon_dir_timer++;
                
                if (flash_weapon_dir_timer > flash_weapon_dir_timer_max)
                {
                    flash_weapon_dir = irandom(360);
                    flash_weapon_dir_timer = 0;
                }
                
                var _angle_diff = angle_difference(flash_weapon_dir, weapon_pointing_direction);
                target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
                
                if (abs(_angle_diff) > angle_min_to_rotate)
                {
                    if (_angle_diff > 0)
                        weapon_pointing_direction += angle_increase_for_target;
                    
                    if (_angle_diff < 0)
                        weapon_pointing_direction -= angle_increase_for_target;
                }
                
                shoot_time++;
                
                if (shoot_time >= 15)
                {
                    riflessi_max = 15;
                    scr_enemy_shoot();
                    shoot_time = 0;
                }
                
                break;
            
            case UnknownEnum.Value_32:
                scr_npc_arms_animation(obj_arms_drink);
                break;
            
            case UnknownEnum.Value_15:
                scr_enemy_path();
                
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                    state_finito = true;
                
                if (current_time >= (timer_last_state + timer_last_state_max))
                    state_finito = true;
                
                weapon_pointing_direction = point_direction(x, y, last_seen_x, last_seen_y);
                break;
            
            case UnknownEnum.Value_25:
                scr_enemy_path();
                
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                    state_finito = true;
                
                weapon_pointing_direction = point_direction(x, y, last_seen_x, last_seen_y);
                target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
                break;
            
            case UnknownEnum.Value_24:
                path_end();
                weapon_pointing_direction = point_direction(x, y, last_seen_x, last_seen_y);
                target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
                
                if (current_time >= (timer_last_state + aim_still_timer))
                    state_finito = true;
                
                break;
            
            case UnknownEnum.Value_19:
                if (scr_chance(npc_get_prob_idle(npc_id)))
                {
                    hspd = 0;
                    vspd = 0;
                }
                
                if (scr_chance(npc_get_prob_move(npc_id) * 6))
                {
                    var dir = irandom(360);
                    hspd = lengthdir_x(npc_get_spd_not_alerted(npc_id), dir);
                    vspd = lengthdir_y(npc_get_spd_not_alerted(npc_id), dir);
                }
                
                scr_collision();
                scr_move_arma_random(4, weapon_pointing_angle, 3);
                target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
                break;
            
            case UnknownEnum.Value_27:
                path_end();
                scr_move_arma_random(4, weapon_pointing_angle, 3);
                target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
                break;
            
            case UnknownEnum.Value_21:
                var _dir = point_direction(x, y, dir_to_aim_x, dir_to_aim_y);
                var _angle_diff = angle_difference(direction_to_aim, weapon_pointing_direction);
                target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
                
                if (abs(_angle_diff) > (angle_min_to_rotate * 1.5))
                {
                    if (_angle_diff > 0)
                        weapon_pointing_direction += angle_increase_for_target;
                    
                    if (_angle_diff < 0)
                        weapon_pointing_direction -= angle_increase_for_target;
                }
                else
                {
                    weapon_pointing_direction = direction_to_aim;
                    state_finito = true;
                }
                
                break;
            
            case UnknownEnum.Value_29:
                riflessi++;
                scr_enemy_path();
                timer_recheck_eff_range++;
                
                if (point_distance(x, y, move_point_x, move_point_y) < 4)
                {
                    state_finito = true;
                    timer_recheck_eff_range = 0;
                }
                
                if (timer_recheck_eff_range >= timer_recheck_eff_range_max)
                {
                    state_finito = true;
                    timer_recheck_eff_range = 0;
                    can_shoot_uneffective_range = true;
                }
                
                weapon_pointing_direction = point_direction(x, y, last_seen_x, last_seen_y);
                break;
            
            case UnknownEnum.Value_38:
                scr_enemy_path();
                
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                    state_finito = true;
                
                if (target_seen == true)
                    state_finito = true;
                
                if (instance_exists(target))
                {
                    move_point_x = target.x;
                    move_point_y = target.y;
                }
                
                break;
            
            case UnknownEnum.Value_9:
                scr_enemy_path();
                
                if (point_distance(x, y, move_point_x, move_point_y) < 4)
                    state_finito = true;
                
                break;
            
            case UnknownEnum.Value_28:
                scr_enemy_path();
                
                if (point_distance(x, y, move_point_x, move_point_y) < 4)
                    state_finito = true;
                
                break;
            
            case UnknownEnum.Value_33:
                scr_enemy_path();
                
                if (point_distance(x, y, move_point_x, move_point_y) < 4)
                    state_finito = true;
                
                break;
            
            case UnknownEnum.Value_36:
                if (instance_exists(target))
                {
                    var _x = target.x;
                    var _y = target.y;
                    var _dir = point_direction(x, y, _x, _y);
                    weapon_pointing_direction = _dir;
                    target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
                    
                    if (!instance_line_of_sight(x, y, target))
                        state_finito = true;
                    
                    if (point_distance(x, y, _x, _y) >= (neutral_distance_target * 1.5))
                        state_finito = true;
                    
                    timer_see_neutral++;
                    
                    if (timer_see_neutral >= timer_see_neutral_max)
                    {
                        state_finito = true;
                        counter_target_seen_neutral = 1;
                        timer_see_neutral = 0;
                    }
                }
                
                break;
            
            case UnknownEnum.Value_37:
                if (instance_exists(target))
                {
                    var _x = target.x;
                    var _y = target.y;
                    var _dir = point_direction(x, y, _x, _y);
                    weapon_pointing_direction = _dir;
                    target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
                    
                    if (!instance_line_of_sight(x, y, target))
                        state_finito = true;
                    
                    if (instance_exists(obj_mouse) && point_distance(x, y, obj_mouse.x, obj_mouse.y) > 10)
                        state_finito = true;
                }
                
                break;
            
            case UnknownEnum.Value_10:
                scr_enemy_path();
                scr_move_arma_random(2, 1, 1);
                
                if (point_distance(x, y, move_point_x, move_point_y) < 2)
                {
                    state_finito = true;
                    
                    for (var i = 0; i < array_length(global.list_n_id); i++)
                    {
                        if (global.list_n_id[i] == id)
                        {
                            global.list_n_x[i] = x;
                            global.list_n_y[i] = y;
                        }
                    }
                }
                
                break;
            
            case UnknownEnum.Value_3:
                scr_npc_arms_animation(obj_arms_drink);
                break;
            
            case UnknownEnum.Value_4:
                scr_npc_arms_animation(obj_arms_smoke);
                break;
            
            case UnknownEnum.Value_2:
                scr_npc_arms_animation(obj_arms_eat);
                break;
            
            case UnknownEnum.Value_5:
                scr_npc_arms_animation(obj_arms_scientist_working);
                break;
            
            case UnknownEnum.Value_8:
                scr_npc_arms_animation(obj_arms_guitar);
                break;
            
            case UnknownEnum.Value_7:
                scr_enemy_path();
                
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                {
                    path_end();
                    
                    if (!instance_exists(obj_arms_guitar))
                    {
                        scr_npc_create_animation(obj_arms_guitar);
                        human_state_now = UnknownEnum.Value_8;
                    }
                    else
                    {
                        human_state_now = UnknownEnum.Value_0;
                    }
                }
                
                break;
            
            case UnknownEnum.Value_6:
                path_end();
                scr_move_arma_random(2, weapon_pointing_angle, 1);
                var _active = scr_check_quest_in_corso(UnknownEnum.Value_69);
                
                if (global.quest_unique_done[UnknownEnum.Value_70] == true)
                {
                    if (player_exists_local() && player_distance_local(x, y) < 48)
                    {
                        if (can_talk == true)
                        {
                            scr_draw_npc_text(id, UnknownEnum.Value_150);
                            can_talk = false;
                        }
                    }
                }
                
                target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
                break;
        }
        
        break;
    
    case "human_alert":
        target = scr_find_target_for_human();
        draw_weapon = true;
        
        if (target != -4)
        {
            if (target_relation == UnknownEnum.Value_2)
            {
                weapon_pointing_direction = point_direction(x, y, target.x, target.y);
                scr_enemy_alert_near_enemy();
                
                if (instance_line_of_sight(x, y, target))
                {
                    state = "human_shoot";
                }
                else
                {
                    move_point_x = 0;
                    move_point_y = 0;
                    
                    if (point_distance(x, y, target.x, target.y) < 200)
                    {
                        scr_enemy_search_shoot_position();
                        
                        if (move_point_x != 0)
                        {
                            state = "human_move_to_shoot_position";
                        }
                        else
                        {
                            scr_enemy_choose_move_pos(last_seen_x, last_seen_y, 64);
                            state = "human_chase_target";
                        }
                    }
                    else if (scr_chance(0.5))
                    {
                        scr_enemy_choose_move_pos(last_seen_x, last_seen_y, 64);
                        state = "human_chase_target";
                    }
                }
            }
            
            if (target_relation == UnknownEnum.Value_0)
            {
                hspd = 0;
                vspd = 0;
                state = "human_aim_neutral_target";
            }
            
            if (target_relation == UnknownEnum.Value_1)
            {
                hspd = 0;
                vspd = 0;
                state = "human_patrol";
            }
        }
        
        break;
    
    case "human_take_cover":
        if (object_index == obj_green_quest_swamp)
            state = "human_alert";
        
        if (point_distance(x, y, move_point_x, move_point_y) < 4)
        {
            target = scr_find_target_for_human();
            
            if (target_relation == UnknownEnum.Value_2)
            {
                if (ammo_now < (item_weapon_get_magazine(arma_now) * 0.5))
                {
                    var chance = (100 - ((ammo_now * 100) / item_weapon_get_magazine(arma_now))) * 2;
                    
                    if (scr_chance(chance))
                    {
                        state = "human_reloading";
                        reloading = true;
                        alarm[0] = irandom(100) + 60;
                        scr_draw_npc_text(id, UnknownEnum.Value_6);
                    }
                }
                else if (target != -4)
                {
                    state = "human_alert";
                }
            }
            
            if (target_relation == UnknownEnum.Value_0)
            {
                hspd = 0;
                vspd = 0;
                state = "human_aim_neutral_target";
            }
            
            if (target_relation == UnknownEnum.Value_1)
            {
                hspd = 0;
                vspd = 0;
                state = "human_patrol";
            }
        }
        
        scr_enemy_path();
        break;
    
    case "human_move_to_shoot_position":
        target = scr_find_target_for_human();
        
        if (target != -4)
        {
            if (target_relation == UnknownEnum.Value_2)
            {
                weapon_pointing_direction = point_direction(x, y, target.x, target.y);
                
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                {
                    if (instance_line_of_sight(x, y, target))
                        state = "human_shoot";
                    else
                        state = "human_alert";
                }
            }
            
            if (target_relation == UnknownEnum.Value_0)
            {
                hspd = 0;
                vspd = 0;
                state = "human_aim_neutral_target";
            }
            
            if (target_relation == UnknownEnum.Value_1)
            {
                hspd = 0;
                vspd = 0;
                state = "human_patrol";
            }
        }
        
        scr_enemy_path();
        break;
    
    case "human_shoot":
        draw_weapon = true;
        
        if (shoot_time == 0)
        {
            path_end();
            
            if (scr_chance(75))
            {
                scr_enemy_choose_move_pos(x, y, 16);
            }
            else
            {
                move_point_x = x;
                move_point_y = y;
            }
        }
        
        if (hp <= (0.3 * npc_get_hp(npc_id)))
        {
            if (scr_chance(1))
                scr_draw_npc_text(id, UnknownEnum.Value_2);
        }
        
        target = scr_find_target_for_human();
        
        if (target != -4)
        {
            if (target_relation == UnknownEnum.Value_2)
            {
                last_seen_x = target.x;
                last_seen_y = target.y;
                
                if (instance_line_of_sight(x, y, target))
                {
                    if (point_distance(x, y, target.x, target.y) < (npc_get_alert_visual_distance(npc_id) * 1.5))
                    {
                        scr_enemy_alert_near_enemy();
                        scr_enemy_shoot();
                        shoot_time++;
                        
                        if (shoot_time >= shoot_time_max)
                        {
                            shoot_time = 0;
                            
                            if (scr_chance(50))
                            {
                                if (scr_chance(80))
                                {
                                    scr_enemy_search_cover_position();
                                    state = "human_take_cover";
                                    scr_draw_npc_text(id, UnknownEnum.Value_1);
                                }
                                else
                                {
                                    scr_enemy_change_cover();
                                    state = "human_take_cover";
                                }
                            }
                            else
                            {
                                state = "human_shoot";
                                
                                if (scr_chance(10))
                                    scr_draw_npc_text(id, UnknownEnum.Value_0);
                            }
                            
                            if (point_direction(x, y, obj_cursor.aa_x, obj_cursor.aa_y) < 16)
                            {
                                scr_enemy_search_cover_position();
                                state = "human_take_cover";
                                scr_draw_npc_text(id, UnknownEnum.Value_1);
                            }
                        }
                    }
                    else
                    {
                        scr_enemy_choose_move_pos(last_seen_x, last_seen_y, 8);
                        state = "human_chase_target";
                        scr_draw_npc_text(id, UnknownEnum.Value_8);
                    }
                }
                else
                {
                    shoot_time = 0;
                    riflessi = 0;
                    
                    if (scr_chance(0.13))
                    {
                        scr_enemy_choose_move_pos(last_seen_x, last_seen_y, 8);
                        state = "human_chase_target";
                        scr_draw_npc_text(id, UnknownEnum.Value_8);
                    }
                }
                
                if (ammo_now < (item_weapon_get_magazine(arma_now) * 0.5))
                {
                    var chance = 100 - ((ammo_now * 100) / item_weapon_get_magazine(arma_now));
                    
                    if (scr_chance(chance))
                    {
                        scr_enemy_search_cover_position();
                        state = "human_take_cover";
                        scr_draw_npc_text(id, UnknownEnum.Value_7);
                    }
                    
                    if (npc_get_spd_alerted(npc_id) == 0)
                    {
                        if (scr_chance(chance))
                        {
                            state = "human_reloading";
                            reloading = true;
                            alarm[0] = irandom(100) + 60;
                            scr_draw_npc_text(id, UnknownEnum.Value_6);
                        }
                    }
                }
            }
            
            if (target_relation == UnknownEnum.Value_0)
            {
                hspd = 0;
                vspd = 0;
                state = "human_aim_neutral_target";
            }
            
            if (target_relation == UnknownEnum.Value_1)
            {
                hspd = 0;
                vspd = 0;
                state = "human_patrol";
            }
        }
        
        scr_enemy_path();
        break;
    
    case "human_chase_target":
        target = scr_find_target_for_human();
        draw_weapon = true;
        
        if (target != -4)
        {
            if (target_relation == UnknownEnum.Value_2)
            {
                if (instance_line_of_sight(x, y, target) && point_distance(x, y, target.x, target.y) < (npc_get_alert_visual_distance(npc_id) * 1.4))
                    state = "human_shoot";
                
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                {
                    if (!instance_line_of_sight(x, y, target))
                    {
                        path_end();
                        alarm[5] = reset_state_to_patrol_time;
                        state = "human_look_around";
                        scr_draw_npc_text(id, UnknownEnum.Value_9);
                    }
                }
            }
            
            if (target_relation == UnknownEnum.Value_0)
            {
                hspd = 0;
                vspd = 0;
                state = "human_aim_neutral_target";
            }
            
            if (target_relation == UnknownEnum.Value_1)
            {
                hspd = 0;
                vspd = 0;
                state = "human_patrol";
            }
        }
        
        scr_enemy_path();
        break;
    
    case "human_encounter_chase":
        if (faction != "Mutants")
        {
            target = scr_find_target_for_human();
            
            if (target != -4)
            {
                if (target_relation == UnknownEnum.Value_2)
                {
                    if (instance_line_of_sight(x, y, target) && point_distance(x, y, target.x, target.y) < (npc_get_alert_visual_distance(npc_id) * 1.2))
                        state = "human_shoot";
                }
                
                if (target_relation == UnknownEnum.Value_0)
                {
                    hspd = 0;
                    vspd = 0;
                    state = "human_aim_neutral_target";
                }
                
                if (target_relation == UnknownEnum.Value_1)
                {
                    hspd = 0;
                    vspd = 0;
                    state = "human_patrol";
                }
            }
        }
        
        if (faction == "Mutants")
        {
            if (instance_line_of_sight(x, y, target) && point_distance(x, y, target.x, target.y) < 400)
                state = "mutant_alert";
        }
        
        if (instance_exists(target))
        {
            move_point_x = target.x;
            move_point_y = target.y;
        }
        else
        {
            move_point_x = x;
            move_point_y = y;
        }
        
        scr_enemy_path();
        break;
    
    case "human_look_around":
        target = scr_find_target_for_human();
        draw_weapon = true;
        
        if (scr_chance(npc_get_prob_idle(npc_id)))
        {
            hspd = 0;
            vspd = 0;
        }
        
        if (scr_chance(npc_get_prob_move(npc_id) * 6))
        {
            var dir = irandom(360);
            hspd = lengthdir_x(npc_get_spd_not_alerted(npc_id), dir);
            vspd = lengthdir_y(npc_get_spd_not_alerted(npc_id), dir);
        }
        
        scr_collision();
        
        if (target != -4)
        {
            if (scr_chance(2))
                weapon_pointing_amount = choose(-weapon_pointing_angle, weapon_pointing_angle, 0);
            
            weapon_pointing_direction += weapon_pointing_amount;
            target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
            
            if (target_relation == UnknownEnum.Value_2)
            {
                if (instance_line_of_sight(x, y, target))
                {
                    scr_draw_npc_text(id, UnknownEnum.Value_12);
                    state = "human_alert";
                }
            }
            
            if (target_relation == UnknownEnum.Value_0)
            {
                hspd = 0;
                vspd = 0;
                state = "human_aim_neutral_target";
            }
            
            if (target_relation == UnknownEnum.Value_1)
            {
                hspd = 0;
                vspd = 0;
                state = "human_patrol";
            }
        }
        
        break;
    
    case "human_reloading":
        if (reloading == false)
            state = "human_alert";
        
        if (image_xscale == 1)
            weapon_pointing_direction = 0;
        else
            weapon_pointing_direction = 180;
        
        break;
    
    case "quest_swamp_leader_talk":
        break;
    
    case "scientist_idle":
        scr_enemy_choose_idle_or_move();
        scr_collision();
        
        if (scr_chance(2))
            weapon_pointing_amount = choose(-weapon_pointing_angle, weapon_pointing_angle, 0);
        
        weapon_pointing_direction += weapon_pointing_amount;
        target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
        target = scr_find_target_for_human();
        
        if (target != -4)
        {
            switch (target_relation)
            {
                case UnknownEnum.Value_2:
                    hspd = 0;
                    vspd = 0;
                    state = "human_shoot";
                    break;
                
                case UnknownEnum.Value_0:
                    break;
                
                case UnknownEnum.Value_1:
                    break;
            }
        }
        
        break;
    
    case "scientist_working":
        scr_npc_state_arms(obj_arms_scientist_working);
        
        if (scr_chance(0.2))
            scr_draw_npc_text(id, UnknownEnum.Value_103);
        
        break;
    
    case "mutant_patrol":
        scr_bullet_near();
        state_enemy_mutant_patrol();
        break;
    
    case "mutant_alert":
        scr_bullet_near();
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id));
        
        if (target != -4)
        {
            target_seen = true;
            
            if (instance_exists(target))
            {
                target_for_image_scale = target.x;
                
                if (move_point_x == 0)
                {
                    range_ = 64;
                    move_point_x = target.x + irandom_range(-range_, range_);
                    move_point_y = target.y + irandom_range(-range_, range_);
                }
                
                last_seen_x = target.x;
                last_seen_y = target.y;
                var range_ = 64;
                
                if (scr_chance(npc_get_prob_move(npc_id)))
                {
                    move_point_x = target.x + irandom_range(-range_, range_);
                    move_point_y = target.y + irandom_range(-range_, range_);
                    path_timer = path_timer_reset + 1;
                }
                
                if (point_distance(x, y, move_point_x, move_point_y) < 8)
                {
                    move_point_x = target.x + irandom_range(-range_ * 2, range_ * 2);
                    move_point_y = target.y + irandom_range(-range_ * 2, range_ * 2);
                    path_timer = path_timer_reset + 1;
                }
                
                if (scr_chance(npc_get_prob_attack(npc_id)))
                {
                    move_point_x = target.x;
                    move_point_y = target.y;
                    path_timer = path_timer_reset + 1;
                }
                
                if (npc_id == "ghoul")
                {
                    if (ghoul_buffed_timer > 0)
                    {
                        ghoul_buffed_timer++;
                        
                        if (ghoul_buffed_timer >= ghoul_buffed_timer_max)
                            ghoul_buffed_timer = 0;
                    }
                    
                    if (point_distance(x, y, target.x, target.y) < 80 && point_distance(x, y, target.x, target.y) > 40)
                    {
                        if (can_attack == true)
                        {
                            if (scr_chance(2))
                                state = "ghoul_attack1";
                        }
                    }
                }
                
                if (npc_id == "ghoul_2")
                {
                    ghoul_2_buff_timer++;
                    
                    if (ghoul_2_buff_timer >= ghoul_2_buff_timer_max)
                    {
                        ghoul_2_buff_timer = 0;
                        var a = UnknownEnum.Value_60;
                        var _o = obj_particles_controller;
                        part_particles_create(_o.particles_system[a], x + (image_xscale * 15), y - 6, _o.particles_type[a], 1);
                        
                        with (obj_enemy_ghoul)
                        {
                            if (point_distance(x, y, other.x, other.y) < 80 && npc_id == "ghoul")
                                ghoul_buffed_timer = 1;
                        }
                    }
                }
                
                if (object_index == obj_enemy_big)
                {
                    if (scr_chance(0.2))
                    {
                        timer_ruggito = 0;
                        state = "big_aggro";
                    }
                    
                    if (point_distance(x, y, target.x, target.y) > 32 && point_distance(x, y, target.x, target.y) < 80)
                    {
                        if (can_attack == true)
                        {
                            if (scr_chance(20))
                            {
                                can_attack = false;
                                alarm[8] = attack_recovery;
                                dir_attack = point_direction(x, y, target.x, target.y);
                                state = "big_attack1";
                                var sspd = 3;
                                hspd = lengthdir_x(sspd, dir_attack);
                                vspd = lengthdir_y(sspd, dir_attack);
                            }
                        }
                    }
                }
                
                if (object_index == obj_enemy_blink)
                {
                    if (point_distance(x, y, target.x, target.y) < 16)
                    {
                        if (can_attack == true)
                        {
                            can_attack = false;
                            state = "blink_attack1";
                            alarm[8] = attack_recovery;
                            audio_play_sound_on(emitter_talk, snd_blink_attack1, false, 20);
                        }
                    }
                }
            }
        }
        else
        {
            scr_mutant_target_not_in_sight();
        }
        
        scr_enemy_path();
        break;
    
    case "wolf_idle1":
        scr_enemy_choose_idle_or_move();
        scr_collision();
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id));
        
        if (target != -4)
        {
            hspd = 0;
            vspd = 0;
            state = "wolf_ringhio";
        }
        
        if (target == -4)
        {
            tick++;
            
            if (tick >= tick_max)
            {
                tick = 0;
                var _x = x;
                var _y = y;
                var _next_state = "wolf_idle1";
                
                if (scr_chance(8))
                    _next_state = "wolf_idle2";
                
                if (scr_chance(5))
                    _next_state = "wolf_sleep";
                
                if (scr_chance(0.5))
                    _next_state = "wolf_ululato";
                
                var _move_x = 0;
                var _move_y = 0;
                
                with (obj_chest_general)
                {
                    if (chest_is_drop(tipo))
                    {
                        if (point_distance(x, y, _x, _y) < 96)
                        {
                            var _r = 10;
                            _move_x = x + irandom_range(-_r, _r);
                            _move_y = y + irandom_range(-_r / 2, _r / 2);
                        }
                    }
                }
                
                if (_move_x != 0 && _move_y != 0)
                {
                    var _eat_counter = 0;
                    
                    with (obj_enemy_wolf_brown)
                    {
                        if (state == "wolf_eat" || state == "wolf_move_to_eat")
                            _eat_counter++;
                    }
                    
                    if (_eat_counter < 2)
                    {
                        _next_state = "wolf_move_to_eat";
                        move_point_x = _move_x;
                        move_point_y = _move_y;
                        path_timer = path_timer_reset;
                    }
                }
                
                if (_next_state != "wolf_move_to_eat")
                    var _ret = scr_wolf_decidi_attaccare();
                
                if (_next_state == "wolf_ululato")
                {
                    var _sound = choose(snd_wolf_ul1, snd_wolf_ul2);
                    var sound_durata = audio_sound_length(_sound);
                    wolf_ululato_max = sound_durata * 60;
                    wolf_ululato = 0;
                    audio_play_sound_on(emitter_shoot, _sound, false, 20);
                }
                
                state = _next_state;
            }
        }
        
        break;
    
    case "wolf_idle2":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id));
        
        if (target != -4)
        {
            hspd = 0;
            vspd = 0;
            state = "wolf_ringhio";
        }
        
        if (target == -4)
        {
            var _end = scr_animation_end(s_lupo_idle2);
            
            if (_end == true)
                state = "wolf_idle1";
        }
        
        break;
    
    case "wolf_move_to_eat":
        target = scr_find_target_for_mutant(wolf_alert_raggio2);
        
        if (target != -4)
        {
            hspd = 0;
            vspd = 0;
            state = "wolf_ringhio";
        }
        
        if (target == -4)
        {
            if (point_distance(x, y, move_point_x, move_point_y) < 4)
                state = "wolf_eat";
        }
        
        scr_enemy_path();
        break;
    
    case "wolf_eat":
        target = scr_find_target_for_mutant(wolf_alert_raggio2);
        
        if (target != -4)
        {
            hspd = 0;
            vspd = 0;
            state = "wolf_ringhio";
        }
        
        if (target == -4)
        {
            var _end = scr_animation_end(s_lupo_eat);
            
            if (_end == true)
            {
                if (scr_chance(12))
                    state = "wolf_idle1";
            }
        }
        
        scr_enemy_path();
        break;
    
    case "wolf_sleep":
        target = scr_find_target_for_mutant(wolf_alert_raggio2);
        
        if (target != -4)
        {
            hspd = 0;
            vspd = 0;
            state = "wolf_ringhio";
            image_index = 0;
        }
        
        if (target == -4)
        {
            var _end = scr_animation_end(s_lupo_sleep);
            
            if (_end == true)
            {
                if (scr_chance(20))
                    state = "wolf_idle1";
            }
        }
        
        break;
    
    case "wolf_ringhio":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id));
        path_end();
        
        if (target != -4)
        {
            hspd = 0;
            vspd = 0;
            var _end = scr_animation_end(s_lupo_ringhio);
            
            if (_end == true)
            {
                var _attack = scr_wolf_decidi_attaccare();
                
                if (_attack == true)
                    state = "wolf_alert";
            }
        }
        
        if (target == -4)
        {
            var _end = scr_animation_end(s_lupo_ringhio);
            
            if (_end == true)
                state = "wolf_idle1";
        }
        
        break;
    
    case "wolf_alert":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id));
        
        if (instance_exists(target))
        {
            if (target != -4)
            {
                hspd = 0;
                vspd = 0;
                tick++;
                
                if (tick >= tick_max)
                {
                    tick = 0;
                    var _next_state = "wolf_alert";
                    var _movex = 0;
                    var _movey = 0;
                    var _id = id;
                    var _counter_attack = 0;
                    var _max_attack = 3;
                    var _counter_ululato = 0;
                    var _ululato_max = 2;
                    var _target = target;
                    
                    with (obj_enemy_wolf_brown)
                    {
                        if (id != _id)
                        {
                            if (state == "wolf_attack_1")
                            {
                                if (target == _target)
                                    _counter_attack++;
                            }
                            
                            if (state == "wolf_ululato")
                                _counter_ululato++;
                        }
                    }
                    
                    _id = id;
                    _target = target;
                    var _x = x;
                    var _y = y;
                    
                    with (obj_enemy_wolf_brown)
                    {
                        if (_id != id)
                        {
                            if (target == -4)
                            {
                                if (point_distance(x, y, _x, _y) < 96)
                                {
                                    target = _target;
                                    search_target_id = _target;
                                }
                            }
                        }
                    }
                    
                    if (scr_chance(30))
                    {
                        var _dir = irandom(360);
                        _dis = 32;
                        _movex = target.x + lengthdir_x(_dis, _dir);
                        _movey = target.y + lengthdir_y(_dis, _dir);
                        path_timer = path_timer_reset;
                    }
                    
                    if (scr_chance(5))
                        _next_state = "wolf_ringhio";
                    
                    var _dis = point_distance(x, y, target.x, target.y);
                    
                    if (_dis < 32)
                    {
                        if (can_attack == true)
                        {
                            if (_counter_attack < _max_attack)
                            {
                                can_attack = false;
                                alarm[8] = 60;
                                _next_state = "wolf_attack_1";
                                dir_attack = point_direction(x, y, target.x, target.y);
                                var sspd = 2.5;
                                hspd = lengthdir_x(sspd, dir_attack);
                                vspd = lengthdir_y(sspd, dir_attack);
                            }
                        }
                    }
                    
                    if (_counter_ululato < _ululato_max)
                    {
                        if (_counter_attack >= _max_attack)
                        {
                            if (scr_chance(12))
                                _next_state = "wolf_ululato";
                        }
                        
                        if (scr_chance(2))
                            _next_state = "wolf_ululato";
                    }
                    
                    _dis = point_distance(x, y, target.x, target.y);
                    
                    if (_dis > 96)
                    {
                        var _dir = irandom(360);
                        _dis = 32;
                        _movex = target.x + lengthdir_x(_dis, _dir);
                        _movey = target.y + lengthdir_y(_dis, _dir);
                    }
                    
                    if (_next_state == "wolf_ululato")
                    {
                        var _sound = choose(snd_wolf_ul1, snd_wolf_ul2);
                        var sound_durata = audio_sound_length(_sound);
                        wolf_ululato_max = sound_durata * 60;
                        wolf_ululato = 0;
                        audio_play_sound_on(emitter_shoot, _sound, false, 20);
                    }
                    
                    state = _next_state;
                    move_point_x = _movex;
                    move_point_y = _movey;
                    var _ret = scr_wolf_decidi_attaccare();
                }
                
                if (point_distance(x, y, move_point_x, move_point_y) < 3)
                {
                    var _dis = 28;
                    var _dir = irandom(360);
                    var _movex = target.x + lengthdir_x(_dis, _dir);
                    var _movey = target.y + lengthdir_y(_dis, _dir);
                    move_point_x = _movex;
                    move_point_y = _movey;
                    path_timer = path_timer_reset;
                    var _ret = scr_wolf_decidi_attaccare();
                }
                
                if (move_point_x != 0 && move_point_y != 0)
                    scr_enemy_path();
                
                if (point_distance(x, y, target.x, target.y) > 220)
                    state = "wolf_idle1";
            }
            
            if (target == -4)
            {
                state = "wolf_idle1";
                
                if (instance_exists(search_target_id))
                {
                    if (point_distance(x, y, search_target_id.x, search_target_id.y) > 220)
                        state = "wolf_idle1";
                    else
                        scr_mutant_target_not_in_sight();
                }
            }
        }
        
        break;
    
    case "wolf_attack_1":
        path_end();
        var _end = scr_animation_end(s_lupo_a1);
        
        if (_end == true)
        {
            state = "wolf_alert";
            hspd = 0;
            vspd = 0;
        }
        
        if (instance_exists(target))
        {
            if (image_index < 5)
            {
                dir_attack = point_direction(x, y, target.x, target.y);
                var sspd = 3;
                hspd = lengthdir_x(sspd, dir_attack);
                vspd = lengthdir_y(sspd, dir_attack);
            }
            
            if (image_index >= 5)
                scr_collision();
        }
        else
        {
            state = "wolf_idle1";
        }
        
        break;
    
    case "wolf_attack_2":
        path_end();
        hspd = 0;
        vspd = 0;
        var _end = scr_animation_end(s_lupo_a2);
        
        if (_end == true)
        {
            state = "wolf_alert";
            hspd = 0;
            vspd = 0;
        }
        
        break;
    
    case "wolf_run_to_amico":
        if (point_distance(x, y, move_point_x, move_point_y) < 10)
            state = "wolf_idle1";
        
        scr_enemy_path();
        break;
    
    case "wolf_ululato":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id));
        path_end();
        
        if (image_index >= (image_number - 2))
            image_index = image_number - 2;
        
        wolf_ululato++;
        
        if (wolf_ululato >= wolf_ululato_max)
        {
            if (target != -4)
            {
                hspd = 0;
                vspd = 0;
                state = "wolf_alert";
            }
            
            if (target == -4)
                state = "wolf_idle1";
        }
        
        break;
    
    case "big_aggro":
        path_end();
        hspd = 0;
        vspd = 0;
        
        if (image_index >= 3)
        {
            var sound_durata = audio_sound_length(snd_big_ruggito_1) - 2.5;
            timer_ruggito_max = sound_durata * 60;
            timer_ruggito = 0;
            audio_play_sound_on(emitter_shoot, snd_big_ruggito_1, false, 20);
            state = "big_ruggito";
        }
        
        break;
    
    case "big_ruggito":
        timer_ruggito++;
        
        if (timer_ruggito >= timer_ruggito_max)
        {
            timer_ruggito = 0;
            state = "mutant_alert";
        }
        
        break;
    
    case "big_attack1":
        path_end();
        
        if (instance_exists(target))
        {
            if (image_index >= (sprite_get_number(sprite_index) - 1))
            {
                state = "mutant_alert";
                path_timer = 999;
            }
            
            if (image_index >= 4)
            {
                hspd = 0;
                vsdp = 0;
            }
            
            scr_collision();
        }
        else
        {
            state = "mutant_alert";
        }
        
        break;
    
    case "boar_alert":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id));
        
        if (target != -4)
        {
            target_for_image_scale = target.x;
            
            if (move_point_x == 0)
            {
                range_ = 64;
                move_point_x = target.x + irandom_range(-range_, range_);
                move_point_y = target.y + irandom_range(-range_, range_);
            }
            
            path_end();
            last_seen_x = target.x;
            last_seen_y = target.y;
            var range_ = 64;
            
            if (scr_chance(npc_get_prob_attack(npc_id)))
            {
                move_point_x = target.x;
                move_point_y = target.y;
            }
            
            if (scr_chance(npc_get_prob_move(npc_id)))
            {
                move_point_x = target.x + irandom_range(-range_, range_);
                move_point_y = target.y + irandom_range(-range_, range_);
            }
            
            if (point_distance(x, y, target.x, target.y) < 8)
            {
                var dir = point_direction(x, y, target.x, target.y);
                var spazio_frenata = 64;
                start_frenata_x = target.x + lengthdir_x(spazio_frenata, dir);
                start_frenata_y = target.y + lengthdir_y(spazio_frenata, dir);
                state = "boar_frenata";
                frenata_dir = dir;
            }
            
            if (point_distance(x, y, target.x, target.y) > 80)
            {
                if (scr_chance(5))
                {
                    state = "boar_raspare";
                    
                    if (target == player_get_local())
                        audio_play_sound_on(emitter_shoot, snd_boar_charge, false, 10);
                }
            }
            
            mp_potential_step_object(move_point_x, move_point_y, npc_get_spd_alerted(npc_id), obj_solid);
        }
        else
        {
            scr_mutant_target_not_in_sight();
        }
        
        break;
    
    case "boar_frenata":
        frenata_step++;
        
        if (frenata_step >= frenata_step_max)
        {
            frenata_step = 0;
            state = "mutant_patrol";
        }
        
        hspd = lengthdir_x(npc_get_spd_alerted(npc_id), frenata_dir) - ((lengthdir_x(npc_get_spd_alerted(npc_id), frenata_dir) / frenata_step_max) * frenata_step);
        vspd = lengthdir_y(npc_get_spd_alerted(npc_id), frenata_dir) - ((lengthdir_y(npc_get_spd_alerted(npc_id), frenata_dir) / frenata_step_max) * frenata_step);
        scr_collision();
        break;
    
    case "boar_raspare":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id));
        var _end = scr_animation_end(s_enemy_cinghiale_raspare);
        
        if (target != -4)
        {
            if (_end == true)
                state = "boar_carica";
        }
        else
        {
            scr_mutant_target_not_in_sight();
        }
        
        if (image_index == 2 || image_index == 8 || image_index == 14)
        {
            var a = UnknownEnum.Value_46;
            var ob = obj_particles_controller;
            
            if (image_xscale == 1)
                part_type_direction(ob.particles_type[a], -10, 10, 0, 0);
            else
                part_type_direction(ob.particles_type[a], 170, 190, 0, 0);
            
            part_emitter_region(ob.particles_system[a], ob.partciles_emitter[a], x + (2 * image_xscale), x + (2 * image_xscale), y + 13, y + 11, 0, 1);
            part_emitter_burst(ob.particles_system[a], ob.partciles_emitter[a], ob.particles_type[a], 4);
        }
        
        hspd = 0;
        vspd = 0;
        scr_collision();
        break;
    
    case "boar_carica":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id));
        
        if (target != -4)
        {
            move_point_x = target.x;
            move_point_y = target.y;
            
            if (move_point_x != 0 && move_point_y != 0)
                scr_enemy_path();
            
            if (point_distance(x, y, target.x, target.y) < 8)
            {
                var dir = point_direction(x, y, target.x, target.y);
                var spazio_frenata = 64;
                start_frenata_x = target.x + lengthdir_x(spazio_frenata, dir);
                start_frenata_y = target.y + lengthdir_y(spazio_frenata, dir);
                state = "boar_frenata";
                frenata_dir = dir;
            }
        }
        else
        {
            scr_mutant_target_not_in_sight();
        }
        
        break;
    
    case "blink_attack1":
        hspd = 0;
        vspd = 0;
        path_end();
        
        if (image_index >= (sprite_get_number(sprite_index) - 1))
            state = "mutant_alert";
        
        break;
    
    case "wolf_attack":
        hspd = 0;
        vspd = 0;
        path_end();
        
        if (image_index >= (sprite_get_number(sprite_index) - 1))
            state = "mutant_alert";
        
        break;
    
    case "wolf_attack2":
        path_end();
        
        if (instance_exists(target))
        {
            if (image_index >= 6)
            {
                state = "mutant_alert";
                var range_ = 64;
                move_point_x = target.x + irandom_range(-range_, range_);
                move_point_y = target.y + irandom_range(-range_, range_);
                path_timer = 999;
            }
            
            scr_collision();
        }
        else
        {
            state = "mutant_patrol";
        }
        
        break;
    
    case "ghoul_attack1":
        path_end();
        hspd = 0;
        vspd = 0;
        
        if (instance_exists(target))
        {
            if (image_index >= 8 && can_attack == true)
            {
                dir_attack = point_direction(x, y, target.x, target.y);
                can_attack = false;
                alarm[8] = attack_recovery;
                var bul = instance_create_depth(x, y - 10, 0, obj_bullet_ghoul);
                var sspd = 3;
                bul.hspd = lengthdir_x(sspd, dir_attack);
                bul.vspd = lengthdir_y(sspd, dir_attack);
                bul.damage = 10;
                bul.shooter_faction = faction;
                bul.shooter_id = id;
                audio_play_sound_on(emitter_talk, snd_ghoul_attack, false, 5);
            }
            
            if (image_index >= 11)
                state = "mutant_alert";
        }
        
        break;
    
    case "wraith_fire_patrol":
        state_enemy_mutant_patrol();
        break;
    
    case "wraith_fire_alert":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id));
        
        if (target != -4)
        {
            target_for_image_scale = target.x;
            
            if (move_point_x == 0)
            {
                range_ = 64;
                move_point_x = target.x + irandom_range(-range_, range_);
                move_point_y = target.y + irandom_range(-range_, range_);
            }
            
            path_end();
            var range_ = 128;
            
            if (scr_chance(npc_get_prob_attack(npc_id)))
            {
                move_point_x = target.x;
                move_point_y = target.y;
            }
            
            if (scr_chance(npc_get_prob_move(npc_id)))
            {
                move_point_x = target.x + irandom_range(-range_, range_);
                move_point_y = target.y + irandom_range(-range_, range_);
            }
            
            if (scr_chance(prob_attac))
            {
                var vel = bullet_spd;
                var dir = point_direction(x, y, target.x, target.y);
                var bull = instance_create_depth(x, y, -y, obj_bullet_wraith_fire);
                bull.hspd = lengthdir_x(vel, dir);
                bull.vspd = lengthdir_y(vel, dir);
                bull.damage = damage_bullet;
                bull.shooter_faction = faction;
                bull.shooter_id = id;
            }
            
            if (abs(x - move_point_x) < 8 && abs(y - move_point_y) < 8)
            {
                move_point_x = target.x + irandom_range(-range_, range_);
                move_point_y = target.y + irandom_range(-range_, range_);
            }
            
            mp_potential_step_object(move_point_x, move_point_y, npc_get_spd_alerted(npc_id), obj_solid);
        }
        else
        {
            scr_mutant_target_not_in_sight();
        }
        
        break;
    
    case "wraith_electric_patrol":
        state_enemy_mutant_patrol();
        break;
    
    case "wraith_electric_alert":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id));
        
        if (target != -4)
        {
            target_for_image_scale = target.x;
            
            if (move_point_x == 0)
            {
                range_ = 64;
                move_point_x = target.x + irandom_range(-range_, range_);
                move_point_y = target.y + irandom_range(-range_, range_);
            }
            
            path_end();
            last_seen_x = target.x;
            last_seen_y = target.y;
            var range_ = 64;
            
            if (scr_chance(npc_get_prob_attack(npc_id)))
            {
                move_point_x = target.x;
                move_point_y = target.y;
            }
            
            if (scr_chance(npc_get_prob_move(npc_id)))
            {
                move_point_x = target.x + irandom_range(-range_, range_);
                move_point_y = target.y + irandom_range(-range_, range_);
            }
            
            if (point_distance(x, y, target.x, target.y) < 96)
            {
                if (scr_chance(prob_attack1))
                {
                    instance_create_depth(x, y, 0, obj_hud_get_hit);
                    var dis_ = point_distance(x, y, target.x, target.y);
                    var dir_ = point_direction(x, y, target.x, target.y);
                    var a = UnknownEnum.Value_10;
                    var ob = obj_particles_controller;
                    var dis1 = 0;
                    var dir1 = 0;
                    var amount_ = choose(-1, 1);
                    var dividendo = irandom(7) + 3;
                    var x1, y1;
                    
                    for (var i = 0; i < dis_; i++)
                    {
                        var xo = x + lengthdir_x(i, dir_);
                        var yo = y + lengthdir_y(i, dir_);
                        dividendo = irandom(7) + 3;
                        
                        if (frac(i / dividendo) == 0)
                            amount_ = -amount_;
                        
                        dis1 += amount_;
                        dir1 = dir_ + 90;
                        x1 = xo + lengthdir_x(dis1, dir1);
                        y1 = yo + lengthdir_y(dis1, dir1);
                        part_emitter_region(ob.particles_system[a], ob.partciles_emitter[a], x1, x1, y1, y1, 0, 1);
                        part_emitter_burst(ob.particles_system[a], ob.partciles_emitter[a], ob.particles_type[a], ob.particle_amount[a]);
                    }
                    
                    instance_create_depth(x1, y1, 0, obj_light_electric_spark);
                    target.hp -= dmg_attack1;
                }
            }
            
            if (abs(x - move_point_x) < 8 && abs(y - move_point_y) < 8)
            {
                move_point_x = target.x + irandom_range(-range_, range_);
                move_point_y = target.y + irandom_range(-range_, range_);
            }
            
            mp_potential_step_object(move_point_x, move_point_y, npc_get_spd_alerted(npc_id), obj_solid);
        }
        else
        {
            scr_mutant_target_not_in_sight();
        }
        
        break;
    
    case "crystal_violet_alert":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id));
        
        if (target != -4)
        {
            target_for_image_scale = target.x;
            
            if (move_point_x == 0)
            {
                range_ = 64;
                move_point_x = target.x + irandom_range(-range_, range_);
                move_point_y = target.y + irandom_range(-range_, range_);
            }
            
            path_end();
            last_seen_x = target.x;
            last_seen_y = target.y;
            var range_ = 64;
            
            if (scr_chance(npc_get_prob_attack(npc_id)))
            {
                move_point_x = target.x;
                move_point_y = target.y;
            }
            
            if (scr_chance(npc_get_prob_move(npc_id)))
            {
                move_point_x = target.x + irandom_range(-range_, range_);
                move_point_y = target.y + irandom_range(-range_, range_);
            }
            
            timer_bullet_now++;
            
            if (timer_bullet_now >= timer_bullet_max)
            {
                timer_bullet_now = 0;
                var _dir = point_direction(x, y, target.x, target.y);
                var bul = instance_create_depth(x, y, 0, obj_bullet_crystal_violet);
                var sspd = 2;
                bul.hspd = lengthdir_x(sspd, _dir);
                bul.vspd = lengthdir_y(sspd, _dir);
                bul.damage = 5;
                bul.shooter_faction = faction;
                bul.shooter_id = id;
                bul.image_angle = _dir;
                bul.target = target;
            }
            
            if (abs(x - move_point_x) < 8 && abs(y - move_point_y) < 8)
            {
                move_point_x = target.x + irandom_range(-range_, range_);
                move_point_y = target.y + irandom_range(-range_, range_);
            }
            
            mp_potential_step_object(move_point_x, move_point_y, npc_get_spd_alerted(npc_id), obj_solid);
        }
        else
        {
            scr_mutant_target_not_in_sight();
        }
        
        break;
    
    case "rabbit_idle":
        scr_enemy_choose_idle_or_move();
        scr_collision();
        
        if (scr_chance(0.5))
        {
            state = "rabbit_idle2";
            hspd = 0;
            vspd = 0;
        }
        
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id));
        
        if (target != -4)
        {
            hspd = 0;
            vspd = 0;
            var range = 128;
            move_point_x = x + irandom_range(-range - (range / 2), range + (range / 2));
            move_point_y = y + irandom_range(-range - (range / 2), range + (range / 2));
            state = "rabbit_escape";
        }
        
        break;
    
    case "rabbit_idle2":
        scr_collision();
        
        if (image_index >= (sprite_get_number(s_rabbit_idle2) - 2))
            state = "rabbit_idle";
        
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id));
        
        if (target != -4)
        {
            hspd = 0;
            vspd = 0;
            var range = 128;
            move_point_x = x + irandom_range(-range - (range / 2), range + (range / 2));
            move_point_y = y + irandom_range(-range - (range / 2), range + (range / 2));
            state = "rabbit_escape";
        }
        
        break;
    
    case "rabbit_escape":
        path_timer++;
        
        if (path_timer >= path_timer_reset)
        {
            path_timer = 0;
            path_end();
            path_clear_points(path_to_target);
            mp_grid_path(global.grid_move, path_to_target, x, y, move_point_x, move_point_y, true);
            path_start(path_to_target, npc_get_spd_alerted(npc_id), path_action_stop, false);
        }
        
        target_for_image_scale = move_point_x;
        
        if (abs(x - move_point_x) < 16 && abs(y - move_point_y) < 16)
            state = "rabbit_idle";
        
        break;
    
    case "crow_idle1":
        scr_enemy_choose_idle_or_move();
        scr_collision();
        
        if (scr_chance(0.5))
        {
            state = "crow_idle2";
            hspd = 0;
            vspd = 0;
        }
        
        scr_enemy_crow_check_if_escape();
        break;
    
    case "crow_idle2":
        scr_collision();
        
        if (image_index >= (sprite_get_number(s_crow_idle2) - 2))
            state = "crow_idle1";
        
        scr_enemy_crow_check_if_escape();
        break;
    
    case "crow_escape":
        move_towards_point(move_point_x, move_point_y, 2.5);
        unstuck_counter_timer = 0;
        
        if (point_distance(x, y, move_point_x, move_point_y) < 16)
            instance_destroy();
        
        break;
    
    case "crow_eat":
        if (scr_chance(0.5))
        {
            state = "crow_pause_eat";
            hspd = 0;
            vspd = 0;
        }
        
        scr_enemy_crow_check_if_escape();
        break;
    
    case "crow_pause_eat":
        speed = 0;
        
        if (scr_chance(1))
        {
            image_index = 0;
            state = "crow_eat";
        }
        
        scr_enemy_crow_check_if_escape();
        break;
    
    case "crow_move_to_target":
        move_towards_point(move_point_x, move_point_y, 2);
        unstuck_counter_timer = 0;
        var _point_distance = point_distance(x, y, move_point_x, move_point_y);
        
        if (_point_distance < 128 && _point_distance > 64)
        {
            if (scr_chance(10))
            {
                var ss = choose(snd_bird_fly1, snd_bird_fly2, snd_bird_fly3, snd_bird_fly4, snd_bird_fly5);
                
                if (!audio_is_playing(ss))
                    audio_play_sound(ss, 10, false);
            }
        }
        
        if (_point_distance < (irandom(3) + 1))
        {
            speed = 0;
            var range = 500;
            var dir = irandom_range(45, 135);
            move_point_x = x + lengthdir_x(range, dir);
            move_point_y = y + lengthdir_y(range, dir);
            
            if (scr_chance(30))
                state = "crow_pause_eat";
            else
                state = "crow_eat";
        }
        
        break;
    
    case "infestation_idle":
        target = scr_find_target_for_mutant(npc_get_alert_visual_distance(npc_id));
        
        if (target != -4)
        {
            timer++;
            
            if (timer >= timer_max)
            {
                timer = 0;
                
                if (spawned < spawn_max)
                {
                    var _amount = spawn_amount;
                    
                    if (spawned == 0)
                        _amount = 3;
                    
                    repeat (_amount)
                    {
                        var oo = instance_create_depth(x, y + 8, 0, obj_enemy_ghoul);
                        oo.target = target;
                        oo.search_target_id = target;
                    }
                    
                    spawned += _amount;
                }
            }
        }
        
        break;
    
    default:
        trace_error("State \"", state, "\" unhandled");
        break;
}

if (is_in_raid())
{
    if (global.emission_make_npc_die == true)
    {
        if (global.is_emission_now == false)
        {
            if (instance_exists(obj_map_generator))
            {
                if (y < obj_map_generator.map_height)
                    hp = -100;
            }
        }
    }
}

if (hp <= 0)
{
    hp = -100;
    
    if (play_sound_death == true)
    {
        var sound_ = -1;
        
        switch (object_index)
        {
            case obj_enemy_wolf_brown:
                sound_ = snd_wolf_death;
                break;
            
            case obj_enemy_boar:
                sound_ = snd_boar_death;
                break;
            
            case obj_enemy_boar_zombie:
                sound_ = snd_boar_death;
                break;
            
            case obj_enemy_ghoul:
                sound_ = snd_ghoul_death;
                break;
            
            case obj_enemy_spider:
                sound_ = snd_spider_death;
                break;
            
            case obj_enemy_big:
                sound_ = snd_big_death;
                break;
        }
        
        if (sound_ != -1)
        {
            var emitter_death = instance_create_depth(x, y, 0, obj_emitter_death_sound);
            emitter_death.sound_ = sound_;
        }
    }
    
    if (object_index == obj_enemy_infestation || object_index == obj_enemy_infestation_motel)
    {
        var o = obj_particles_controller;
        var a = UnknownEnum.Value_2;
        part_particles_create(o.particles_system[a], x, y, o.particles_type[a], o.particle_amount[a]);
    }
    
    if (object_index == obj_forest_trader)
        global.az_done[UnknownEnum.Value_1] = true;
    
    if (object_index == obj_junk_trader)
        global.az_done[UnknownEnum.Value_11] = true;
    
    var _size = array_length_1d(global.list_n_id);
    
    for (var i = 0; i < _size; i++)
    {
        if (id == global.list_n_id[i])
        {
            global.list_n_id[i] = -4;
            global.list_n_hp[i] = -10;
            part_create_blood(0, 360, 7);
        }
    }
    
    if (dead_outside_game_window == true)
        create_item_in_chest = false;
    
    instance_destroy();
}

if (state == "wolf_ringhio" && state_before != "wolf_ringhio")
    audio_play_sound_on(emitter_talk, snd_wolf_growl, false, 8);

if (state != "deactivate")
    state_before = state;

if (!is_in_hub())
{
    var _visibility = player_line_of_sight(x, y);
    
    if (_visibility == undefined)
    {
    }
    else if (_visibility || remain_visible_frames > 0)
    {
        image_alpha = min(1, image_alpha + a_gain);
    }
    else
    {
        timer_visible++;
        
        if (timer_visible >= timer_visible_max)
            image_alpha = max(0, image_alpha - (a_gain / 2));
    }
    
    if (!_visibility && frames_left_of_prolonged_vision > 0 && remain_visible_frames < 0)
    {
        remain_visible_frames = global.skills_data.prolonged_vision.value_1;
        frames_left_of_prolonged_vision = 0;
    }
    
    if (remain_visible_frames >= 0)
        remain_visible_frames--;
    
    if (frames_left_of_prolonged_vision >= 0)
        frames_left_of_prolonged_vision--;
    
    if (_visibility && collision_point(obj_cursor.aa_x, obj_cursor.aa_y, id, true, false))
    {
        hover_frames++;
        skill_vital_shooting_frames++;
        _player.hovering_enemy = true;
    }
    else
    {
        hover_frames = 0;
        skill_vital_shooting_frames = 0;
    }
}

if (_lista_near_me != undefined)
    ds_list_destroy(_lista_near_me);

mods_object_perform_event("step_normal_event");

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
    Value_21,
    Value_23 = 23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_31,
    Value_32,
    Value_33,
    Value_36 = 36,
    Value_37,
    Value_38,
    Value_46 = 46,
    Value_60 = 60,
    Value_69 = 69,
    Value_70,
    Value_103 = 103,
    Value_105 = 105,
    Value_106,
    Value_113 = 113,
    Value_115 = 115,
    Value_120 = 120,
    Value_125 = 125,
    Value_130 = 130,
    Value_137 = 137,
    Value_142 = 142,
    Value_143,
    Value_145 = 145,
    Value_148 = 148,
    Value_150 = 150,
    Value_151,
    Value_154 = 154
}

function fun_bt_traverse(arg0 = UnknownEnum.Value_0)
{
    var _node_id = tree_id[arg0];
    var _t = "";
    
    if (node_state_now == 1)
        _t = "SUCCESS";
    
    if (node_state_now == 0)
        _t = "FAILURE";
    
    if (node_state_now == 2)
        _t = "RUNNING";
    
    if (node_state_now == 3)
        _t = "TICK";
    
    trace(_t);
    var _node_name = global.node_name[tree_id[arg0]];
    trace(_node_name);
    var _node_type = tree_node[arg0];
    var _tree_parent = tree_parent[arg0];
    var _child_number = array_length(tree_child[arg0]);
    
    if (_child_number == 0)
    {
        if (_node_type == UnknownEnum.Value_4)
        {
            if (node_state_now == 3)
            {
                if (arg0 != node_running_now)
                {
                    bt_action_timer_now = 0;
                    node_state_now = 2;
                    node_action_state = 2;
                    node_running_now = arg0;
                }
                
                if (arg0 == node_running_now)
                    node_state_now = 2;
            }
            
            if (node_state_now == 2)
            {
                node_state_now = 2;
                var _action_now = tree_id[node_running_now];
                
                switch (_action_now)
                {
                    case UnknownEnum.Value_20:
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
                    
                    case UnknownEnum.Value_22:
                        if (bt_action_timer_now == 0)
                        {
                            scr_enemy_choose_move_pos(last_seen_x, last_seen_y, 8);
                            
                            if (scr_chance(50))
                                scr_draw_npc_text(id, UnknownEnum.Value_8);
                        }
                        
                        scr_enemy_path();
                        break;
                    
                    case UnknownEnum.Value_21:
                        if (bt_action_timer_now == 0)
                        {
                            reloading = true;
                            alarm[0] = irandom(100) + 80;
                            path_end();
                            
                            if (scr_chance(50))
                                scr_draw_npc_text(id, UnknownEnum.Value_6);
                        }
                        
                        if (reloading == false)
                        {
                            node_state_now = 1;
                            need_reload_already_check = false;
                            
                            if (image_xscale == 1)
                                weapon_pointing_direction = 0;
                            else
                                weapon_pointing_direction = 180;
                        }
                        
                        break;
                    
                    case UnknownEnum.Value_23:
                        if (bt_action_timer_now == 0)
                        {
                            move_point_x = last_cover_pos_x;
                            move_point_y = last_cover_pos_y;
                            
                            if (scr_chance(50))
                                scr_draw_npc_text(id, UnknownEnum.Value_1);
                        }
                        
                        scr_enemy_path();
                        
                        if (point_distance(x, y, last_cover_pos_x, last_cover_pos_y) < 4)
                            node_state_now = 1;
                        
                        break;
                    
                    case UnknownEnum.Value_24:
                        if (bt_action_timer_now == 0)
                        {
                        }
                        
                        if (instance_exists(target))
                        {
                            var _dir = point_direction(x, y, target.x, target.y);
                            var _angle_diff = angle_difference(_dir, weapon_pointing_direction);
                            target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
                            
                            if (abs(_angle_diff) > angle_min_to_rotate)
                            {
                                if (_angle_diff > 0)
                                    weapon_pointing_direction += angle_increase_for_target;
                                
                                if (_angle_diff < 0)
                                    weapon_pointing_direction -= angle_increase_for_target;
                            }
                            else
                            {
                                state_finito = true;
                            }
                        }
                        
                        break;
                    
                    case UnknownEnum.Value_25:
                        if (bt_action_timer_now == 0)
                        {
                            path_end();
                            
                            if (scr_chance(50))
                                scr_draw_npc_text(id, UnknownEnum.Value_12);
                        }
                        
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
                                var _dir = point_direction(x, y, target.x, target.y);
                                weapon_pointing_direction = _dir;
                                scr_enemy_shoot();
                                shoot_time++;
                                
                                if (shoot_time >= shoot_time_max)
                                    shoot_time = 0;
                            }
                        }
                        
                        scr_enemy_path();
                        break;
                    
                    case UnknownEnum.Value_18:
                        if (bt_action_timer_now == 0)
                        {
                        }
                        
                        path_end();
                        scr_enemy_choose_idle_or_move();
                        scr_collision();
                        draw_weapon = true;
                        scr_move_arma_random(2, weapon_pointing_angle, 1);
                        
                        if (object_index == obj_green_quest_swamp)
                        {
                            if (instance_exists(obj_faro))
                                weapon_pointing_direction = point_direction(x, y, obj_faro.x, obj_faro.y - 150);
                        }
                        
                        target_for_image_scale = x + lengthdir_x(2, weapon_pointing_direction);
                        break;
                }
                
                bt_action_timer_now++;
            }
            
            if (node_state_now == 0 || node_state_now == 1)
                return fun_bt_traverse(_tree_parent);
        }
        
        if (_node_type == UnknownEnum.Value_3)
        {
            var _check = false;
            var _state;
            
            if (tree_condition_checked[arg0] < tree_condition_checked_max[arg0])
            {
                _check = false;
                _state = tree_condition_now[arg0];
            }
            else
            {
                _check = true;
            }
            
            if (_check == true)
            {
                switch (_node_id)
                {
                    case UnknownEnum.Value_5:
                        _state = fun_target_near(obj_bt_player_test, 80);
                        break;
                    
                    case UnknownEnum.Value_7:
                        _state = fun_pos_near(startx, starty, 4);
                        break;
                    
                    case UnknownEnum.Value_8:
                        _state = fun_target_found();
                        break;
                    
                    case UnknownEnum.Value_9:
                        if (target_relation == UnknownEnum.Value_2)
                            _state = true;
                        
                        break;
                    
                    case UnknownEnum.Value_10:
                        _state = fun_target_in_sight(target);
                        break;
                    
                    case UnknownEnum.Value_12:
                        _state = fun_need_reload();
                        break;
                    
                    case UnknownEnum.Value_16:
                        _state = reloading;
                        break;
                    
                    case UnknownEnum.Value_11:
                        _state = fun_target_last_seen_is_near(32);
                        break;
                    
                    case UnknownEnum.Value_15:
                        _state = fun_weapon_dir_towards_target(target);
                        break;
                    
                    case UnknownEnum.Value_14:
                        _state = fun_pos_near(last_cover_pos_x, last_cover_pos_y, 4);
                        break;
                    
                    case UnknownEnum.Value_13:
                        _state = fun_pos_cover_found();
                        break;
                }
                
                tree_condition_now[arg0] = _state;
                tree_condition_checked[arg0] = 0;
            }
            
            if (_state == true)
                node_state_now = 1;
            
            if (_state == false)
                node_state_now = 0;
            
            return fun_bt_traverse(_tree_parent);
        }
    }
    
    if (_child_number > 0)
    {
        switch (_node_type)
        {
            case UnknownEnum.Value_5:
                switch (node_state_now)
                {
                    case 1:
                        node_state_now = 0;
                        return fun_bt_traverse(_tree_parent);
                        break;
                    
                    case 0:
                        node_state_now = 1;
                        return fun_bt_traverse(_tree_parent);
                        break;
                    
                    case 3:
                        tree_node_child_now[arg0] = 0;
                        return fun_bt_traverse(tree_child[arg0][tree_node_child_now[arg0]]);
                        break;
                }
                
                break;
            
            case UnknownEnum.Value_2:
                switch (node_state_now)
                {
                    case 1:
                        node_state_now = 1;
                        return fun_bt_traverse(_tree_parent);
                        break;
                    
                    case 2:
                        node_state_now = 2;
                        return fun_bt_traverse(_tree_parent);
                        break;
                    
                    case 0:
                        if (tree_node_child_now[arg0] >= (_child_number - 1))
                        {
                            node_state_now = 0;
                            tree_node_child_now[arg0] = 0;
                            return fun_bt_traverse(_tree_parent);
                        }
                        
                        if (tree_node_child_now[arg0] < (_child_number - 1))
                        {
                            tree_node_child_now[arg0]++;
                            node_state_now = 3;
                            return fun_bt_traverse(tree_child[arg0][tree_node_child_now[arg0]]);
                        }
                        
                        break;
                    
                    case 3:
                        tree_node_child_now[arg0] = 0;
                        return fun_bt_traverse(tree_child[arg0][tree_node_child_now[arg0]]);
                        break;
                }
                
                break;
            
            case UnknownEnum.Value_1:
                switch (node_state_now)
                {
                    case 2:
                        node_state_now = 2;
                        return fun_bt_traverse(_tree_parent);
                        break;
                    
                    case 1:
                        node_state_now = 1;
                        
                        if (tree_node_child_now[arg0] < (_child_number - 1))
                        {
                            tree_node_child_now[arg0]++;
                            node_state_now = 3;
                            return fun_bt_traverse(tree_child[arg0][tree_node_child_now[arg0]]);
                        }
                        
                        if (tree_node_child_now[arg0] >= (_child_number - 1))
                        {
                            node_state_now = 1;
                            tree_node_child_now[arg0] = 0;
                            return fun_bt_traverse(_tree_parent);
                        }
                        
                        break;
                    
                    case 0:
                        tree_node_child_now[arg0] = 0;
                        return fun_bt_traverse(_tree_parent);
                        break;
                    
                    case 3:
                        tree_node_child_now[arg0] = 0;
                        return fun_bt_traverse(tree_child[arg0][tree_node_child_now[arg0]]);
                        break;
                }
                
                break;
            
            case UnknownEnum.Value_0:
                switch (node_state_now)
                {
                    case 3:
                        tree_node_child_now[arg0] = 0;
                        return fun_bt_traverse(tree_child[arg0][tree_node_child_now[arg0]]);
                        break;
                    
                    case 2:
                        trace("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
                        break;
                }
                
                break;
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
    Value_18 = 18,
    Value_20 = 20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25
}

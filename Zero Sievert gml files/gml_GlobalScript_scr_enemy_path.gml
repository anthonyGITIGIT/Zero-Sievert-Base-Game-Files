function scr_enemy_path()
{
    path_timer++;
    
    if (path_timer >= path_timer_reset)
    {
        path_timer = 0;
        path_end();
        path_clear_points(path_to_target);
        var o = obj_controller;
        
        if (instance_exists(obj_controller))
        {
            var _target_x = move_point_x;
            var _target_y = move_point_y;
            var _x = _target_x div 16;
            var _y = _target_y div 16;
            
            if (ds_grid_get(o.grid_motion, _x, _y) == -1)
            {
                var _list_x = ds_list_create();
                var _list_y = ds_list_create();
                var _list_dis = ds_list_create();
                
                for (var xx = -5; xx < 5; xx++)
                {
                    for (var yy = -5; yy < 5; yy++)
                    {
                        if (ds_grid_get(o.grid_motion, _x + xx, _y + yy) == 0)
                        {
                            var _x_new = ((_x + xx) * 16) + 8;
                            var _y_new = ((_y + yy) * 16) + 8;
                            ds_list_add(_list_x, _x_new);
                            ds_list_add(_list_y, _y_new);
                            var _dis = point_distance(_target_x, _target_y, _x_new, _y_new);
                            ds_list_add(_list_dis, _dis);
                        }
                    }
                }
                
                var _index = 0;
                
                if (ds_list_size(_list_dis) > 0)
                {
                    var _dis = 9999;
                    
                    for (var i = 0; i < ds_list_size(_list_dis); i++)
                    {
                        if (ds_list_find_value(_list_dis, i) < _dis)
                        {
                            _index = i;
                            _dis = ds_list_find_value(_list_dis, i);
                        }
                    }
                    
                    _target_x = ds_list_find_value(_list_x, _index);
                    _target_y = ds_list_find_value(_list_y, _index);
                    move_point_x = _target_x;
                    move_point_y = _target_y;
                }
            }
            
            mp_grid_path(global.grid_move, path_to_target, x, y, move_point_x, move_point_y, true);
            var spd = npc_get_spd_not_alerted(npc_id);
            
            if (state == "human_shoot")
            {
                spd = npc_get_spd_not_alerted(npc_id);
            }
            else
            {
            }
            
            if (state == "wolf_move_to_eat")
                spd = npc_get_spd_not_alerted(npc_id);
            
            if (state == "human_bt")
            {
                var _node_id = tree_id[node_running_now];
                
                if (_node_id == UnknownEnum.Value_23 || _node_id == UnknownEnum.Value_22)
                    spd = npc_get_spd_alerted(npc_id);
            }
            
            if (state == "mutant_alert" || state == "wolf_alert" || state == "wolf_run_to_amico" || state == "boar_alert")
                spd = npc_get_spd_alerted(npc_id);
            
            if (npc_id == "ghoul" && ghoul_buffed_timer > 0)
                spd = npc_get_spd_alerted(npc_id) * ghoul_buffed_mult_speed;
            
            if (state == "boar_carica")
                spd = npc_get_spd_alerted(npc_id) * 1.5;
            
            if (is_in_hub())
                spd = npc_get_spd_not_alerted(npc_id);
            
            if (state == "human_general")
            {
                if (human_state_now == UnknownEnum.Value_12 || human_state_now == UnknownEnum.Value_13 || human_state_now == UnknownEnum.Value_15 || human_state_now == UnknownEnum.Value_18 || human_state_now == UnknownEnum.Value_17 || human_state_now == UnknownEnum.Value_16 || human_state_now == UnknownEnum.Value_28 || human_state_now == UnknownEnum.Value_26 || human_state_now == UnknownEnum.Value_14 || human_state_now == UnknownEnum.Value_30 || human_state_now == UnknownEnum.Value_29 || human_state_now == UnknownEnum.Value_33 || human_state_now == UnknownEnum.Value_38)
                    spd = npc_get_spd_alerted(npc_id);
            }
            
            path_start(path_to_target, spd, path_action_stop, false);
        }
        
        if (target != -4)
        {
            if (instance_exists(target))
            {
                target_for_image_scale = target.x;
                
                if (human_state_now == UnknownEnum.Value_25)
                    target_for_image_scale = last_target_cover_x;
                
                if (human_state_now == UnknownEnum.Value_15 || human_state_now == UnknownEnum.Value_14)
                    target_for_image_scale = last_seen_x;
            }
        }
        else
        {
            target_for_image_scale = move_point_x;
        }
    }
}

enum UnknownEnum
{
    Value_12 = 12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_22 = 22,
    Value_23,
    Value_25 = 25,
    Value_26,
    Value_28 = 28,
    Value_29,
    Value_30,
    Value_33 = 33,
    Value_38 = 38
}

function state_enemy_human_alert()
{
    target = scr_find_target_for_human();
    
    if (target != -4)
    {
        target_for_image_scale = target.x;
        var target_distance = distance_to_object(target);
        
        if (move_point_x == 0)
        {
            var range_ = 128;
            var kk = choose(0, 1, 1, 1);
            
            if (kk == 0)
            {
                move_point_x = target.x + irandom_range(-range_, range_);
                move_point_y = target.y + irandom_range(-range_, range_);
            }
            
            if (kk == 1)
            {
                move_point_x = x;
                move_point_y = y;
            }
        }
        
        riflessi++;
        enemy_seen = true;
        last_seen_x = target.x;
        last_seen_y = target.y;
        search_target_id = target;
        
        if (scr_chance(npc_get_prob_idle(npc_id) * 5))
        {
            move_point_x = x;
            move_point_y = y;
        }
        
        if (scr_chance(npc_get_prob_move(npc_id)))
        {
            var range_ = 128;
            move_point_x = target.x + irandom_range(-range_, range_);
            move_point_y = target.y + irandom_range(-range_, range_);
        }
        
        if (scr_chance(npc_get_prob_move(npc_id)))
        {
            var range_ = 128;
            move_point_x = x + irandom_range(-range_, range_);
            move_point_y = y + irandom_range(-range_, range_);
        }
        
        weapon_pointing_direction = point_direction(x, y, target.x, target.y);
        
        if (target_distance <= npc_get_player_distance_attack(npc_id))
        {
            if (reloading == false)
            {
                if (shooting == false)
                {
                    if (riflessi >= riflessi_max)
                    {
                        recoil_total = item_weapon_get_precisione(arma_now) * npc_get_aim_factor(npc_id);
                        var dam = item_weapon_get_damage(arma_now);
                        var prec = item_weapon_get_precisione(arma_now) * npc_get_aim_factor(npc_id);
                        scr_shoot(weapon_pointing_direction, UnknownEnum.Value_0, dam, prec);
                        shooting = true;
                        ammo_now -= 1;
                        
                        if (item_weapon_get_fire_mode(arma_now) == "semi_automatic")
                            alarm[1] = 10 + irandom(35);
                        else
                            alarm[1] = (item_weapon_get_rate_of_fire(arma_now) * (npc_get_prob_attack(npc_id) + random(3))) + 5;
                        
                        if (ammo_now <= 0)
                        {
                            reloading = true;
                            alarm[0] = item_weapon_get_reload_time(arma_now) * (1 + random(1.5));
                        }
                    }
                }
            }
        }
    }
    else if (search_target_id != undefined && search_target_id != -4 && instance_exists(search_target_id))
    {
        if (enemy_seen == true)
        {
            enemy_seen = false;
            move_point_x = last_seen_x;
            move_point_y = last_seen_y;
            alarm[5] = reset_state_to_patrol_time;
        }
        
        if (scr_chance(npc_get_prob_idle(npc_id)))
        {
            move_point_x = x;
            move_point_y = y;
        }
        
        if (scr_chance(npc_get_prob_move(npc_id)))
        {
            var range_ = 64;
            move_point_x = search_target_id.x + irandom_range(-range_, range_);
            move_point_y = search_target_id.y + irandom_range(-range_, range_);
        }
        
        target_for_image_scale = search_target_id.x;
        weapon_pointing_direction = point_direction(x, y, search_target_id.x, search_target_id.y);
        riflessi = 0;
        
        if (point_distance(x, y, search_target_id.x, search_target_id.y) > (npc_get_alert_visual_distance(npc_id) * 1.5))
        {
            search_target_id = -4;
            state = npc_get_state_patrol(npc_id);
        }
    }
    
    path_timer++;
    
    if (path_timer >= path_timer_reset)
    {
        path_timer = 0;
        path_end();
        path_clear_points(path_to_target);
        mp_grid_path(global.grid_move, path_to_target, x, y, move_point_x, move_point_y, true);
        path_start(path_to_target, npc_get_spd_alerted(npc_id), path_action_stop, false);
    }
}

enum UnknownEnum
{
    Value_0
}

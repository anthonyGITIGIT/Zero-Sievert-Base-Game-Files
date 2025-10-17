function bullet_hit_npc(arg0, arg1)
{
    with (arg0)
    {
        if (object_is_player(shooter_id))
        {
            damage *= global.sk_k[UnknownEnum.Value_62];
            
            if (!object_is_player(arg1.target))
                damage *= global.sk_k[UnknownEnum.Value_12];
            
            if (skill_active("flank_master"))
            {
                if (arg1.target != player_get_local() || (arg1.target == player_get_local() && arg1.target_seen == false))
                    damage *= global.skills_data.flank_master.value_1;
            }
            
            if (skill_active("steady_sniper"))
            {
                with (player_get_local())
                    frames_left_steady_sniper = global.skills_data.steady_sniper.value_2;
            }
        }
        
        var _npc_id = arg1.npc_id;
        var _apply_glance = false;
        var _dis_player_npc;
        
        if (shooter_id == player_get_local())
        {
            var _npc_angle_sweet = npc_get_sweet_angle(_npc_id);
            var _dir_player_bullethit = point_direction(player_get_local().x, player_get_local().y, x, y);
            var _dir_player_npc = point_direction(player_get_local().x, player_get_local().y, arg1.x, arg1.y);
            var _dir_npc_player = point_direction(arg1.x, arg1.y + 2, player_get_local().x, player_get_local().y);
            var _angle_diff = abs(angle_difference(_dir_player_bullethit, _dir_player_npc));
            _dis_player_npc = point_distance(player_get_local().x, player_get_local().y, arg1.x, arg1.y);
            var _dir_npc_bullethit = point_direction(arg1.x, arg1.y + 2, x, y);
            _angle_diff = abs(angle_difference(_dir_npc_bullethit, _dir_npc_player));
            var _dis_to_mouse = point_distance(fin_x, fin_y, arg1.x, arg1.y);
            trace("angle diff: ", string(_angle_diff));
            var _npc_actual_angle = glance_angle(ammo_id_used, weapon_used, _npc_angle_sweet, _dis_player_npc, _dis_to_mouse);
            
            if (_angle_diff > _npc_actual_angle)
                _apply_glance = true;
            
            if (scoped == true)
            {
                _apply_glance = false;
                var _mult_dis_player = 1;
                _mult_dis_player = glance_effective_range(ammo_id_used, weapon_used, _dis_player_npc);
                var _chance_scope_glance = _mult_dis_player * 100;
                
                if (_mult_dis_player != 0)
                    _chance_scope_glance += item_weapon_get_scope_glance_flat_amount(weapon_used);
                
                if (!scr_chance(_chance_scope_glance))
                    _apply_glance = true;
            }
            
            trace("glance: ", string(_apply_glance));
            
            if (global.hud_glance_sysytem || is_in_shooting_range())
            {
                var _obj = instance_create_depth(x, y, 0, obj_bullet_collision_debug);
                _obj.glance = _apply_glance;
                _obj.angle = _angle_diff;
                instance_create_depth(x - 0.5, y - 0.5, 0, obj_bullet_collision_debug2);
                var _text = "HIT";
                var _sign = " < ";
                
                if (_apply_glance)
                {
                    _text = "GLANCE";
                    _sign = " > ";
                }
                
                if (global.hud_glance_sysytem)
                {
                    scr_draw_text_with_box(_text + "  /  Angle: " + string(_angle_diff) + _sign + string(_npc_actual_angle));
                    trace(_text + "  /  Angle: " + string(_angle_diff) + _sign + string(_npc_actual_angle));
                }
            }
            
            scr_enemy_hit_apply_skills(arg1);
        }
        
        if (_apply_glance)
        {
            if (glance_dis_is_beyond_max_range(ammo_id_used, weapon_used, _dis_player_npc))
                damage = 0;
            else
                damage *= item_weapon_get_damage_glance_flat(weapon_used);
        }
        
        var _armor_id = arg1.armor_id;
        var _dur = arg1.armor_dur;
        var _c = 20;
        var _blocked = false;
        
        if (item_exists(_armor_id))
        {
            var _armor_class = item_armor_get_class(_armor_id);
            var _armor_rel = item_armor_get_dur_damage(_armor_id);
            
            if (skill_active("vital_shooting"))
            {
                var _check_for_hit = ds_list_find_index(arg0.enemies_under_cursor, arg1);
                
                if (_check_for_hit >= 0 && arg0.enemies_under_cursor_frames[_check_for_hit] >= global.skills_data.vital_shooting.value_2)
                {
                    _armor_class -= global.skills_data.vital_shooting.value_1;
                    
                    if (_armor_class < 0)
                        _armor_class = 0;
                }
            }
            
            var _skill_flat_increase = 0;
            
            if (skill_active("armor_no_problem"))
                _skill_flat_increase += global.skills_data.armor_no_problem.value_1;
            
            if (penetration <= (_armor_class * 10))
                _chance = (0.9 + ((penetration - (10 * _armor_class)) / _c)) - (log10(_dur / 100) * 2);
            else
                _chance = 0.9 + (((penetration - (10 * _armor_class)) / _c) - (log10(_dur / 100) * 2 * 0.15));
            
            var _chance = clamp(_chance, 0, 1);
            _chance *= 100;
            _chance += _skill_flat_increase;
            _chance = clamp(_chance, 0, 100);
            var _armor_rel_k = (_armor_rel + 100) / 100;
            
            if (scr_chance(_chance))
            {
                arg1.armor_dur -= damage * 0.3 * _armor_rel_k;
                damage *= ((_chance / 100 / 2) + 0.5);
                show_bullet_damage(arg1, damage, _chance);
            }
            else
            {
                arg1.armor_dur -= damage * 0.15 * _armor_rel_k;
                damage *= 0.1;
                _blocked = true;
                show_bullet_damage(arg1, damage, _chance);
            }
        }
        else
        {
            show_bullet_damage(arg1, damage, 100);
        }
        
        arg1.armor_dur = clamp(arg1.armor_dur, 0, 100);
        npc_damage(arg1, damage);
        arg1.shader_hit = "BULLET_HIT_SHADER_NORMAL";
        arg1.alarm[2] = 3;
        
        if (_blocked)
        {
            arg1.shader_hit = "BULLET_HIT_SHADER_NORMAL_BLOCKED";
            arg1.alarm[2] = 3;
        }
        
        if (_apply_glance)
        {
            arg1.shader_hit = "BULLET_HIT_SHADER_GLANCE";
            arg1.alarm[2] = 3;
            
            if (_blocked)
            {
                arg1.shader_hit = "BULLET_HIT_SHADER_GLANCE_BLOCKED";
                arg1.alarm[2] = 3;
            }
        }
        
        if (shooter_id == player_get_local())
        {
            var _my_faction = npc_get_faction(arg1.npc_id);
            
            if (_my_faction != "All Friend")
            {
                faction_set_rep_temp(_my_faction, "Player", 0);
                
                if (arg1.first_shot_from_player == false)
                {
                    arg1.first_shot_from_player = true;
                    var _amount = variable_struct_get(global.struct_faction, _my_faction).rep_hit;
                    faction_add_rep(_my_faction, "Player", _amount);
                }
            }
            
            if (arg1.hp <= 0)
            {
                if (arg1.bullet_checked == false)
                {
                    arg1.bullet_checked = true;
                    kill_check_quest(arg1.npc_id);
                    kill_add_stat(arg1.object_index);
                    var _amount = variable_struct_get(global.struct_faction, _my_faction).rep_hit;
                    faction_add_rep(_my_faction, "Player", _amount);
                }
            }
        }
        
        var _shooter_id = shooter_id;
        var _player = player_get_local();
        var _player_has_silencer = false;
        
        if (_shooter_id == _player && instance_exists(_player))
            _player_has_silencer = item_weapon_get_modded_silenced(_player.arma_now, player_loadout_get_mod_container(_player, _player.weapon_slot_now));
        
        if (arg1.hp <= 0)
            arg1.id_of_the_killer = shooter_id;
        
        if (arg1.state != "dummy")
        {
            if (instance_exists(_shooter_id))
            {
                with (arg1)
                {
                    if (ammo_magazine >= 0)
                    {
                        if (target == -4 || target_relation == UnknownEnum.Value_0 || target_relation == UnknownEnum.Value_1)
                        {
                            if (_player_has_silencer)
                            {
                                target = _shooter_id;
                                just_shot = 2;
                                target_relation = UnknownEnum.Value_2;
                                faction_set_rep_temp(faction, _shooter_id.faction, 0);
                                
                                if (shooted_first_time == 0)
                                    shooted_first_time = 1;
                                
                                if (shooted_first_time == 2)
                                {
                                    var _dir = point_direction(x, y, _shooter_id.x, _shooter_id.y) + irandom_range(-30, 30);
                                    var _dis = point_distance(x, y, _shooter_id.x, _shooter_id.y) div 2;
                                    last_seen_x = lengthdir_x(_dis, _dir);
                                    last_seen_y = lengthdir_y(_dis, _dir);
                                }
                            }
                            else
                            {
                                target = _shooter_id;
                                faction_set_rep_temp(faction, _shooter_id.faction, 0);
                                target_relation = UnknownEnum.Value_2;
                                state = npc_get_state_alert(npc_id);
                                last_shot_x = _shooter_id.x;
                                last_shot_y = _shooter_id.y;
                                just_shot = 1;
                                last_seen_x = _shooter_id.x;
                                last_seen_y = _shooter_id.y;
                                
                                if (shooted_first_time == 0)
                                    shooted_first_time = 1;
                            }
                        }
                        
                        target_relation = UnknownEnum.Value_2 && target == _shooter_id;
                        
                        if (_player_has_silencer)
                        {
                            just_shot = 2;
                            var _my_id = id;
                            var _faction = faction;
                            var _x = x;
                            var _y = y;
                            
                            with (obj_npc_parent)
                            {
                                if (_my_id != id && faction == _faction)
                                {
                                    if (point_distance(x, y, _x, _y) < 64)
                                        just_shot = 2;
                                }
                            }
                        }
                        else
                        {
                            just_shot = 1;
                            last_seen_x = _shooter_id.x;
                            last_seen_y = _shooter_id.y;
                        }
                    }
                }
            }
        }
        
        if (arg1.state != "dummy")
        {
            if (instance_exists(_shooter_id))
            {
                with (arg1)
                {
                    if (faction == "Mutants")
                    {
                        target = _shooter_id;
                        target_relation = UnknownEnum.Value_2;
                        state = npc_get_state_alert(npc_id);
                    }
                }
            }
        }
        
        if (arg1.red_blood == true && _blocked == false && damage != 0)
        {
            part_create_blood(image_angle - 45, image_angle + 45, damage div 3);
            part_create_blood(image_angle + 180, image_angle + 180, 2);
        }
        
        var _enemy_killed = arg1.hp < 0;
        
        if (_enemy_killed)
            scr_enemy_killed_apply_skills(arg1);
        
        if (!_enemy_killed || !skill_active("penetrating_shot") || number_of_kills >= 1)
            instance_destroy();
        
        number_of_kills++;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_12 = 12,
    Value_62 = 62
}

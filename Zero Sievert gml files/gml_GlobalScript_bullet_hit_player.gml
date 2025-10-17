function bullet_hit_player(arg0, arg1, arg2)
{
    with (arg0)
    {
        if (arg2 && arg1.object_index == obj_player)
        {
            if (shooter_faction != arg1.faction)
                scr_sound_bullet_hit_flesh();
        }
        
        scr_autoclose_inventory();
        arg1.hit_shader = "BULLET_HIT_SHADER_NORMAL";
        arg1.alarm[3] = 3;
        
        if (player_get_local_index() == arg1.mp_index)
        {
            var danno = damage * difficulty_get("enemy_human_damage");
            var _base_damage = danno;
            var _apply_glance = false;
            
            if (ignore_glance == false)
            {
                var _dis = point_distance(start_x, start_y, x, y);
                var _mult_eff_range = 1;
                _mult_eff_range = glance_effective_range(ammo_id_used, weapon_used, _dis);
                var _chance_range = 100 * _mult_eff_range;
                var _mult_eff_sweet_angle = 1;
                var _min = npc_get_sweet_angle_chance_min(npc_id);
                var _max = npc_get_sweet_angle_chance_max(npc_id);
                _mult_eff_sweet_angle = irandom_range(_min, _max);
                var _chance_npc_tir = 0.5 * _mult_eff_sweet_angle;
                var _chance_tot = (_chance_range * _max) + 5;
                
                if (!scr_chance(_chance_tot))
                {
                    _apply_glance = true;
                    arg1.hit_shader = "BULLET_HIT_SHADER_GLANCE";
                    arg1.alarm[3] = 3;
                }
                
                if (_apply_glance)
                {
                    if (item_exists(weapon_used))
                    {
                        if (_apply_glance)
                        {
                            if (glance_dis_is_beyond_max_range(ammo_id_used, weapon_used, _dis))
                                damage = 0;
                            else
                                damage *= item_weapon_get_damage_glance_flat(weapon_used);
                        }
                    }
                }
            }
            
            var _armor_id = arg1.armor_now;
            var _dur = player_loadout_get_durability(arg1, "armor slot");
            var _c = 20;
            var _blocked = false;
            
            if (ignore_armor == false)
            {
                if (item_exists(_armor_id))
                {
                    var _armor_class = item_armor_get_class(_armor_id);
                    var _armor_rel = item_armor_get_dur_damage(_armor_id);
                    
                    if (penetration <= (_armor_class * 10))
                        _chance = (0.9 + ((penetration - (10 * _armor_class)) / _c)) - (log10(_dur / 100) * 2);
                    else
                        _chance = 0.9 + (((penetration - (10 * _armor_class)) / _c) - (log10(_dur / 100) * 2 * 0.15));
                    
                    var _chance = clamp(_chance, 0, 1);
                    var _armor_rel_k = (_armor_rel + 100) / 100;
                    
                    if (scr_chance(_chance * 100))
                    {
                        var _skill_durability_multiplier = 1;
                        
                        if (skill_hunter_obtained("gearlover"))
                            _skill_durability_multiplier -= struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("gearlover")), variable_get_hash("durability_decrease_rate"));
                        
                        player_loadout_set_durability("armor slot", player_loadout_get_durability(arg1, "armor slot") - (danno * 0.08 * _armor_rel_k * _skill_durability_multiplier));
                        danno = danno * ((_chance / 2) + 0.5);
                    }
                    else
                    {
                        var _skill_durability_multiplier = 1;
                        
                        if (skill_hunter_obtained("gearlover"))
                            _skill_durability_multiplier -= struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("gearlover")), variable_get_hash("durability_decrease_rate"));
                        
                        player_loadout_set_durability("armor slot", player_loadout_get_durability(arg1, "armor slot") - (danno * 0.1 * _armor_rel_k * _skill_durability_multiplier));
                        danno *= 0.15;
                        _blocked = true;
                    }
                }
                
                if (player_loadout_get_durability(arg1, "armor slot") <= 0)
                    player_loadout_set_durability("armor slot", 0);
            }
            
            with (arg1)
                inventory_sync_armor_durability();
            
            if (danno != 0)
            {
                player_damage(danno, arg1.mp_index);
                
                if (arg1.hp <= 0)
                    global.who_killed_player_name = shooter_npc_name;
                
                with (player_get_local())
                {
                    if (skill_hunter_obtained("adrenalinerush"))
                    {
                        if (adrenalinerush_cooldown > 0 && arg1.hp <= (arg1.hp_max * struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("adrenalinerush")), variable_get_hash("health_less_than_trigger_threshold"))))
                        {
                            adrenalinerush_cooldown = room_speed * struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("adrenalinerush")), variable_get_hash("effect_cooldown_seconds"));
                            adrenalinerush_movement_speed_timer = room_speed * struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("adrenalinerush")), variable_get_hash("effect_cooldown_seconds"));
                        }
                    }
                }
                
                var _hud = instance_create_depth(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), -arg1.y, obj_hud_get_hit_flesh);
                var _hp = arg1.hp;
                var _hp_max = arg1.hp_max;
                var _div = (_hp / _hp_max) * 100;
                _hud.image_index = 0;
                
                if (_div < 50)
                    _hud.image_index = 1;
                
                if (_div < 25)
                    _hud.image_index = 2;
            }
            
            if (!_blocked)
            {
                if (global.injector_factor[UnknownEnum.Value_3] == 0)
                {
                    if (scr_chance(danno * 0.65 * global.sk_k[UnknownEnum.Value_44]))
                        arg1.bleed += 1;
                }
                
                part_create_blood(image_angle - 45, image_angle + 45, damage div 3);
                part_create_blood(image_angle + 180, image_angle + 180, 2);
            }
            
            if (_apply_glance == false)
            {
                if (_blocked)
                    instance_create_depth(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), -arg1.y, obj_hud_get_hit);
            }
        }
        
        instance_destroy();
    }
}

enum UnknownEnum
{
    Value_3 = 3,
    Value_44 = 44
}

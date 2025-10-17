if (player_get_hp(other.mp_index) > 0)
{
    if (!player_state_is(other.mp_index, scr_player_state_start, scr_player_state_free_camera))
    {
        if (damage_on_hit)
        {
            if (npc_get_damage_melee(npc_id) > 0)
            {
                if (!other.hit)
                {
                    scr_autoclose_inventory();
                    other.hit = true;
                    other.hit_shader = "BULLET_HIT_SHADER_NORMAL";
                    other.alarm[2] = 30;
                    other.alarm[3] = 3;
                    other.mutant_slow_multiplier = 0.5;
                    
                    if (skill_hunter_obtained("biteimmune"))
                        other.mutant_slow_multiplier = 1;
                    
                    other.alarm[6] = 60;
                    scr_enemy_sound_attack();
                    
                    if (player_get_local_index() == other.mp_index)
                    {
                        var player_amror = other.armor_now;
                        var danno = npc_get_damage_melee(npc_id) * (1 - item_armor_get_pierce(player_amror)) * difficulty_get("enemy_mutant_damage");
                        
                        if (object_index == obj_enemy_ghoul && ghoul_buffed_timer >= 0)
                            danno *= ghoul_buffed_mult_damage;
                        
                        player_damage(danno, other.mp_index);
                        
                        if (other.hp <= 0)
                            global.who_killed_player_name = npc_name;
                        
                        var _other = other;
                        
                        with (player_get_local())
                        {
                            if (skill_hunter_obtained("adrenalinerush"))
                            {
                                if (adrenalinerush_cooldown > 0 && _other.hp <= (_other.hp_max * struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("adrenalinerush")), variable_get_hash("health_less_than_trigger_threshold"))))
                                {
                                    adrenalinerush_cooldown = room_speed * struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("adrenalinerush")), variable_get_hash("effect_cooldown_seconds"));
                                    adrenalinerush_movement_speed_timer = room_speed * struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("adrenalinerush")), variable_get_hash("effect_cooldown_seconds"));
                                }
                            }
                        }
                        
                        if (scr_chance(danno))
                            other.wound += floor(danno * 0.3);
                        
                        if (danno != 0)
                        {
                            if (scr_chance(danno * 2 * global.sk_k[UnknownEnum.Value_44]))
                                other.bleed += 1;
                        }
                        
                        var _durability_loss = npc_get_damage_melee(npc_id) * ((item_armor_get_dur_damage(player_amror) / 100) * 0.4);
                        player_loadout_set_durability("armor slot", player_loadout_get_durability(other, "armor slot") - _durability_loss);
                        instance_create_depth(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), -y, obj_hud_get_hit);
                    }
                }
            }
        }
    }
}

enum UnknownEnum
{
    Value_44 = 44
}

function player_step_personal_stats()
{
    if (is_nan(stamina))
        stamina = 0;
    
    if (!instance_exists(obj_exit_screen))
    {
        if (global.sk_lvl[UnknownEnum.Value_21] >= 0 && energy >= 50 && thirst >= 50)
        {
            global.sk_k[UnknownEnum.Value_38] = 10 + (2 * global.sk_lvl[UnknownEnum.Value_21]);
            global.sk_k[UnknownEnum.Value_39] = 15 + (2 * global.sk_lvl[UnknownEnum.Value_21]);
        }
        
        stamina_max_total = 100 + global.sk_k[UnknownEnum.Value_0] + global.sk_k[UnknownEnum.Value_39] + global.injector_factor[UnknownEnum.Value_4];
        stamina += ((0.18 * global.sk_k[UnknownEnum.Value_6]) + global.injector_factor[UnknownEnum.Value_5]);
        
        if (!player_state_is(mp_index, scr_player_state_start, scr_player_state_free_camera))
            fatigue -= 0.0005138888888888889;
        
        fatigue = clamp(fatigue, fatigue_max, fatigue_start);
        stamina_max = clamp(stamina_max_total + min(0, fatigue), 0, stamina_max_total);
        stamina = clamp(stamina, 0, stamina_max);
        wound = clamp(wound, 0, 40);
        bleed -= global.injector_factor[UnknownEnum.Value_2];
        
        if (global.injector_factor[UnknownEnum.Value_3] > 0)
            bleed = 0;
        
        if (bleed <= 0.1)
            bleed = 0;
        
        bleed = clamp(bleed, 0, 3);
        hp_regen = global.injector_factor[UnknownEnum.Value_1];
        hp_max_total = ceil(difficulty_get("pro_player_health") + global.sk_k[UnknownEnum.Value_43] + global.sk_k[UnknownEnum.Value_38] + global.injector_factor[UnknownEnum.Value_0]);
        var _bleed_amount = (arms_holder != undefined && item_get_category(arms_holder.item_id) == "medication") ? 0 : bleed;
        hp -= (ceil(_bleed_amount) * 0.02);
        hp += (hp_regen + global.sk_k[UnknownEnum.Value_46]);
        hp_max = hp_max_total - wound;
        hp_max = clamp(hp_max, 0, hp_max_total - wound);
        hp = clamp(hp, is_in_hub() ? 10 : 0, hp_max);
        var _ignore_rad = false;
        
        if (instance_exists(obj_map_generator) && obj_map_generator.area == UnknownEnum.Value_10)
            _ignore_rad = true;
        
        var difesa_rad = item_armor_get_radiation(armor_now);
        
        if (!_ignore_rad && room == room1)
        {
            var rx = clamp(x div 8, 1, obj_map_generator.grid_rw - 2);
            var ry = clamp((y + 8) div 8, 1, obj_map_generator.grid_rh - 2);
            radiation_nella_pos_attuale = ds_grid_get(obj_map_generator.grid_radiation, rx, ry) - difesa_rad;
        }
        else
        {
            radiation_nella_pos_attuale = 0;
        }
        
        var _radiation_delta = radiation_nella_pos_attuale / 216000;
        _radiation_delta = clamp(_radiation_delta, 0, 1000);
        
        if (skill_hunter_obtained("stalker"))
            _radiation_delta *= struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("stalker")), variable_get_hash("radiation_reduction_multiplier"));
        
        radiation += _radiation_delta;
        radiation_accumulata += _radiation_delta;
        radiation_accumulata += global.sk_k[UnknownEnum.Value_47];
        radiation_accumulata -= global.injector_factor[UnknownEnum.Value_7];
        radiation_accumulata = clamp(radiation_accumulata, 0, global.status_value_max[UnknownEnum.Value_3]);
        
        if (is_in_raid())
        {
            if (!_ignore_rad)
            {
                var rx = clamp(x div 8, 1, obj_map_generator.grid_rw - 2);
                var ry = clamp((y + 8) div 8, 1, obj_map_generator.grid_rh - 2);
                player_play_radiation_sound(ds_grid_get(obj_map_generator.grid_radiation, rx, ry) - (global.injector_factor[UnknownEnum.Value_8] + difesa_rad));
            }
        }
        
        if (!player_state_is(mp_index, scr_player_state_start, scr_player_state_free_camera))
        {
            if (!is_in_hub())
            {
                energy -= (0.0005 * global.sk_k[UnknownEnum.Value_56] * difficulty_get("pro_hunger_thirst_rate"));
                thirst -= (0.0006666666666666666 * global.sk_k[UnknownEnum.Value_57] * difficulty_get("pro_hunger_thirst_rate"));
            }
            
            energy -= -global.injector_factor[UnknownEnum.Value_10];
            thirst -= -global.injector_factor[UnknownEnum.Value_12];
        }
        
        for (var i = 0; i < array_length_1d(global.sk_id); i++)
        {
            var get_id = global.sk_id[i];
            
            if (global.sk_lvl[get_id] != -1)
                global.sk_lvl[get_id] = clamp(global.sk_lvl[get_id], 0, global.sk_lvl_max[get_id] + 0.001);
        }
        
        if (hp < 20 && !player_state_is(mp_index, scr_player_state_dead))
        {
            if (!audio_is_playing(snd_heart))
                audio_play_sound(snd_heart, 2, false);
        }
        
        frames_since_last_swap_weapon++;
    }
    
    energy = clamp(energy, 0, 100);
    thirst = clamp(thirst, 0, 100);
    
    if (global.xp_level_now >= array_length(struct_get_from_hash(global.xp_data, variable_get_hash("levels"))))
        global.xp = 0;
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
    Value_10 = 10,
    Value_12 = 12,
    Value_21 = 21,
    Value_38 = 38,
    Value_39,
    Value_43 = 43,
    Value_46 = 46,
    Value_47,
    Value_56 = 56,
    Value_57
}

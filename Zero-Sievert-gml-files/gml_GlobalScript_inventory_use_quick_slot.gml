function inventory_use_quick_slot(arg0)
{
    if (player_get_local_var("reloading"))
        exit;
    
    if (!player_exists_local())
        exit;
    
    if (player_get_state() == scr_player_state_weapon_look)
        exit;
    
    var _player = player_get_local();
    var _loot = inventory_find_loot(arg0);
    
    if (is_struct(_loot))
    {
        var _found = false;
        var _item = loot_get_item(_loot);
        
        switch (item_get_category(_item))
        {
            case "medication":
                _found = true;
                _player.arms_holder = new class_player_arms(_player, _item, item_med_get_animation(_item));
                break;
            
            case "consumable":
                _found = true;
                _item = _loot.item;
                var _factor = (struct_get_from_hash(_loot, variable_get_hash("created_from_player")) ?? false) ? global.sk_k[UnknownEnum.Value_36] : 1;
                
                if (is_in_hub() && !settings_get("bunker_animation"))
                {
                    _player.energy += _factor * item_consumable_get_energy(_item);
                    _player.thirst += _factor * item_consumable_get_thirst(_item);
                    _player.fatigue += _factor * item_consumable_get_fatigue(_item);
                    _player.radiation_accumulata += _factor * item_consumable_get_radiation(_item);
                    scr_draw_text_with_box(item_get_name(_item) + " consumed");
                }
                else
                {
                    var _arms_holder = new class_player_arms(_player, _item, item_consumable_get_animation(_item));
                    _arms_holder.r_energy = _factor * item_consumable_get_energy(_item);
                    _arms_holder.r_thirst = _factor * item_consumable_get_thirst(_item);
                    _arms_holder.r_fatigue = _factor * item_consumable_get_fatigue(_item);
                    _arms_holder.r_radiation = _factor * item_consumable_get_radiation(_item);
                    _player.arms_holder = _arms_holder;
                }
                
                break;
            
            case "injector":
                _found = true;
                global.injector_factor[UnknownEnum.Value_0] += item_inj_get_max_hp(_item);
                global.injector_factor[UnknownEnum.Value_1] += item_inj_get_hp_regen(_item);
                global.injector_factor[UnknownEnum.Value_2] += item_inj_get_bleed_rec(_item);
                global.injector_factor[UnknownEnum.Value_3] += item_inj_get_bleed_immune(_item);
                global.injector_factor[UnknownEnum.Value_4] += item_inj_get_stamina_max(_item);
                global.injector_factor[UnknownEnum.Value_5] += item_inj_get_stamina_regen(_item);
                global.injector_factor[UnknownEnum.Value_6] += item_inj_get_max_weight(_item);
                global.injector_factor[UnknownEnum.Value_7] += item_inj_get_rad_regen(_item);
                global.injector_factor[UnknownEnum.Value_8] += item_inj_get_rad_def(_item);
                global.injector_factor[UnknownEnum.Value_9] += item_inj_get_hunger(_item);
                global.injector_factor[UnknownEnum.Value_10] += item_inj_get_hunger_regen(_item);
                global.injector_factor[UnknownEnum.Value_11] += item_inj_get_thirst(_item);
                global.injector_factor[UnknownEnum.Value_12] += item_inj_get_thirst_regen(_item);
                
                with (_player)
                {
                    hp_max += item_inj_get_max_hp(_item);
                    bleed_immune += item_inj_get_bleed_immune(_item);
                    stamina_max += item_inj_get_stamina_max(_item);
                    radiation_defence += item_inj_get_rad_def(_item);
                    energy += item_inj_get_hunger(_item);
                    thirst += item_inj_get_thirst(_item);
                }
                
                var in = instance_create_depth(_player.x, _player.y, 0, obj_injector_timer);
                in.injector_id = _item;
                in.injector_timer = item_inj_get_duration(_item);
                break;
            
            case "grenade":
                if (!is_in_hub())
                {
                    _found = true;
                    _player.arms_holder = new class_player_arms(_player, _item, item_grenade_get_animation(_item));
                    var _sound = choose(snd_grenade_pin_1, snd_grenade_pin_2, snd_grenade_pin_3);
                    audio_play_sound_on(_player.emitter_walk, _sound, false, 18);
                }
                
                break;
        }
        
        if (_found)
        {
            loot_decrement(_loot);
            
            if (is_in_hub())
                db_force_save_soft("pre_raid");
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
    Value_36 = 36
}

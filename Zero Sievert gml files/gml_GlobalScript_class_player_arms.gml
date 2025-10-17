function class_player_arms(arg0, arg1, arg2) constructor
{
    static func_destroy = function()
    {
        if (destroyed)
            exit;
        
        destroyed = true;
        
        with (follow_id)
        {
            if (arms_holder == other)
                arms_holder = undefined;
        }
    };
    
    static func_draw = function()
    {
        if (destroyed)
            exit;
        
        if (!instance_exists(follow_id))
            exit;
        
        draw_sprite_ext(sprite_index, image_index, follow_id.x, follow_id.y, follow_id.image_xscale, 1, 0, c_white, 1);
    };
    
    static func_step = function()
    {
        if (destroyed)
            exit;
        
        if (!instance_exists(follow_id))
            func_destroy();
        
        if (alarm1 > 0)
        {
            alarm1--;
            
            if (alarm1 <= 0)
                func_alarm_1();
        }
        
        if (alarm2 > 0)
        {
            alarm2--;
            
            if (alarm2 <= 0)
                func_alarm_2();
        }
        
        if (alarm3 > 0)
        {
            alarm3--;
            
            if (alarm3 <= 0)
                func_alarm_3();
        }
        
        if (alarm1 <= 0 && (mouse_check_button_pressed(mb_left) || obj_gamepad.action[UnknownEnum.Value_27].pressed))
        {
            follow_id.shoot_stop_ani = true;
            follow_id.bleed = player_bleed;
            set_state_after_consumable();
            
            if (item_get_category(item_id) == "consumable" || item_get_category(item_id) == "grenade")
            {
                with (obj_controller)
                {
                    if (item_get_category(other.item_id) == "consumable")
                        inventory_add_item(other.item_id, 1);
                    
                    if (item_get_category(other.item_id) == "grenade")
                        inventory_add_item(other.item_id, 1, 100, global.last_quick_slot_pressed);
                }
            }
            
            func_destroy();
        }
        
        if (item_get_category(item_id) == "medication")
        {
            follow_id.hp += (item_med_get_hp(item_id) / item_med_get_duration(item_id)) * _skill_multiplier;
            follow_id.radiation_accumulata += (item_med_get_radiation(item_id) / item_med_get_duration(item_id)) * _skill_multiplier;
            follow_id.wound -= (item_med_get_wound(item_id) / item_med_get_duration(item_id)) * _skill_multiplier;
        }
        
        if (sprite_index == s_arms_drink || sprite_index == s_arms_drink_juice || sprite_index == s_arms_drink_cola)
        {
            if (image_index >= 14 && image_index < 16)
                image_speed = 0.1;
            else
                image_speed = 0.5;
        }
        
        if (sprite_index == s_arms_smoke)
        {
            if (image_index > 7 && image_index < 12)
            {
                with (follow_id)
                {
                    if (image_xscale > 0)
                        part_type_direction(obj_particles_controller.particles_type[UnknownEnum.Value_41], -10, 10, 0, 0);
                    else
                        part_type_direction(obj_particles_controller.particles_type[UnknownEnum.Value_41], 170, 190, 0, 0);
                    
                    part_emitter_region(obj_particles_controller.particles_system[UnknownEnum.Value_41], obj_particles_controller.partciles_emitter[UnknownEnum.Value_41], x + (2 * image_xscale), x + (2 * image_xscale), y + 2, y + 2, 0, 1);
                    part_emitter_burst(obj_particles_controller.particles_system[UnknownEnum.Value_41], obj_particles_controller.partciles_emitter[UnknownEnum.Value_41], obj_particles_controller.particles_type[UnknownEnum.Value_41], 1);
                }
            }
        }
        
        var _image_speed = image_speed * ((sprite_get_speed_type(sprite_index) == 1) ? sprite_get_speed(sprite_index) : (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)));
        
        if ((image_index + _image_speed) >= sprite_get_number(sprite_index))
            func_animation_end();
        
        image_index = (image_index + _image_speed) % sprite_get_number(sprite_index);
    };
    
    static func_alarm_1 = function()
    {
        if (destroyed)
            exit;
        
        player_set_state(scr_player_state_consumable_animation, follow_id.mp_index);
        follow_id.sprite_index = follow_id.sprite_idle;
        follow_id.image_speed = 0;
        follow_id.image_index = 0;
        alarm3 = 1;
    };
    
    static func_alarm_2 = function()
    {
        if (destroyed)
            exit;
        
        set_state_after_consumable();
        
        if (item_get_category(item_id) == "medication")
            follow_id.bleed = player_bleed - item_med_get_bleed(item_id);
        
        func_destroy();
    };
    
    static func_alarm_3 = function()
    {
        if (destroyed)
            exit;
    };
    
    static func_animation_end = function()
    {
        if (destroyed)
            exit;
        
        counter++;
        
        if (counter >= counter_max)
        {
            if (item_get_category(item_id) != "medication")
            {
                set_state_after_consumable();
                follow_id.energy += r_energy;
                follow_id.thirst += r_thirst;
                follow_id.fatigue += r_fatigue;
                follow_id.radiation_accumulata += r_radiation;
                func_destroy();
            }
            
            if (item_get_category(item_id) == "grenade")
            {
                set_state_after_consumable();
                var _offset = 0;
                
                if (item_grenade_get_throw_type(item_id) == "GRENADE_throw_no_move")
                    _offset = 6;
                
                var _max = point_distance(follow_id.x, follow_id.y, obj_cursor.aa_x, obj_cursor.aa_y);
                _max = clamp(_max, 0, item_grenade_get_throw_max(item_id));
                var _throw_speed = lerp(0.5, 3, _max / item_grenade_get_throw_max(item_id));
                var _grenade = instance_create_depth(follow_id.x, follow_id.y + _offset, 0, obj_grenade_parent, 
                {
                    grenade_id: item_id,
                    throw_min: item_grenade_get_throw_min(item_id),
                    throw_max: item_grenade_get_throw_max(item_id),
                    fuse_time: item_grenade_get_fuse_time(item_id),
                    throw_type: item_grenade_get_throw_type(item_id),
                    damage_max: item_grenade_get_damage_max(item_id),
                    damage_min: item_grenade_get_damage_min(item_id),
                    detonation_type: item_grenade_get_detonation_type(item_id),
                    detonation_duration: item_grenade_get_detonation_duration(item_id),
                    radius_max_damage: item_grenade_get_radius_max_damage(item_id),
                    radius_min_damage: item_grenade_get_radius_min_damage(item_id),
                    throw_direction: point_direction(follow_id.x, follow_id.y, obj_cursor.aa_x, obj_cursor.aa_y),
                    detonation_point: point_distance(follow_id.x, follow_id.y, obj_cursor.aa_x, obj_cursor.aa_y),
                    sprite_index: item_get_sprite_ingame(item_id),
                    throw_speed: _throw_speed
                });
                _grenade.thrown_by_player = true;
                func_destroy();
            }
        }
        
        if (sprite_index == s_arms_med1)
        {
            image_index = 11;
            image_speed = 0;
        }
        
        if (sprite_index == s_arms_med_bandage)
            image_index = 5;
        
        if (sprite_index == s_arms_med_long || sprite_index == s_arms_med_wound_1)
            image_index = 10;
    };
    
    destroyed = false;
    follow_id = arg0;
    item_id = arg1;
    sprite_index = arg2;
    image_index = 0;
    im_speed = 0.5;
    image_speed = im_speed;
    alarm1 = 3;
    alarm2 = -1;
    alarm3 = -1;
    counter = 0;
    counter_max = 1;
    player_bleed = follow_id.bleed;
    r_energy = 0;
    r_thirst = 0;
    r_fatigue = 0;
    r_radiation = 0;
    _skill_multiplier = 1;
    
    if (skill_hunter_obtained("fieldmedic"))
        _skill_multiplier += struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("fieldmedic")), variable_get_hash("medical_usage_time"));
    
    switch (sprite_index)
    {
        case s_arms_smoke:
            counter_max = 4;
            break;
        
        case s_arms_eat:
            counter_max = 3;
            break;
        
        case s_arms_eat_can:
            counter_max = 1;
            break;
        
        case s_arms_eat_mre:
            counter_max = 4;
            break;
        
        case s_arms_eat_meat:
            counter_max = 3;
            break;
        
        case s_arms_eat_chocolate:
            counter_max = 2;
            break;
        
        case s_arms_drink:
            counter_max = 1;
            break;
        
        case s_arms_drink_juice:
            counter_max = 1;
            break;
        
        case s_arms_drink_cola:
            counter_max = 1;
            break;
        
        case s_arms_med1:
            allthatforadropofblood_achievement();
            counter_max = 1;
            image_speed = im_speed * global.sk_k[UnknownEnum.Value_28] * (_skill_multiplier * 2);
            break;
        
        case s_arms_med_bandage:
            allthatforadropofblood_achievement();
            counter_max = 4;
            image_speed = im_speed * global.sk_k[UnknownEnum.Value_28] * (_skill_multiplier * 2);
            break;
        
        case s_arms_med_bandage_sterilizzata:
            allthatforadropofblood_achievement();
            counter_max = 4;
            image_speed = im_speed * global.sk_k[UnknownEnum.Value_28] * (_skill_multiplier * 2);
            break;
        
        case s_arms_med_long:
            allthatforadropofblood_achievement();
            counter_max = 4;
            image_speed = im_speed * global.sk_k[UnknownEnum.Value_28] * (_skill_multiplier * 2);
            break;
        
        case s_arms_med_wound_1:
            allthatforadropofblood_achievement();
            counter_max = 6;
            image_speed = im_speed * global.sk_k[UnknownEnum.Value_28] * (_skill_multiplier * 2);
            break;
    }
    
    show_debug_message([image_speed, im_speed, global.sk_k[UnknownEnum.Value_28], _skill_multiplier]);
    trace([current_time, "IMAGE_SPEED", image_speed]);
    audio_play_sound(item_consumable_get_sound(item_id), 6, false);
    
    if (item_get_category(item_id) == "medication")
        alarm2 = ceil(item_med_get_duration(item_id) / global.sk_k[UnknownEnum.Value_29] / _skill_multiplier);
}

enum UnknownEnum
{
    Value_27 = 27,
    Value_28,
    Value_29,
    Value_41 = 41
}

function scr_player_state_move()
{
    var action = false;
    scr_player_movement(1, true, true);
    player_unstick();
    
    if (global.kb_pressed[UnknownEnum.Value_15] || gamepad_hold_released_lessthan(UnknownEnum.Value_3))
        player_action_change_weapon(UnknownEnum.Value_1);
    
    if (global.kb_pressed[UnknownEnum.Value_16] || gamepad_hold_released_lessthan(UnknownEnum.Value_3))
        player_action_change_weapon(UnknownEnum.Value_2);
    
    player_action_shoot();
    
    if (!action)
    {
        if (player_action_quick_slot())
            action = true;
    }
    
    if (!action)
    {
        if (global.kb_pressed[UnknownEnum.Value_26] && player_loadout_get_jammed(self, weapon_slot_now))
        {
            player_action_unjam();
            action = true;
        }
    }
    
    if (reloading && skill_active("reload_artist_speed_reload"))
    {
        if (global.kb_pressed[UnknownEnum.Value_7] || player_loadout_get_ammo(self, weapon_slot_now) <= 0)
        {
            if (item_weapon_get_reload_type(arma_now) == "magazine")
            {
                if (alarm[0] > 1 && (state_reload == UnknownEnum.Value_0 || state_reload == UnknownEnum.Value_1))
                {
                    alarm[0] = 1;
                    state_reload = UnknownEnum.Value_1;
                    
                    repeat (player_loadout_get_ammo(self, weapon_slot_now))
                        scr_spawn_shell();
                    
                    player_loadout_set_ammo(weapon_slot_now, 0);
                }
            }
            else if (global.kb_pressed[UnknownEnum.Value_7])
            {
                scr_draw_text_with_box("Speed Reload not allowed with this magazine type.");
            }
        }
    }
    
    player_reset_interactable();
    
    if (!action && global.kb_pressed[UnknownEnum.Value_25])
    {
        if (player_action_teleport_to_npc())
            action = true;
    }
    
    if (!action)
    {
        if (global.kb_pressed[UnknownEnum.Value_7] && player_action_reload())
            action = true;
        
        if (mouse_check_button_pressed(mb_left))
        {
            if (reloading && (state_reload != UnknownEnum.Value_2 && state_reload != UnknownEnum.Value_3 && state_reload != UnknownEnum.Value_4))
            {
                if (item_weapon_get_reload_type(arma_now) == "shotgun_single" || item_weapon_get_reload_type(arma_now) == "sniper_single")
                    state_reload = UnknownEnum.Value_2;
            }
        }
    }
    
    if (!reloading && instance_exists(obj_camera))
    {
        if (!action && point_distance(x, y, obj_camera.x, obj_camera.y) < 200)
        {
            if (global.kb_pressed[UnknownEnum.Value_5] && !instance_exists(obj_radial_menu))
            {
                action = true;
                player_action_open_inventory();
            }
            else
            {
                player_collect_nearby_interactables();
            }
        }
    }
    
    player_action_change_ammo();
    player_position_laser();
    
    if (!action && global.kb_pressed[UnknownEnum.Value_13])
    {
        if (player_action_change_fire_mode())
            action = true;
    }
    
    if (!action && global.kb_pressed[UnknownEnum.Value_11])
    {
        if (player_action_open_minimap())
            action = true;
    }
    
    if (!action && global.kb_pressed[UnknownEnum.Value_10])
    {
        if (player_action_open_pda())
            action = true;
    }
    
    if (!action && global.kb_pressed[UnknownEnum.Value_12])
    {
        if (player_action_throw_bolt())
            action = true;
    }
    
    if (!action && global.kb_pressed[UnknownEnum.Value_24])
    {
        if (player_action_weapon_closeup())
            action = true;
    }
    
    if (!action && global.kb_pressed[UnknownEnum.Value_14])
    {
        if (player_action_toggle_headset())
            action = true;
    }
    
    if (!action && global.kb_pressed[UnknownEnum.Value_8])
    {
        if (player_action_toggle_torch())
            action = true;
    }
    
    if (!action && global.kb_pressed[UnknownEnum.Value_9])
    {
        if (player_action_toggle_laser())
            action = true;
    }
    
    player_update_weapon_torch();
    player_update_weapon_laser();
    scr_player_all_quest_triggers();
    
    if (!action)
    {
        player_collect_interactables();
        player_action_interactable_scroll();
        
        if (global.kb_pressed[UnknownEnum.Value_6])
            player_action_interact();
    }
    
    player_handle_scope_aiming();
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
    Value_24 = 24,
    Value_25,
    Value_26
}

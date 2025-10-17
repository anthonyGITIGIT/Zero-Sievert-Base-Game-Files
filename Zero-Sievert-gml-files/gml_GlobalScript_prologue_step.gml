function prologue_step()
{
    if (!instance_exists(obj_map_generator))
        exit;
    
    if (obj_map_generator.state != UnknownEnum.Value_21)
        exit;
    
    player_follow_local();
    
    if (global.general_debug && keyboard_check_pressed(vk_space) && false)
    {
        state++;
        state = clamp(state, 0, UnknownEnum.Value_31);
    }
    
    if (timer_go)
    {
        timer++;
        
        if (timer >= timer_max)
        {
            timer_go = false;
            state++;
            state = clamp(state, 0, UnknownEnum.Value_31);
            timer = 0;
            text_counter = 0;
            
            switch (state)
            {
                case UnknownEnum.Value_4:
                    scr_draw_npc_text(obj_prologue_npc, UnknownEnum.Value_266);
                    break;
                
                case UnknownEnum.Value_5:
                    audio_play_sound(snd_wolf_ul1, 30, false);
                    timer_go = true;
                    timer_max = 120;
                    break;
                
                case UnknownEnum.Value_6:
                    scr_draw_npc_text(obj_prologue_npc, UnknownEnum.Value_268);
                    break;
                
                case UnknownEnum.Value_8:
                    scr_draw_npc_text(obj_prologue_npc, UnknownEnum.Value_270);
                    timer_go = true;
                    timer_max = 120;
                    break;
                
                case UnknownEnum.Value_9:
                    repeat (3)
                    {
                        var _obj = instance_create_depth(1055, 1700 + irandom_range(-32, 32), 0, obj_enemy_wolf_brown);
                        _obj.alarm[6] = 5;
                    }
                    
                    timer_go = true;
                    timer_max = 120;
                    break;
                
                case UnknownEnum.Value_11:
                    scr_draw_npc_text(obj_prologue_npc, UnknownEnum.Value_271);
                    break;
                
                case UnknownEnum.Value_16:
                    scr_draw_npc_text(obj_prologue_npc, UnknownEnum.Value_277);
                    break;
                
                case UnknownEnum.Value_17:
                    with (player_get_local())
                    {
                        if (hp >= (hp_max * 0.9))
                            hp = hp_max * 0.9;
                    }
                    
                    player_hp_before = player_get_hp();
                    break;
                
                case UnknownEnum.Value_18:
                    scr_draw_npc_text(obj_prologue_npc, UnknownEnum.Value_281);
                    break;
                
                case UnknownEnum.Value_19:
                    with (obj_prologue_npc)
                        npc_speaker_id = "tutorial_npc";
                    
                    break;
                
                case UnknownEnum.Value_20:
                    scr_draw_npc_text(obj_prologue_npc, UnknownEnum.Value_284);
                    break;
                
                case UnknownEnum.Value_21:
                    minimap_add_interesting_marker(120, 63, UnknownEnum.Value_7);
                    break;
                
                case UnknownEnum.Value_25:
                    minimap_remove_interesting_marker_by_id(UnknownEnum.Value_7);
                    break;
                
                case UnknownEnum.Value_26:
                    scr_draw_npc_text(obj_player, UnknownEnum.Value_291);
                    break;
                
                case UnknownEnum.Value_28:
                    scr_draw_npc_text(obj_player, UnknownEnum.Value_294);
                    break;
            }
        }
    }
    
    switch (state)
    {
        case UnknownEnum.Value_1:
            text_now = language_get_string("Hey. Wake up!");
            
            if (text_counter >= (string_length(text_now) - 2) && text_counter < (string_length(text_now) - 1))
            {
                timer_go = true;
                timer_max = 150;
            }
            
            break;
        
        case UnknownEnum.Value_2:
            text_now = language_get_string("Can you hear me?");
            
            if (text_counter >= (string_length(text_now) - 2) && text_counter < (string_length(text_now) - 1))
            {
                timer_go = true;
                timer_max = 150;
            }
            
            break;
        
        case UnknownEnum.Value_3:
            screen_alpha -= screen_alpha_k;
            screen_alpha = clamp(screen_alpha, 0, 1);
            
            if (screen_alpha == 0)
            {
                timer_go = true;
                timer_max = 90;
            }
            
            break;
        
        case UnknownEnum.Value_4:
            var _go = false;
            
            with (obj_npc_draw_text)
            {
                if (text_id == UnknownEnum.Value_267)
                    _go = true;
            }
            
            if (_go)
            {
                timer_go = true;
                timer_max = 90;
            }
            
            break;
        
        case UnknownEnum.Value_6:
            if (item_exists(player_get_local().arma_now))
            {
                timer_go = true;
                timer_max = 20;
            }
            
            break;
        
        case UnknownEnum.Value_7:
            if (player_loadout_get_ammo(player_get_local(), player_get_local().weapon_slot_now) > 0)
            {
                timer_go = true;
                timer_max = 60;
            }
            
            break;
        
        case UnknownEnum.Value_10:
            if (!instance_exists(obj_enemy_wolf_brown))
            {
                timer_go = true;
                timer_max = 60;
            }
            
            break;
        
        case UnknownEnum.Value_11:
            var _go = false;
            
            with (obj_npc_draw_text)
            {
                if (text_id == UnknownEnum.Value_275)
                    _go = true;
            }
            
            if (_go)
            {
                timer_go = true;
                timer_max = 180;
            }
            
            break;
        
        case UnknownEnum.Value_12:
            if (instance_exists(obj_chest_prologue_medication))
            {
                if (point_distance(player_get_local().x, player_get_local().y, obj_chest_prologue_medication.x, obj_chest_prologue_medication.y) < 64)
                {
                    timer_go = true;
                    timer_max = 5;
                }
            }
            
            break;
        
        case UnknownEnum.Value_13:
            if (inventory_item_exists("medikit_long"))
            {
                timer_go = true;
                timer_max = 5;
            }
            
            break;
        
        case UnknownEnum.Value_14:
            if (instance_exists(obj_prologue_npc))
            {
                if (point_distance(player_get_local().x, player_get_local().y, obj_prologue_npc.x, obj_prologue_npc.y) < 128)
                {
                    timer_go = true;
                    timer_max = 5;
                }
            }
            
            break;
        
        case UnknownEnum.Value_16:
            var _go = false;
            
            with (obj_npc_draw_text)
            {
                if (text_id == UnknownEnum.Value_280)
                    _go = true;
            }
            
            if (_go)
            {
                timer_go = true;
                timer_max = 180;
            }
            
            break;
        
        case UnknownEnum.Value_17:
            if (player_get_hp() > player_hp_before)
            {
                timer_go = true;
                timer_max = 60;
            }
            
            break;
        
        case UnknownEnum.Value_18:
            var _go = false;
            
            with (obj_npc_draw_text)
            {
                if (text_id == UnknownEnum.Value_283)
                    _go = true;
            }
            
            if (_go)
            {
                timer_go = true;
                timer_max = 180;
            }
            
            break;
        
        case UnknownEnum.Value_19:
            if (deal_done && player_state_is(player_get_local().mp_index, scr_player_state_move))
            {
                timer_go = true;
                timer_max = 60;
            }
            
            break;
        
        case UnknownEnum.Value_21:
            if (global.kb_pressed[UnknownEnum.Value_11])
            {
                timer_go = true;
                timer_max = 5;
            }
            
            break;
        
        case UnknownEnum.Value_22:
            if (global.kb_pressed[UnknownEnum.Value_11])
            {
                timer_go = true;
                timer_max = 5;
            }
            
            break;
        
        case UnknownEnum.Value_20:
            var _go = false;
            
            with (obj_npc_draw_text)
            {
                if (text_id == UnknownEnum.Value_290)
                    _go = true;
            }
            
            if (_go)
            {
                timer_go = true;
                timer_max = 120;
            }
            
            break;
        
        case UnknownEnum.Value_23:
            if (instance_exists(obj_chest_prologue_letter))
            {
                if (point_distance(player_get_local().x, player_get_local().y, obj_chest_prologue_letter.x, obj_chest_prologue_letter.y) < 96)
                {
                    timer_go = true;
                    timer_max = 5;
                }
            }
            
            break;
        
        case UnknownEnum.Value_24:
            if (inventory_item_exists("prologue_letter"))
            {
                timer_go = true;
                timer_max = 5;
            }
            
            break;
        
        case UnknownEnum.Value_26:
            var _go = false;
            
            with (obj_npc_draw_text)
            {
                if (text_id == UnknownEnum.Value_293)
                    _go = true;
            }
            
            if (_go)
            {
                timer_go = true;
                timer_max = 120;
            }
            
            break;
        
        case UnknownEnum.Value_28:
            var _go = false;
            
            with (obj_npc_draw_text)
            {
                if (text_id == UnknownEnum.Value_294)
                    _go = true;
            }
            
            if (_go)
            {
                timer_go = true;
                timer_max = 180;
            }
            
            break;
        
        case UnknownEnum.Value_30:
            if (instance_exists(obj_green_army_prologue))
            {
                if (point_distance(obj_green_army_prologue.x, obj_green_army_prologue.y, player_get_local().x, player_get_local().y) < 220)
                {
                    if (ga_spoken_1 == false)
                    {
                        scr_draw_npc_text(obj_green_army_prologue, UnknownEnum.Value_295);
                        ga_spoken_1 = true;
                    }
                }
                
                if (point_distance(obj_green_army_prologue.x, obj_green_army_prologue.y, player_get_local().x, player_get_local().y) < 48)
                {
                    if (ga_spoken_2 == false)
                    {
                        scr_draw_npc_text(obj_green_army_prologue, UnknownEnum.Value_297);
                        ga_spoken_2 = true;
                    }
                }
            }
            
            break;
    }
    
    if (state < UnknownEnum.Value_24 && inventory_item_exists("prologue_letter"))
        state = UnknownEnum.Value_25;
}

enum UnknownEnum
{
    Value_1 = 1,
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
    Value_16 = 16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_28 = 28,
    Value_30 = 30,
    Value_31,
    Value_266 = 266,
    Value_267,
    Value_268,
    Value_270 = 270,
    Value_271,
    Value_275 = 275,
    Value_277 = 277,
    Value_280 = 280,
    Value_281,
    Value_283 = 283,
    Value_284,
    Value_290 = 290,
    Value_291,
    Value_293 = 293,
    Value_294,
    Value_295,
    Value_297 = 297
}

function player_step_debug_keys()
{
    if (!global.general_debug)
        exit;
    
    if (keyboard_check_pressed(vk_f1))
    {
        if (obj_controller.debug_menu == true)
            obj_controller.debug_menu = false;
        else
            obj_controller.debug_menu = true;
    }
    
    if (keyboard_check_pressed(vk_f2) && keyboard_check(vk_control))
        global.player_money += 10000;
    
    if (keyboard_check_pressed(vk_f3) && keyboard_check(vk_control))
        instance_create_depth(obj_cursor.aa_x, obj_cursor.aa_y, 0, obj_dummy);
    
    if (keyboard_check_pressed(vk_f4) && keyboard_check(vk_control))
    {
        x = obj_cursor.aa_x;
        y = obj_cursor.aa_y;
    }
    
    if (keyboard_check(ord("T")) && keyboard_check_pressed(vk_right))
    {
        time_increment_hours(1);
        weather_particle_array_clear();
    }
    
    if (keyboard_check_pressed(vk_f5) && keyboard_check(vk_control))
    {
        __uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/debug_spawner.ui", "debug layer");
        player_set_local_state(scr_player_state_item_spawn);
        ui_debug_spawner_populate(uiGetData().debug_spawner_category, 0);
    }
    
    if (keyboard_check_pressed(vk_f7) && keyboard_check(vk_control))
    {
        if (is_in_raid())
            obj_controller.alarm[3] = 1;
    }
    
    if (keyboard_check_pressed(vk_f6) && keyboard_check(vk_control))
    {
        if (is_in_raid())
        {
            var _map = from_map_enum_to_map_macro(obj_map_generator.area);
            var _weather = weather_choose_new_weather(_map);
            
            for (var i = 0; i < array_length(global.weather.map); i++)
                global.weather.map[i].weather_type[0] = _weather;
            
            weather_particle_array_clear();
            weather_transition(1, false);
        }
    }
    
    if (keyboard_check_pressed(vk_f8) && keyboard_check(vk_control))
    {
        if (is_in_raid())
            instance_create_depth(obj_cursor.aa_x, obj_cursor.aa_y, 0, obj_loner_enemy2);
    }
    
    if (keyboard_check_pressed(ord("9")) && keyboard_check(vk_control))
    {
        if (global.debug_hide_hud == false)
            global.debug_hide_hud = true;
        else
            global.debug_hide_hud = false;
    }
    
    if (keyboard_check_pressed(ord("8")) && keyboard_check(vk_control))
    {
        if (global.debug_hide_debug_position == false)
            global.debug_hide_debug_position = true;
        else
            global.debug_hide_debug_position = false;
    }
    
    if (keyboard_check_pressed(vk_f10) && keyboard_check(vk_control))
    {
        if (player_local_state_is(scr_player_state_move))
        {
            player_set_local_state(scr_player_state_free_camera);
            visible = false;
        }
        else if (player_local_state_is(scr_player_state_free_camera))
        {
            player_set_local_state(scr_player_state_move);
            visible = true;
        }
        else
        {
            scr_draw_text_with_box("Cannot use free camera when the player is busy");
        }
    }
    
    if (keyboard_check(vk_alt) && keyboard_check(vk_control) && keyboard_check_pressed(ord("E")))
    {
        if (is_in_raid())
        {
            if (global.state_emission_now == UnknownEnum.Value_0)
            {
                obj_meteo_controller.alarm[1] = 1;
                scr_draw_text_with_box("Emission started");
            }
        }
    }
    
    if (keyboard_check_pressed(ord("E")) && keyboard_check(vk_control))
        global.hud_glance_sysytem = !global.hud_glance_sysytem;
    
    if (keyboard_check_pressed(ord("R")) && keyboard_check(vk_control))
        global.hud_damage_sysytem = !global.hud_damage_sysytem;
    
    if (keyboard_check_pressed(ord("Q")) && keyboard_check(vk_control))
        global.show_npc_recoil = !global.show_npc_recoil;
    
    if (keyboard_check_pressed(ord("S")) && keyboard_check(vk_control))
        global.debug_speed = !global.debug_speed;
    
    if (keyboard_check_pressed(ord("G")) && keyboard_check(vk_control))
        global.show_dynamic_npc_path = !global.show_dynamic_npc_path;
    
    if (keyboard_check_pressed(ord("T")) && keyboard_check(vk_control))
        global.show_reflexes_npc = !global.show_reflexes_npc;
    
    if (keyboard_check_pressed(ord("L")) && keyboard_check(vk_control))
    {
        var _buffer = buffer_create(8, buffer_grow, 1);
        var _text = "";
        var _keys = variable_struct_get_names(global.language_tracking);
        
        for (var i = 0; i < array_length(_keys); i++)
        {
            if (string_pos("_", string(_keys[i])) != 1)
                _text = _text + string(string_replace_all(_keys[i], "\n", "\\n")) + "\n";
        }
        
        buffer_write(_buffer, buffer_text, _text);
        buffer_save(_buffer, "Missing_Translations.txt");
        buffer_delete(_buffer);
    }
    
    if (keyboard_check(vk_alt) && keyboard_check_pressed(vk_f9))
    {
        faction_add_rep("Player", "Green Army", 50);
        scr_draw_text_with_box("Reputation with Green Army increased by 50");
    }
    
    if (keyboard_check(vk_alt) && keyboard_check_pressed(vk_f10))
    {
        faction_add_rep("Player", "Crimson Corporation", 50);
        scr_draw_text_with_box("Reputation with Crimson Corporqation increased by 50");
    }
    
    if (keyboard_check_pressed(vk_f10))
        npc_spawn_near_player(obj_hunter_preset_master, 1, true);
}

enum UnknownEnum
{
    Value_0
}

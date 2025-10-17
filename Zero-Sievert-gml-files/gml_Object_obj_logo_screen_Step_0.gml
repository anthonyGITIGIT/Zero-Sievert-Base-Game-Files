if (phase_delay > 0)
{
    phase_delay--;
}
else
{
    switch (phase)
    {
        case 0:
            if (!steam_initialised())
                trace("Init: Running in offline mode");
            else
                trace("Init: Running in online mode, account ID = ", steam_get_user_account_id());
            
            phase++;
            break;
        
        case 1:
            ui_initialize_debug_behaviours();
            ui_initialize_functions();
            ui_initialize_constants_and_assets();
            ui_initialize_data_struct();
            phase++;
            break;
        
        case 2:
            trace("Init: Setting up databases");
            scr_setup_save_databases();
            phase++;
            break;
        
        case 3:
            trace("Init: Loading settings");
            db_load("local settings");
            db_load("shared settings");
            phase++;
            break;
        
        case 4:
            global.database_was_previously_using_cloud_saves = db_read_ext("local settings", "cloud", "using_cloud", undefined);
            db_cloud_sync_all();
            phase++;
            break;
        
        case 5:
            trace("Init: Applying settings");
            settings_reload_and_apply();
            
            if (settings_get("fullscreen"))
                phase_delay = 20;
            
            phase++;
            break;
        
        case 6:
            phase++;
            break;
        
        case 7:
            scr_setup_lootlocker();
            scr_setup_news();
            phase++;
            break;
        
        case 8:
            difficulty_reset_all("rookie");
            phase++;
            break;
        
        case 9:
            trace("Init: Loading game data from JSON");
            gamedata_initialize_and_load();
            phase++;
            break;
        
        case 10:
            trace("Init: Loading templates");
            building_index_load("template_index.json");
            phase++;
            break;
        
        case 11:
            trace("Init: Done!");
            var _i = 0;
            
            repeat (parameter_count())
            {
                if (parameter_string(_i) == "-strict_cloud")
                    global.strict_steam_mode = true;
                
                _i++;
            }
            
            var _report_string = "";
            
            if (global.trace_to_file)
                _report_string += "\"Log To File\" mode enabled\n";
            
            if (global.strict_steam_mode)
                _report_string += "\"Strict Cloud\" mode enabled\n";
            
            if (_report_string != "")
                show_message(_report_string);
            
            if (global.strict_steam_mode)
            {
                if (!steam_initialised())
                    trace_error("Steam initialization failed");
            }
            
            phase++;
            break;
        
        case 12:
            trace("Loading mods");
            mods_rebuild_data();
            phase++;
            break;
        
        case 13:
            if (!instance_exists(obj_gamepad))
                instance_create_depth(-1, -1, -10000, obj_gamepad);
            
            if (!instance_exists(obj_cursor))
                instance_create_depth(-1, -1, -10000, obj_cursor);
            
            if (!instance_exists(obj_sprite_downloader))
                instance_create_depth(-1, -1, -10000, obj_sprite_downloader);
            
            if (!instance_exists(obj_action_prompt))
                instance_create_depth(-1, -1, -10000, obj_action_prompt);
            
            if (!instance_exists(obj_buffer_async))
                instance_create_depth(-1, -1, -10000, obj_buffer_async);
            
            if (!instance_exists(LootLocker))
                instance_create_depth(-1, -1, -10000, LootLocker);
            
            if (!instance_exists(obj_news))
                instance_create_depth(-1, -1, -10000, obj_news);
            
            switch (settings_get("resolution"))
            {
                case UnknownEnum.Value_0:
                    window_set_size(1280, 720);
                    break;
                
                case UnknownEnum.Value_1:
                    window_set_size(1920, 1080);
                    break;
                
                case UnknownEnum.Value_2:
                    window_set_size(2560, 1440);
                    break;
                
                case UnknownEnum.Value_3:
                    window_set_size(3840, 2160);
                    break;
            }
            
            phase++;
            break;
        
        case 14:
            sprite_prefetch(s_zs_main_menu_news_bg);
            sprite_prefetch(s_zs_title_main_menu);
            sprite_prefetch(spr_videoreplacement_mainmenu);
            phase++;
            break;
        
        case 15:
            trace("Init: Loading video");
            video = video_open("ZS_boot.mp4");
            var _video_duration = video_get_duration();
            alarm[0] = max(floor((_video_duration / 1000) * 60) - 60, 60);
            video_enable_loop(false);
            phase++;
            break;
        
        case 16:
            if (db_read_ext("local settings", "first_time", "first_time", true) || show_prompt)
            {
                show_prompt = true;
                
                if (keyboard_check_released(vk_anykey) || mouse_check_button_released(mb_any) || obj_gamepad.input_released[UnknownEnum.Value_29])
                {
                    video_close();
                    show_prompt = false;
                    fade_out = true;
                    phase++;
                }
            }
            
            break;
        
        case 17:
            if (prompt_alpha <= 0)
            {
                db_open("local settings");
                db_write("first_time", "first_time", true);
                db_close();
                video_close();
                room_goto(r_menu);
            }
            
            break;
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_29 = 29
}

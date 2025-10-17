function game_pause()
{
    with (obj_controller)
    {
        var _can_pause = true;
        
        if (is_in_raid())
        {
            if (instance_exists(obj_map_generator))
            {
                if (obj_map_generator.state < UnknownEnum.Value_20)
                    _can_pause = false;
            }
        }
        
        if (!instance_exists(obj_exit_screen))
        {
            if (can_pause == true && _can_pause == true)
            {
                scr_save_skill_and_base();
                scr_save_ftue();
                
                if (is_in_hub())
                {
                    scr_save_exp();
                    scr_save_time();
                    quest_save();
                    scr_save_unique_action();
                    scr_save_stat();
                    scr_save_player_status();
                    faction_save();
                    stash_save();
                    db_force_save("pre_raid");
                    
                    with (player_get_local())
                    {
                        skills.save();
                        skills_hunter.save("skills_hunter");
                    }
                    
                    mods_save_enabled_mods();
                }
                
                audio_pause_all();
                instance_deactivate_region(0, 0, room_width, room_height, true, false);
                instance_activate_object(obj_gamepad);
                instance_activate_object(obj_cursor);
                instance_activate_object(obj_sprite_downloader);
                instance_activate_object(obj_action_prompt);
                instance_activate_object(LootLocker);
                instance_activate_object(obj_mods);
                instance_activate_object(obj_news);
                var camx = camera_get_view_x(view_camera[0]);
                var camy = camera_get_view_y(view_camera[0]);
                camera_set_view_pos(view_camera[0], round(camx), round(camy));
                instance_create_depth(x, y, -10000, obj_main_menu);
            }
        }
    }
    
    obj_cursor.cursor_before_pause_x = obj_cursor.x;
    obj_cursor.cursor_before_pause_y = obj_cursor.y;
}

enum UnknownEnum
{
    Value_20 = 20
}

if (!keyboard_check_pressed(vk_escape))
{
    if (disattiva == true)
    {
        instance_deactivate_region(x - 480, y - 270, 960, 540, false, true);
        instance_activate_region(x - 480, y - 270, 960, 540, true);
        instance_activate_object(obj_gamepad);
        instance_activate_object(obj_cursor);
        instance_activate_object(obj_sprite_downloader);
        instance_activate_object(obj_action_prompt);
        instance_activate_object(obj_player_parent);
        instance_activate_object(LootLocker);
        instance_activate_object(obj_mods);
        instance_activate_object(obj_news);
        
        if (!instance_exists(obj_train))
            instance_activate_object(obj_train);
        
        if (!instance_exists(obj_map_generator))
            instance_activate_object(obj_map_generator);
        
        if (!instance_exists(obj_mouse))
            instance_activate_object(obj_mouse);
        
        if (!instance_exists(obj_sound_controller))
            instance_activate_object(obj_sound_controller);
        
        if (!instance_exists(obj_light_controller))
            instance_activate_object(obj_light_controller);
        
        if (!instance_exists(obj_meteo_controller))
            instance_activate_object(obj_meteo_controller);
        
        if (!instance_exists(obj_snow_draw))
            instance_activate_object(obj_snow_draw);
        
        if (!instance_exists(obj_minimap))
            instance_activate_object(obj_minimap);
        
        if (!instance_exists(obj_surface_aim))
            instance_activate_object(obj_surface_aim);
        
        if (!instance_exists(obj_shader_controller))
            instance_activate_object(obj_shader_controller);
        
        if (!instance_exists(obj_object_shadow))
            instance_activate_object(obj_object_shadow);
        
        if (!instance_exists(obj_camera))
            instance_activate_object(obj_camera);
        
        if (is_in_raid())
        {
            if (obj_map_generator.area == UnknownEnum.Value_4)
            {
                if (instance_exists(obj_faro))
                {
                    if (point_distance(x, y, obj_faro.x, obj_faro.y) < 270)
                    {
                        if (quest_is_active("clear_swamp"))
                            instance_activate_region(x - 480, y - 810, 960, 540, true);
                    }
                }
            }
        }
        
        if (player_all_dead())
            instance_deactivate_object(obj_npc_parent);
    }
    
    if (is_in_hub())
    {
        if (instance_exists(obj_camera))
        {
            if (obj_camera.follow != UnknownEnum.Value_3)
            {
                instance_deactivate_object(obj_solid);
                instance_deactivate_object(obj_light);
                instance_activate_region(x - 480, y - 270, 960, 540, true);
                instance_activate_object(obj_gamepad);
                instance_activate_object(obj_cursor);
                instance_activate_object(obj_player_parent);
                instance_activate_object(obj_mods);
                instance_activate_object(LootLocker);
                instance_activate_object(obj_news);
                
                if (!instance_exists(obj_mouse))
                    instance_activate_object(obj_mouse);
                
                if (!instance_exists(obj_sound_controller))
                    instance_activate_object(obj_sound_controller);
                
                if (!instance_exists(obj_light_controller))
                    instance_activate_object(obj_light_controller);
                
                if (!instance_exists(obj_snow_draw))
                    instance_activate_object(obj_snow_draw);
                
                if (!instance_exists(obj_meteo_controller))
                    instance_activate_object(obj_meteo_controller);
                
                if (!instance_exists(obj_minimap))
                    instance_activate_object(obj_minimap);
                
                if (!instance_exists(obj_surface_aim))
                    instance_activate_object(obj_surface_aim);
                
                if (!instance_exists(obj_shader_controller))
                    instance_activate_object(obj_shader_controller);
                
                if (!instance_exists(obj_object_shadow))
                    instance_activate_object(obj_object_shadow);
                
                if (!instance_exists(obj_camera))
                    instance_activate_object(obj_camera);
            }
        }
    }
}

alarm[4] = settings_get("low spec") ? 60 : 20;

enum UnknownEnum
{
    Value_3 = 3,
    Value_4
}

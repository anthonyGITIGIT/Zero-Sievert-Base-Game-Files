function class_player_weapon(arg0) constructor
{
    static func_destroy = function()
    {
    };
    
    static func_end_step = function()
    {
        if (!instance_exists(follow_id))
        {
            Destroy();
            exit;
        }
        
        if (!(instance_exists(follow_id) && instance_exists(obj_camera)))
            exit;
        
        if (obj_camera.follow != UnknownEnum.Value_5)
        {
            if (item_get_category(follow_id.arma_now) == "weapon")
            {
                sprite_index = item_get_sprite_ingame(follow_id.arma_now);
                image_yscale = 0.4;
                off_k = 5 / item_weapon_get_rate_of_fire(follow_id.arma_now);
                off_k = clamp(off_k, 1, 10);
                off_angle -= off_k;
                off_angle = clamp(off_angle, 0.5, 5);
                
                if (follow_id.image_xscale < 0)
                    image_xscale = -0.4;
                else
                    image_xscale = 0.4;
                
                if (image_xscale < 0)
                {
                    image_angle = (follow_id.weapon_pointing_direction + 180) - off_angle - off_angle_switching;
                    draw_before_follow = true;
                }
                else
                {
                    image_angle = follow_id.weapon_pointing_direction + off_angle + off_angle_switching;
                    draw_before_follow = false;
                }
                
                off_k = 2 / item_weapon_get_rate_of_fire(follow_id.arma_now);
                off_k = clamp(off_k, 0.25, 10);
                off_amount -= off_k;
                off_amount = clamp(off_amount, 0, 3);
                x = follow_id.x - lengthdir_x(off_amount, off_dir);
                y = follow_id.y + 5 + lengthdir_y(off_amount, off_dir);
            }
        }
        else
        {
            draw_before_follow = false;
            image_xscale = 0.4;
            x = follow_id.x;
            y = follow_id.y + 5;
            
            if (obj_camera.wl_state == UnknownEnum.Value_0 || obj_camera.wl_state == UnknownEnum.Value_2)
                image_angle = 0;
            
            if (obj_camera.wl_state == UnknownEnum.Value_1)
            {
                switch (pl_weap_state)
                {
                    case UnknownEnum.Value_0:
                        wl_timer++;
                        var _k = wl_timer / wl_timer_max1;
                        var _angle = lerp(0, wl_angle_max, power(_k, 1 - _k));
                        wl_off_x = lerp(0, wl_off_x_max, power(_k, 1 - _k));
                        wl_off_y = lerp(0, wl_off_y_max, power(_k, 1 - _k));
                        image_angle = _angle;
                        x = follow_id.x + wl_off_x;
                        y = (follow_id.y + 5) - wl_off_y;
                        
                        if (wl_timer >= wl_timer_max1)
                        {
                            wl_timer = 0;
                            pl_weap_state = UnknownEnum.Value_1;
                        }
                        
                        if (wl_timer >= (wl_timer_max1 * 0.15) && wl_timer < ((wl_timer_max1 * 0.15) + 2))
                        {
                            if (item_exists(follow_id.arma_now))
                            {
                                var _sound = item_weapon_get_sound_mag_out(follow_id.arma_now);
                                
                                if (!audio_is_playing(_sound))
                                    audio_play_sound(_sound, 15, false);
                            }
                        }
                        
                        break;
                    
                    case UnknownEnum.Value_1:
                        wl_timer++;
                        x = follow_id.x + wl_off_x;
                        y = (follow_id.y + 5) - wl_off_y;
                        
                        if (wl_timer >= wl_timer_max2)
                        {
                            wl_timer = 0;
                            pl_weap_state = UnknownEnum.Value_2;
                        }
                        
                        break;
                    
                    case UnknownEnum.Value_2:
                        wl_timer++;
                        var _k = wl_timer / wl_timer_max3;
                        var _angle = lerp(wl_angle_max, 0, power(_k, 1 - _k));
                        wl_off_x = lerp(wl_off_x_max, 0, power(_k, 1 - _k));
                        wl_off_y = lerp(wl_off_y_max, 0, power(_k, 1 - _k));
                        image_angle = _angle;
                        x = follow_id.x + wl_off_x;
                        y = (follow_id.y + 5) - wl_off_y;
                        
                        if (wl_timer >= wl_timer_max3)
                        {
                            wl_timer = 0;
                            pl_weap_state = UnknownEnum.Value_0;
                        }
                        
                        if (wl_timer >= (wl_timer_max3 * 0.7) && wl_timer < ((wl_timer_max3 * 0.7) + 2))
                        {
                            var _sound = item_weapon_get_sound_mag_in(follow_id.arma_now);
                            
                            if (!audio_is_playing(_sound))
                                audio_play_sound(_sound, 15, false);
                        }
                        
                        break;
                }
            }
        }
    };
    
    static func_draw = function()
    {
        if (player_state_is(follow_id.mp_index, scr_player_state_start, scr_player_state_free_camera))
            exit;
        
        if (!item_weapon_get_moddable(follow_id.arma_now))
        {
            var _sprite = item_get_sprite_ingame(follow_id.arma_now);
            outline_start(2, 0, _sprite);
            draw_sprite_ext(_sprite, 0, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
            outline_end();
        }
        else
        {
            var ox = sprite_get_xoffset(item_get_sprite_ingame(follow_id.arma_now));
            var oy = sprite_get_yoffset(item_get_sprite_ingame(follow_id.arma_now));
            var rx, ry;
            
            if (follow_id.image_xscale < 0)
            {
                rx = lengthdir_x(ox, image_angle) + lengthdir_y(oy, image_angle);
                ry = lengthdir_y(ox, image_angle) - lengthdir_x(oy, image_angle);
            }
            else
            {
                rx = lengthdir_x(-ox, image_angle) - lengthdir_y(-oy, image_angle);
                ry = lengthdir_y(-ox, image_angle) + lengthdir_x(-oy, image_angle);
            }
            
            var _mod_container = player_loadout_get_mod_container(follow_id, follow_id.weapon_slot_now);
            var _surface = surface_cache_fetch_weapon(follow_id.arma_now, _mod_container, true);
            draw_surface_ext(_surface, x + (0.4 * rx), y + (0.4 * ry), image_xscale, image_yscale, image_angle, c_white, 1);
        }
    };
    
    follow_id = arg0;
    draw_before_follow = false;
    is_visible = true;
    outline_init();
    image_index = 0;
    x = follow_id.x;
    y = follow_id.y + 5;
    image_xscale = 1;
    image_yscale = 1;
    image_angle = 0;
    off_amount = 0;
    off_dir = 0;
    off_k = 0.2;
    off_angle_switching = 0;
    off_angle = 0;
    wl_timer = 0;
    wl_timer_max1 = 50;
    wl_timer_max2 = 15;
    wl_timer_max3 = 55;
    wl_angle = 0;
    wl_angle_max = 20;
    wl_off_x = 0;
    wl_off_x_max = 4;
    wl_off_y = 0;
    wl_off_y_max = 3;
    pl_weap_state = UnknownEnum.Value_0;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_5 = 5
}

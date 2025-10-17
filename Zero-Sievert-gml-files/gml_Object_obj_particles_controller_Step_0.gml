player_follow_local();

if (player_exists_local())
{
    var o = obj_map_generator;
    depth = -15950;
    var camx = camera_get_view_x(view_camera[0]);
    var camy = camera_get_view_y(view_camera[0]);
    var cam_w = camera_get_view_width(view_camera[0]);
    var cam_h = camera_get_view_height(view_camera[0]);
    
    if (is_in_raid())
    {
        if (player_get_local_var("is_indoor", false))
        {
            if (obj_map_generator.area == UnknownEnum.Value_4)
            {
                var offset = 100;
                var a = UnknownEnum.Value_34;
                part_emitter_region(particles_system[a], partciles_emitter[a], camx - offset, camx + cam_w + offset, camy - offset, camy + cam_h + offset, 0, 0);
                
                if (scr_chance(50))
                    part_emitter_burst(particles_system[a], partciles_emitter[a], particles_type[a], particle_amount[a]);
            }
            
            if (obj_map_generator.area == UnknownEnum.Value_1 || obj_map_generator.area == UnknownEnum.Value_2 || obj_map_generator.area == UnknownEnum.Value_3 || obj_map_generator.area == UnknownEnum.Value_4 || obj_map_generator.area == UnknownEnum.Value_6)
            {
                if (player_exists_local() && player_get_local().y < o.map_height)
                {
                    var offset = 100;
                    var a = UnknownEnum.Value_36;
                    part_emitter_region(particles_system[a], partciles_emitter[a], camx, camx + cam_w + offset, camy - offset, camy + cam_h + offset, 0, 0);
                    
                    if (scr_chance(25))
                        part_emitter_burst(particles_system[a], partciles_emitter[a], particles_type[a], particle_amount[a]);
                }
            }
        }
    }
    
    if (!is_inside_bunker())
    {
        if (!player_get_local_var("is_indoor", false) && settings_get("fog rain"))
        {
            var _weather_now = weather_get_weather_now();
            camx = camera_get_view_x(view_camera[0]);
            camy = camera_get_view_y(view_camera[0]);
            cam_w = camera_get_view_width(view_camera[0]);
            cam_h = camera_get_view_height(view_camera[0]);
            
            for (var i = 0; i < array_length(global.weather_particle); i++)
            {
                var _part_amount = global.weather_particle[i].amount_to_create;
                
                if (_part_amount > 0)
                {
                    var _particle_enum_id = global.weather_particle[i].part_enum_id;
                    var _particle_offset = weather_get_particle_offset(_particle_enum_id);
                    
                    if (scr_chance(global.weather_particle[i].chance_to_create))
                    {
                        var _a = global.weather_particle[i].part_enum_id;
                        part_emitter_region(particles_system[_a], partciles_emitter[_a], camx + _particle_offset.left, camx + cam_w + _particle_offset.right, camy + _particle_offset.top, camy + _particle_offset.bottom, 0, 0);
                        part_emitter_burst(particles_system[_a], partciles_emitter[_a], particles_type[_a], _part_amount);
                    }
                }
            }
        }
    }
    
    if (is_in_raid())
    {
        if (!player_get_local_var("is_indoor", false))
        {
            if (global.state_emission_now > UnknownEnum.Value_7)
            {
                if (!audio_is_playing(snd_rumble_long))
                    audio_play_sound(snd_rumble_long, 19, false);
            }
            
            if (global.state_emission_now > UnknownEnum.Value_19)
            {
                if (!audio_is_playing(snd_wind_fast))
                    audio_play_sound(snd_wind_fast, 19, false);
            }
            
            if (global.state_emission_now == UnknownEnum.Value_1)
            {
                var offset = 60;
                var a = UnknownEnum.Value_47;
                part_emitter_region(particles_system[a], partciles_emitter[a], camx - offset, camx, camy - offset, camy + cam_h + offset, 0, 0);
                var _div = global.emission_timer_now / global.emission_timer[UnknownEnum.Value_1];
                var _chance = power(_div, 2) * 100;
                
                if (scr_chance(_chance))
                {
                    if (scr_chance(50))
                        part_emitter_burst(particles_system[a], partciles_emitter[a], particles_type[a], 1);
                }
                
                var _chance_sound = _div * 9;
                
                if (scr_chance(_chance_sound))
                {
                    var i = 0;
                    var _arr;
                    _arr[i] = snd_crow1;
                    i++;
                    _arr[i] = snd_crow2;
                    i++;
                    _arr[i] = snd_crow3;
                    i++;
                    _arr[i] = snd_crow4;
                    i++;
                    _arr[i] = snd_crow5;
                    i++;
                    
                    if (scr_chance(35))
                    {
                        _arr[i] = snd_bird_fly1;
                        i++;
                        _arr[i] = snd_bird_fly2;
                        i++;
                        _arr[i] = snd_bird_fly3;
                        i++;
                        _arr[i] = snd_bird_fly4;
                        i++;
                        _arr[i] = snd_bird_fly5;
                        i++;
                    }
                    
                    var _sound = _arr[irandom(array_length_1d(_arr) - 1)];
                    audio_play_sound(_sound, 14, false);
                }
            }
            
            switch (global.state_emission_now)
            {
                default:
                    break;
                
                case UnknownEnum.Value_3:
                    scr_get_emission_shader_value(true, 0, global.emission_shader_brightness_max, 0, global.emission_shader_contrast_max);
                    break;
                
                case UnknownEnum.Value_4:
                    scr_get_emission_shader_value(true, global.emission_shader_brightness_max, global.emission_shader_brightness_medium, global.emission_shader_contrast_max, global.emission_shader_contrast_low);
                    break;
                
                case UnknownEnum.Value_5:
                    scr_get_emission_shader_value(true, global.emission_shader_brightness_medium, global.emission_shader_brightness_max, global.emission_shader_contrast_low, global.emission_shader_contrast_medium);
                    break;
                
                case UnknownEnum.Value_6:
                    scr_get_emission_shader_value(true, global.emission_shader_brightness_max, global.emission_shader_brightness_low, global.emission_shader_contrast_medium, 0);
                    break;
                
                case UnknownEnum.Value_7:
                    break;
                
                case UnknownEnum.Value_8:
                    scr_get_emission_shader_value(true, 0, global.emission_shader_brightness_max, 0, global.emission_shader_contrast_medium);
                    break;
                
                case UnknownEnum.Value_9:
                    scr_get_emission_shader_value(true, global.emission_shader_brightness_max, 0, global.emission_shader_contrast_medium, 0);
                    break;
                
                case UnknownEnum.Value_10:
                    break;
                
                case UnknownEnum.Value_11:
                    scr_get_emission_shader_value(true, 0, global.emission_shader_brightness_max, 0, global.emission_shader_contrast_medium);
                    break;
                
                case UnknownEnum.Value_12:
                    scr_get_emission_shader_value(true, global.emission_shader_brightness_max, 0, global.emission_shader_contrast_medium, 0);
                    break;
                
                case UnknownEnum.Value_13:
                    break;
                
                case UnknownEnum.Value_14:
                    scr_get_emission_shader_value(true, 0, global.emission_shader_brightness_medium, 0, global.emission_shader_contrast_medium);
                    break;
                
                case UnknownEnum.Value_15:
                    scr_get_emission_shader_value(true, global.emission_shader_brightness_medium, 0, global.emission_shader_contrast_medium, 0);
                    break;
                
                case UnknownEnum.Value_16:
                    break;
                
                case UnknownEnum.Value_17:
                    scr_get_emission_shader_value(true, 0, -0.15, 0, global.emission_shader_contrast_low);
                    scr_get_emission_shader_color(true, 1, global.emission_shader_red_max, 1, global.emission_shader_green_max, 1, global.emission_shader_blue_max);
                    break;
                
                case UnknownEnum.Value_18:
                    var offset = 60;
                    var a = UnknownEnum.Value_48;
                    part_emitter_region(particles_system[a], partciles_emitter[a], camx - offset, camx, camy - offset, camy + cam_h + offset, 0, 0);
                    var _div = global.emission_timer_now / global.emission_timer[global.state_emission_now];
                    var _chance = _div * 100;
                    
                    if (scr_chance(_chance))
                        part_emitter_burst(particles_system[a], partciles_emitter[a], particles_type[a], 1);
                    
                    break;
                
                case UnknownEnum.Value_19:
                    var offset = 60;
                    var a = UnknownEnum.Value_48;
                    part_emitter_region(particles_system[a], partciles_emitter[a], camx - offset, camx, camy - offset, camy + cam_h + offset, 0, 0);
                    part_emitter_burst(particles_system[a], partciles_emitter[a], particles_type[a], 1);
                    
                    if (frac(global.emission_timer_now / 180) == 0)
                    {
                        var i = 0;
                        var _arr;
                        _arr[i] = snd_thunder_5;
                        i++;
                        _arr[i] = snd_thunder_6;
                        i++;
                        _arr[i] = snd_thunder_7;
                        i++;
                        _arr[i] = snd_thunder4;
                        i++;
                        _arr[i] = snd_thunder_emission;
                        i++;
                        var _sound = _arr[irandom(array_length_1d(_arr) - 1)];
                        audio_play_sound(_sound, 18, false);
                    }
                    
                    var _sweep = snd_sweep_long_1;
                    var _sweep_dur = round(audio_sound_length(_sweep) * 60);
                    
                    if ((global.emission_timer[global.state_emission_now] - global.emission_timer_now) == _sweep_dur)
                    {
                        if (!audio_is_playing(_sweep))
                            audio_play_sound(_sweep, 21, false);
                    }
                    
                    break;
                
                case UnknownEnum.Value_20:
                    var offset = 60;
                    var a = UnknownEnum.Value_48;
                    part_emitter_region(particles_system[a], partciles_emitter[a], camx - offset, camx, camy - offset, camy + cam_h + offset, 0, 0);
                    part_emitter_burst(particles_system[a], partciles_emitter[a], particles_type[a], 1);
                    global.emission_hitbox_timer_now++;
                    var _sweep = snd_sweep_long_1;
                    var _sweep_dur = round(audio_sound_length(_sweep) * 60);
                    
                    if (global.emission_hitbox_timer_now == (global.emission_hitbox_timer_max - _sweep_dur))
                        audio_play_sound(_sweep, 21, false);
                    
                    if (global.emission_hitbox_timer_now >= global.emission_hitbox_timer_max)
                    {
                        global.emission_hitbox_timer_now = 0;
                        global.emission_hitbox_timer_max = irandom_range(global.emission_hitbox_timer_def_min, global.emission_hitbox_timer_def_max);
                        audio_play_sound(snd_explosive_emp, 20, false);
                        a = UnknownEnum.Value_49;
                        
                        for (var i = 0; i < (270 + (offset * 2)); i += 35)
                            part_particles_create(particles_system[a], camx - offset, (camy - offset) + i, particles_type[a], 1);
                        
                        var _hitbox = instance_create_depth(camx - offset, camy - offset, -6000, obj_emission_hitbox);
                        _hitbox.hspd = 8;
                    }
                    
                    if (frac(global.emission_timer_now / 180) == 0)
                    {
                        var i = 0;
                        var _arr;
                        _arr[i] = snd_thunder_5;
                        i++;
                        _arr[i] = snd_thunder_6;
                        i++;
                        _arr[i] = snd_thunder_7;
                        i++;
                        _arr[i] = snd_thunder4;
                        i++;
                        _arr[i] = snd_thunder_emission;
                        i++;
                        var _sound = _arr[irandom(array_length_1d(_arr) - 1)];
                        audio_play_sound(_sound, 18, false);
                    }
                    
                    global.emission_make_npc_die = true;
                    break;
                
                case UnknownEnum.Value_21:
                    scr_get_emission_shader_value(true, -0.15, 0, global.emission_shader_contrast_low, 0);
                    scr_get_emission_shader_color(true, global.emission_shader_red_max, 1, global.emission_shader_green_max, 1, global.emission_shader_blue_max, 1);
                    break;
            }
        }
    }
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
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_34 = 34,
    Value_36 = 36,
    Value_47 = 47,
    Value_48,
    Value_49
}

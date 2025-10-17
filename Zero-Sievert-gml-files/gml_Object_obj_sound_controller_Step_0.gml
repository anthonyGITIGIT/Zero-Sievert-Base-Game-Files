player_follow_local();
audio_emitter_position(sound_emitter_wind, x, y, 0);
audio_emitter_position(sound_emitter_bird_stream, x, y, 0);

if (is_inside_bunker())
{
    if (!audio_is_playing(snd_bunker_loop1))
        audio_play_sound(snd_bunker_loop1, 2, false);
    
    if (scr_chance(0.5))
    {
        var drip = choose(snd_drip1, snd_drip2, snd_drip3, snd_drip4, snd_drip5);
        audio_play_sound(drip, 10, false);
    }
}

if (!is_inside_bunker())
{
    if (!instance_exists(obj_exit_screen))
    {
        if (is_in_raid())
        {
            if (obj_map_generator.area == UnknownEnum.Value_1 || obj_map_generator.area == UnknownEnum.Value_2 || obj_map_generator.area == UnknownEnum.Value_3 || obj_map_generator.area == UnknownEnum.Value_4)
            {
                if (y < obj_map_generator.map_height)
                {
                    if (!audio_is_playing(snd_forest_day_1))
                        audio_play_sound(snd_forest_day_1, 15, false);
                }
                else if (audio_is_playing(snd_forest_day_1))
                {
                    audio_stop_sound(snd_forest_day_1);
                }
            }
        }
        
        var _weather_now = weather_get_weather_now();
        var _rain_amount_1 = struct_get_from_hash(global.weather_data.type, variable_get_hash("rain_1")).particle[0].particle_amount;
        var _rain_amount_2 = struct_get_from_hash(global.weather_data.type, variable_get_hash("rain_2")).particle[0].particle_amount;
        var _rain_amount_3 = struct_get_from_hash(global.weather_data.type, variable_get_hash("rain_3")).particle[0].particle_amount;
        var _amount_now = 0;
        
        for (var i = 0; i < array_length(global.weather_particle); i++)
        {
            var _part_amount = global.weather_particle[i].amount_to_create;
            
            if (_part_amount > 0 && (global.weather_particle[i].part_enum_id == UnknownEnum.Value_3 || global.weather_particle[i].part_enum_id == UnknownEnum.Value_6))
            {
                if (_amount_now == 0)
                    _amount_now = global.weather_particle[i].amount_to_create;
            }
        }
        
        if (_amount_now > 0)
        {
            if (_amount_now <= _rain_amount_1)
            {
                if (!audio_is_playing(snd_rain_light))
                    audio_play_sound(snd_rain_light, 10, false);
                
                if (audio_is_playing(snd_rain_medium))
                    audio_stop_sound(snd_rain_medium);
                
                if (audio_is_playing(snd_rain_heavy))
                    audio_stop_sound(snd_rain_heavy);
            }
            else if (_amount_now > _rain_amount_1 && _amount_now <= _rain_amount_2)
            {
                if (audio_is_playing(snd_rain_light))
                    audio_stop_sound(snd_rain_light);
                
                if (!audio_is_playing(snd_rain_medium))
                    audio_play_sound(snd_rain_medium, 10, false);
                
                if (audio_is_playing(snd_rain_heavy))
                    audio_stop_sound(snd_rain_heavy);
                
                counter_thunder++;
                
                if (counter_thunder >= counter_thunder_max)
                {
                    if (scr_chance(0.5))
                    {
                        var thunder_ = choose(snd_thunder1, snd_thunder2, snd_thunder3, snd_thunder4);
                        audio_play_sound(thunder_, 10, false);
                        counter_thunder = 0;
                    }
                }
            }
            else if (_amount_now > _rain_amount_2 && _amount_now <= _rain_amount_3)
            {
                if (audio_is_playing(snd_rain_light))
                    audio_stop_sound(snd_rain_light);
                
                if (audio_is_playing(snd_rain_medium))
                    audio_stop_sound(snd_rain_medium);
                
                if (!audio_is_playing(snd_rain_heavy))
                    audio_play_sound(snd_rain_heavy, 10, false);
                
                counter_thunder++;
                
                if (counter_thunder >= counter_thunder_max)
                {
                    if (scr_chance(40))
                    {
                        var thunder_ = choose(snd_thunder1, snd_thunder2, snd_thunder3, snd_thunder4, snd_thunder_5, snd_thunder_8, snd_thunder_8);
                        audio_play_sound(thunder_, 10, false);
                        counter_thunder = 0;
                    }
                }
            }
        }
        else
        {
            if (audio_is_playing(snd_rain_light))
                audio_stop_sound(snd_rain_light);
            
            if (audio_is_playing(snd_rain_medium))
                audio_stop_sound(snd_rain_medium);
            
            if (audio_is_playing(snd_rain_heavy))
                audio_stop_sound(snd_rain_heavy);
        }
        
        var _wind_index = weather_get_wind_index();
        var _sound_speed = weather_get_wind_speed(_wind_index);
        var _sound = -1;
        
        if (_sound_speed > 0.5)
            _sound = snd_wind_slow;
        
        if (_sound_speed > 1)
            _sound = snd_wind_fast;
        
        if (_sound_speed > 2)
            _sound = snd_wind_storm;
        
        if (_weather_now == "snow_2")
            _sound = snd_wind_fast;
        
        if (_weather_now == "snow_3")
            _sound = snd_wind_heavy_snow;
        
        if (_sound == -1)
        {
            if (audio_exists(sound_wind_now) && audio_is_playing(sound_wind_now))
                audio_stop_sound(sound_wind_now);
        }
        else if (_sound != sound_wind_now)
        {
            audio_stop_sound(sound_wind_now);
            sound_wind_now = _sound;
            audio_play_sound(sound_wind_now, 15, false);
        }
        else if (!audio_is_playing(sound_wind_now))
        {
            audio_play_sound(sound_wind_now, 15, false);
        }
        
        if (global.quest_outer_deity_sound == true)
        {
            if (!audio_is_playing(snd_cristallo_viola))
                audio_play_sound(snd_cristallo_viola, 1, false);
        }
        else if (audio_is_playing(snd_cristallo_viola) && !quest_is_active("the_crystal"))
        {
            audio_stop_sound(snd_cristallo_viola);
        }
    }
}
else
{
    if (audio_is_playing(snd_rain_light))
        audio_stop_sound(snd_rain_light);
    
    if (audio_is_playing(snd_rain_medium))
        audio_stop_sound(snd_rain_medium);
    
    if (audio_is_playing(snd_rain_heavy))
        audio_stop_sound(snd_rain_heavy);
}

enum UnknownEnum
{
    Value_1 = 1,
    Value_2,
    Value_3,
    Value_4,
    Value_6 = 6
}

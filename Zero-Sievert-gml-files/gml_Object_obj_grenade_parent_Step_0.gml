depth = -y - 20 - (4 * scale_now);
detonation_point = clamp(detonation_point, throw_min, throw_max);
audio_emitter_position(emitter_land, x, y, 0);

if (throw_type != "GRENADE_throw_no_move")
{
    if (audio_played == false)
    {
        if (distance_travelled >= ((bouncing[0].point - 0.1) * detonation_point))
        {
            audio_played = true;
            audio_play_sound_on(emitter_land, snd_grenade_land_1, false, 16, 1, 0, random_range(0.9, 1.1));
        }
    }
}

if (throw_type == "GRENADE_throw_no_bounce" && distance_travelled >= detonation_point)
    explode = true;

if (throw_type != "GRENADE_throw_no_move" && distance_travelled < detonation_point)
{
    if (vector_calculated == false)
    {
        vector_calculated = true;
        hspd = lengthdir_x(throw_speed, throw_direction);
        vspd = lengthdir_y(throw_speed, throw_direction);
    }
    
    var amount_ = 10;
    var _dir_before = point_direction(xprevious, yprevious, x, y);
    var _wall_bounce = false;
    var _collision_prop = false;
    var _amount_x = 0;
    var _amount_y = 0;
    
    if (hspd != 0)
    {
        var time_ = current_time;
        var _solid = instance_place(x + hspd, y, obj_solid);
        var _coll = false;
        
        if (_solid != -4)
        {
            if (_solid.object_index == obj_solid)
            {
                if (_solid.my_height >= 18)
                    _coll = true;
            }
            else if (obj_controller.decor_height[_solid.decor_id] >= 18)
            {
                _coll = true;
            }
            else
            {
                _collision_prop = true;
            }
            
            if (_coll == true)
            {
                direction_image_angle = -direction_image_angle;
                
                while (!place_meeting(x + sign(hspd), y, _solid))
                {
                    x += sign(hspd);
                    
                    if (current_time > (time_ + amount_))
                        break;
                    
                    detonation_point += min_wall_bounce;
                    _wall_bounce = true;
                }
                
                if (throw_type == "GRENADE_throw_no_bounce")
                {
                    explode = true;
                }
                else
                {
                    _amount_x = hspd;
                    vspd *= 2;
                    vspd = clamp(vspd, -throw_speed, throw_speed);
                    hspd = -hspd / 2;
                }
            }
        }
    }
    
    if (vspd != 0)
    {
        var time_ = current_time;
        var _solid = instance_place(x, y + vspd, obj_solid);
        var _coll = false;
        
        if (_solid != -4)
        {
            if (_solid.object_index == obj_solid)
            {
                if (_solid.my_height >= 18)
                    _coll = true;
            }
            else if (obj_controller.decor_height[_solid.decor_id] >= 18)
            {
                _coll = true;
            }
            else
            {
                _collision_prop = true;
            }
            
            if (_coll == true)
            {
                direction_image_angle = -direction_image_angle;
                
                while (!place_meeting(x, y + sign(vspd), _solid))
                {
                    y += sign(vspd);
                    
                    if (current_time > (time_ + amount_))
                        break;
                    
                    detonation_point += min_wall_bounce;
                    _wall_bounce = true;
                }
                
                if (throw_type == "GRENADE_throw_no_bounce")
                {
                    explode = true;
                }
                else
                {
                    _amount_y = vspd;
                    hspd *= 2;
                    hspd = clamp(hspd, -throw_speed, throw_speed);
                    vspd = -vspd / 2;
                }
            }
        }
    }
    
    var _dir = point_direction(x, y, x + hspd, y + vspd);
    var _vector = sqrt((hspd * hspd) + (vspd * vspd));
    x += hspd;
    y += vspd;
    distance_travelled += _vector;
    image_angle += (direction_image_angle * image_angle_amount);
    
    if (distance_travelled < (detonation_point / 2))
        scale_now = lerp(1, scale_max, distance_travelled / (detonation_point / 2));
    else
        scale_now = lerp(scale_max, 1, (distance_travelled - (detonation_point / 2)) / (detonation_point / 2));
    
    scale_now = clamp(scale_now, 1, scale_max);
    
    if (_collision_prop)
    {
        if ((distance_travelled / detonation_point) > 0.9)
            detonation_point += _vector;
    }
}

if (throw_type != "GRENADE_throw_no_move")
{
    if (fuse_time_now < fuse_time)
    {
        fuse_time_now++;
    }
    else
    {
        fuse_time_now = fuse_time;
        explode = true;
    }
}

if (throw_type == "GRENADE_throw_no_move")
{
    if (fuse_time_now < fuse_time)
    {
        fuse_time_now++;
    }
    else
    {
        fuse_time_now = fuse_time;
        can_explode = true;
        image_index = 1;
    }
    
    if (can_explode)
    {
        if (place_meeting(x, y, obj_npc_parent) || place_meeting(x, y, obj_player_parent))
            explode = true;
    }
}

if (explode)
{
    var _array_collision = scr_grenade_get_instances(radius_min_damage);
    
    if (array_length(_array_collision) > 0)
    {
        for (var i = 0; i < array_length(_array_collision); i++)
        {
            var _struct = _array_collision[i];
            var _id = _struct.id;
            var _dis = _struct.distance;
            var _is_player = _struct.is_player;
            
            switch (detonation_type)
            {
                case "GRENADE_detonation_explosion":
                    var _damage = damage_max;
                    
                    if (_dis > radius_max_damage)
                        _damage = lerp(damage_max, damage_min, (_dis - radius_max_damage) / (radius_min_damage - radius_max_damage));
                    
                    if (instance_exists(_id) && _is_player == false)
                    {
                        _id.hp -= _damage;
                        
                        if (thrown_by_player == true)
                        {
                            if (_id.faction != "Player")
                            {
                                var _amount = variable_struct_get(global.struct_faction, _id.faction).rep_hit;
                                faction_add_rep(_id.faction, "Player", _amount);
                                faction_set_rep_temp("Player", _id.faction, 0);
                                _id.target = player_get_local();
                            }
                            
                            if (_id.hp <= 0)
                            {
                                kill_check_quest(_id.npc_id);
                                kill_add_stat(_id.object_index);
                                var _amount = variable_struct_get(global.struct_faction, _id.faction).rep_hit;
                                faction_add_rep(_id.faction, "Player", _amount);
                            }
                        }
                    }
                    
                    if (_is_player)
                    {
                        player_damage_local(_damage);
                        var _dur = player_loadout_get_durability(player_get_local(), "armor slot");
                        var _new_dur = _dur - 20;
                        player_loadout_set_durability("armor slot", _new_dur);
                        audio_play_sound(snd_grenade_ear_ringing, 20, false);
                    }
                    
                    break;
                
                case "GRENADE_detonation_flash":
                    if (_is_player)
                    {
                        if (detonation_done == false)
                        {
                            audio_play_sound(snd_grenade_ear_ringing, 20, false);
                            var _dir_player_mouse = point_direction(_id.x, _id.y, obj_cursor.aa_x, obj_cursor.aa_y);
                            var _dir_grenade_player = point_direction(_id.x, _id.y, x, y);
                            var _time = 540;
                            
                            if (_dis > radius_max_damage)
                                _time = lerp(540, 0, (_dis - radius_max_damage) / (radius_min_damage - radius_max_damage));
                            
                            if (abs(angle_difference(_dir_grenade_player, _dir_player_mouse)) > 90)
                                _time += 0.5;
                            
                            var _obj_hud_flash = instance_create_depth(x, y, 0, obj_hud_effect_flash);
                            _obj_hud_flash.alarm[0] = _time;
                        }
                    }
                    else
                    {
                        var _chance = npc_get_prob_grenade_immune_flash(_id.npc_id);
                        
                        if (!scr_chance(_chance))
                            _id.grenade_flash = true;
                    }
                    
                    break;
            }
        }
    }
    
    if (detonation_done == false)
    {
        detonation_done = true;
        
        switch (detonation_type)
        {
            case "GRENADE_detonation_explosion":
                if (grenade_id != "grenade_christmas")
                    instance_create_depth(x, y, 0, obj_grenade_effect_explosion);
                else
                    instance_create_depth(x, y, 0, obj_grenade_effect_explosion_christmas);
                
                break;
            
            case "GRENADE_detonation_flash":
                instance_create_depth(x, y, 0, obj_grenade_effect_flash);
                instance_create_depth(x, y, 0, obj_light_flashbang);
                break;
            
            case "GRENADE_detonation_smoke":
                var _effect = instance_create_depth(x, y, 0, obj_grenade_effect_smoke);
                _effect.alarm[0] = detonation_duration;
                break;
        }
    }
    
    if (detonation_duration_now >= detonation_duration)
        instance_destroy();
    
    detonation_duration_now++;
}

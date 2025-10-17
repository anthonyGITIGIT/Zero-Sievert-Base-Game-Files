function scr_shoot(arg0, arg1, arg2, arg3)
{
    var shoot_dir = arg0;
    var bullet_target = arg1;
    var bullet_damage = arg2;
    var precisione = arg3;
    var _ammo_id;
    
    if (object_is_player(object_index))
        _ammo_id = player_loadout_get_ammo_item(self, weapon_slot_now);
    else
        _ammo_id = ammo_id_now;
    
    if (!item_exists(_ammo_id))
    {
        if (object_is_player(object_index))
            player_loadout_set_ammo_item(weapon_slot_now, item_weapon_get_ammo(arma_now));
    }
    
    var _quanti_bullet = item_ammo_get_number(_ammo_id);
    
    if (_quanti_bullet <= 0)
        _quanti_bullet = 1;
    
    var _pen = item_ammo_get_pen(_ammo_id);
    bullet_damage *= ((100 + item_ammo_get_damage(_ammo_id)) / 100);
    precisione *= ((100 - item_ammo_get_acc(_ammo_id)) / 100);
    var _prec_to_offset = precisione;
    weapon_pointing_direction = shoot_dir;
    var arma_sound_ = item_weapon_get_sound(arma_now);
    var _player_has_silencer = false;
    
    if (object_is_player(object_index))
    {
        _player_has_silencer = item_weapon_get_modded_silenced(arma_now, player_loadout_get_mod_container(self, weapon_slot_now));
        
        if (_player_has_silencer)
            arma_sound_ = item_mod_get_silencer_sound(player_loadout_get_mod(self, weapon_slot_now, "brake"));
    }
    else if (item_weapon_get_modded_silenced(arma_now, mod_container))
    {
        arma_sound_ = item_mod_get_silencer_sound(loot_mod_cont_get(mod_container, "brake"));
    }
    
    var _pitch = random_range(0.95, 1.05);
    audio_play_sound_on(emitter_shoot, arma_sound_, false, 10, 1, 0, _pitch);
    scr_spawn_shell();
    var _skill_improvised_sniper_range_max_multiplier = 1;
    
    if (object_is_player(object_index) && skill_active("improvised_sniper") && hovering_enemy_frames >= global.skills_data.improvised_sniper.value_2)
        _skill_improvised_sniper_range_max_multiplier = global.skills_data.improvised_sniper.value_1;
    
    var bullet_spawn_x, bullet_spawn_y, bull;
    
    if (_quanti_bullet == 1)
    {
        var offset = random_range(-_prec_to_offset, _prec_to_offset);
        
        if (object_is_player(object_index))
            offset = scr_gauss(0, _prec_to_offset / 2);
        
        var dir = shoot_dir + offset;
        var sprite_weapon = item_get_sprite_ingame(arma_now);
        var off_dir;
        
        if (image_xscale == 1)
            off_dir = 90;
        else
            off_dir = -90;
        
        var weapon_sprite_w = sprite_get_width(sprite_weapon) * 0.4;
        var diffx = weapon_sprite_w - (sprite_get_xoffset(sprite_weapon) * 0.4);
        bullet_spawn_x = x + lengthdir_x(diffx, weapon_pointing_direction) + lengthdir_x(2, weapon_pointing_direction + off_dir);
        bullet_spawn_y = y + lengthdir_y(diffx, weapon_pointing_direction) + lengthdir_y(2, weapon_pointing_direction + off_dir) + 5;
        laser_startx = bullet_spawn_x;
        laser_starty = bullet_spawn_y;
        var _new_location = bullet_find_spawn_location(bullet_spawn_x, bullet_spawn_y);
        bullet_spawn_x = _new_location.x;
        bullet_spawn_y = _new_location.y;
        var muzzle = instance_create_depth(bullet_spawn_x, bullet_spawn_y, -y - 10, obj_muzzle_fire);
        muzzle.image_angle = weapon_pointing_direction;
        var scope = false;
        
        if (object_is_player(object_index))
        {
            if (player_get_local_var("aiming", false))
            {
                if (instance_exists(obj_surface_aim))
                {
                    var enemy_scoped = instance_position(obj_surface_aim.x, obj_surface_aim.y, obj_npc_parent);
                    
                    if (enemy_scoped)
                    {
                        if (instance_line_of_sight(x, y, enemy_scoped))
                            scope = true;
                    }
                }
            }
        }
        
        if (scope == false)
        {
            bull = instance_create_depth(bullet_spawn_x, bullet_spawn_y, -y, item_weapon_get_bullet_obj(arma_now));
            bull.direction = dir;
            bull.image_angle = dir;
            bull.hspd = lengthdir_x(item_weapon_get_bullet_speed(arma_now), dir);
            bull.vspd = lengthdir_y(item_weapon_get_bullet_speed(arma_now), dir);
            bull.damage = bullet_damage;
            bull.timer = item_weapon_get_damage(arma_now) / 5;
            bull.shooter_faction = faction;
            bull.shooter_id = id;
            bull.penetration = _pen;
            bull.fin_x = obj_cursor.aa_x;
            bull.fin_y = obj_cursor.aa_y;
            bull.weapon_used = arma_now;
            bull.ammo_id_used = _ammo_id;
            bull.skill_improvised_sniper_range_max_multiplier = _skill_improvised_sniper_range_max_multiplier;
            
            if (!object_is_player(object_index))
            {
                bull.shooter_npc_name = npc_name;
                bull.npc_id = npc_id;
            }
            
            bullet_spawn_add_data(bull);
        }
        else
        {
            var enemy_scoped = instance_position(obj_surface_aim.x, obj_surface_aim.y, obj_npc_parent);
            bull = instance_create_depth(enemy_scoped.x, enemy_scoped.y, -y, item_weapon_get_bullet_obj(arma_now));
            bull.direction = dir;
            bull.image_angle = dir;
            bull.hspd = lengthdir_x(item_weapon_get_bullet_speed(arma_now), dir);
            bull.vspd = lengthdir_y(item_weapon_get_bullet_speed(arma_now), dir);
            bull.damage = bullet_damage;
            bull.timer = item_weapon_get_damage(arma_now) / 5;
            bull.shooter_faction = faction;
            bull.shooter_id = id;
            bull.penetration = _pen;
            bull.fin_x = obj_cursor.aa_x;
            bull.fin_y = obj_cursor.aa_y;
            bull.weapon_used = arma_now;
            bull.ammo_id_used = _ammo_id;
            bull.scoped = true;
            bull.skill_improvised_sniper_range_max_multiplier = _skill_improvised_sniper_range_max_multiplier;
            
            if (!object_is_player(object_index))
            {
                bull.shooter_npc_name = npc_name;
                bull.npc_id = npc_id;
            }
            
            bullet_spawn_add_data(bull);
        }
    }
    else if (_quanti_bullet > 1)
    {
        var sprite_weapon = item_get_sprite_ingame(arma_now);
        var off_dir;
        
        if (image_xscale == 1)
            off_dir = 90;
        else
            off_dir = -90;
        
        var weapon_sprite_w = sprite_get_width(sprite_weapon) * 0.4;
        var diffx = weapon_sprite_w - (sprite_get_xoffset(sprite_weapon) * 0.4);
        bullet_spawn_x = x + lengthdir_x(diffx, weapon_pointing_direction) + lengthdir_x(2, weapon_pointing_direction + off_dir);
        bullet_spawn_y = y + lengthdir_y(diffx, weapon_pointing_direction) + lengthdir_y(2, weapon_pointing_direction + off_dir) + 5;
        laser_startx = bullet_spawn_x;
        laser_starty = bullet_spawn_y;
        var _new_location = bullet_find_spawn_location(bullet_spawn_x, bullet_spawn_y);
        bullet_spawn_x = _new_location.x;
        bullet_spawn_y = _new_location.y;
        var muzzle = instance_create_depth(bullet_spawn_x, bullet_spawn_y, -y - 10, obj_muzzle_fire);
        muzzle.image_angle = weapon_pointing_direction;
        
        for (var i = 1; i <= _quanti_bullet; i++)
        {
            var offset = ((_prec_to_offset * 2) / _quanti_bullet) * i;
            var dir = (shoot_dir - _prec_to_offset) + offset;
            sprite_weapon = item_get_sprite_ingame(arma_now);
            
            if (image_xscale == 1)
                off_dir = 90;
            else
                off_dir = -90;
            
            laser_startx = bullet_spawn_x;
            laser_starty = bullet_spawn_y;
            bull = instance_create_depth(bullet_spawn_x, bullet_spawn_y, -y, item_weapon_get_bullet_obj(arma_now));
            bull.direction = dir;
            bull.image_angle = dir;
            bull.hspd = lengthdir_x(item_weapon_get_bullet_speed(arma_now), dir);
            bull.vspd = lengthdir_y(item_weapon_get_bullet_speed(arma_now), dir);
            bull.damage = bullet_damage / _quanti_bullet;
            bull.timer = item_weapon_get_damage(arma_now) / 5;
            bull.shooter_faction = faction;
            bull.shooter_id = id;
            bull.penetration = _pen;
            bull.fin_x = obj_cursor.aa_x;
            bull.fin_y = obj_cursor.aa_y;
            bull.weapon_used = arma_now;
            bull.n_bullet = _quanti_bullet;
            bull.ammo_id_used = _ammo_id;
            bull.skill_improvised_sniper_range_max_multiplier = _skill_improvised_sniper_range_max_multiplier;
            
            if (!object_is_player(object_index))
            {
                bull.shooter_npc_name = npc_name;
                bull.npc_id = npc_id;
            }
            
            bullet_spawn_add_data(bull);
        }
    }
    else
    {
        trace("Gun fired with a bullet quantity of 0 or less, see scr_shoot()");
        bullet_spawn_x = x;
        bullet_spawn_y = y;
    }
    
    var lx = bullet_spawn_x + lengthdir_x(5, weapon_pointing_direction);
    var ly = bullet_spawn_y + lengthdir_y(5, weapon_pointing_direction);
    var l = instance_create_depth(lx, ly, -y, obj_light);
    l.light_id = "weapon_shoot";
    
    if (image_alpha > 0.1)
    {
        var p = obj_particles_controller;
        var _a = UnknownEnum.Value_44;
        var _amount = round(clamp(bullet_damage / 5, 3, 8));
        
        repeat (_amount)
        {
            lx = bullet_spawn_x + lengthdir_x(irandom_range(-5, 1), weapon_pointing_direction);
            ly = bullet_spawn_y + lengthdir_y(irandom_range(-5, 1), weapon_pointing_direction);
            part_particles_create(p.particles_system[_a], lx, ly, p.particles_type[_a], 1);
        }
    }
    
    var d = 0;
    var a = UnknownEnum.Value_30;
    var c = obj_particles_controller;
    var angle = 30;
    part_type_orientation(c.particles_type[a], shoot_dir - angle, shoot_dir + angle, 0, 0, 0);
    part_type_direction(c.particles_type[a], shoot_dir - angle, shoot_dir + angle, 0, 0);
    part_emitter_region(c.particles_system[a], c.partciles_emitter[a], bullet_spawn_x - d, bullet_spawn_x + d, bullet_spawn_y - d, bullet_spawn_y + d, 1, 1);
    part_emitter_burst(c.particles_system[a], c.partciles_emitter[a], c.particles_type[a], 5);
    var _id = id;
    var _faction = faction;
    var _x = x;
    var _y = y;
    
    if (!_player_has_silencer)
    {
        with (obj_npc_parent)
        {
            if (_id != id && _faction != faction && target == _id && target_relation != UnknownEnum.Value_2 && point_distance(x, y, other.x, other.y) < 300)
            {
                last_seen_delay_x = _x;
                last_seen_delay_y = _y;
                last_seen_delay = true;
                
                if (!instance_line_of_sight(x, y, other))
                    hear_target_shoot = true;
            }
        }
    }
    
    var _struct = struct_get_from_hash(item_get_struct(arma_now), variable_get_hash("weapon"));
    
    if (variable_struct_exists(_struct, "scripts"))
    {
        var _scripts = struct_get_from_hash(_struct, variable_get_hash("scripts"));
        
        if (variable_struct_exists(_scripts, "bullet_spawn"))
            struct_get_from_hash(_scripts, variable_get_hash("bullet_spawn"))(bull);
        
        if (variable_struct_exists(_scripts, "weapon_fire"))
            struct_get_from_hash(_scripts, variable_get_hash("weapon_fire"))(id);
    }
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_30 = 30,
    Value_44 = 44
}

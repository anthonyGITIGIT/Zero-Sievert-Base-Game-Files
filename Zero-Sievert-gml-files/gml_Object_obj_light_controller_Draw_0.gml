var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);

if (!surface_exists(surface_light))
    surface_light = surface_create(480, 270);

var darkness_tot = darkness_now;
var c_surf = color_surface;

if (darkness_tot > 0 && c_surf == ciclo_color[UnknownEnum.Value_1])
    c_surf = ciclo_color[UnknownEnum.Value_3];

if (is_in_hub())
{
    if (is_inside_bunker())
    {
        darkness_tot = 0.7;
        c_surf = 0;
    }
    else
    {
        darkness_tot = darkness_now;
    }
}

if (is_in_raid() || room == test_room)
{
    if (is_in_raid())
    {
        var o = obj_map_generator;
        
        if (player_exists_local() && player_get_local().y > o.map_height)
        {
            var px = player_get_local().x div 16;
            var py = player_get_local().y div 16;
            var dark_light = ds_grid_get(o.grid_light_indoor, px, py);
            
            switch (dark_light)
            {
                case UnknownEnum.Value_0:
                    darkness_tot = darkness_max;
                    c_surf = ciclo_color[UnknownEnum.Value_3];
                    break;
                
                case UnknownEnum.Value_1:
                    c_surf = ciclo_color[UnknownEnum.Value_3];
                    break;
                
                case UnknownEnum.Value_2:
                    darkness_tot += ((1 - darkness_tot) / 2);
                    c_surf = ciclo_color[UnknownEnum.Value_3];
                    break;
                
                case UnknownEnum.Value_3:
                    darkness_tot = 0;
                    c_surf = ciclo_color[UnknownEnum.Value_3];
                    break;
            }
        }
    }
}

if (player_exists_local() && global.night_vision)
{
    if (item_exists(player_get_local().headset_now))
    {
        var _headset_id = player_get_local().headset_now;
        
        if (item_headset_get_type(_headset_id) == "night_vision")
        {
            var _c_nvg = 16777215;
            darkness_tot = 1;
        }
    }
}

if (skill_hunter_obtained("nightowl"))
    darkness_tot *= struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("nightowl")), variable_get_hash("nighttime_reduction"));

darkness_tot = clamp(darkness_tot, 0, 1);
var alpha_surf = darkness_tot;
surface_set_target(surface_light);
draw_clear_alpha(c_surf, alpha_surf);
gpu_set_blendmode(bm_subtract);

with (obj_light)
{
    var _use_scale = scale;
    var _use_alpha = alpha_togliere;
    
    if (skill_hunter_obtained("nightowl") && light_sprite == s_glow_general)
    {
        _use_scale = struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("nightowl")), variable_get_hash("vision_scale"));
        _use_alpha = struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("nightowl")), variable_get_hash("vision_alpha"));
    }
    
    draw_sprite_ext(light_sprite, 0, x - camx, y - camy, _use_scale, _use_scale, light_direction, c_black, _use_alpha);
}

var _torch_mod_pos_array = ["att_1", "att_2", "att_3", "att_4"];

with (player_get_local())
{
    var _torch_container = torch_container_array[weapon_slot_now];
    var _i = 0;
    
    repeat (array_length(_torch_mod_pos_array))
    {
        var _mod_pos = _torch_mod_pos_array[_i];
        var _torch_struct = variable_struct_get(_torch_container.data, _mod_pos);
        
        if (_torch_struct.have && _torch_struct.on)
        {
            var _x = _torch_struct.x;
            var _y = _torch_struct.y;
            var _mod = _torch_struct.mod_id;
            var _sprite = item_mod_get_torch_sprite(_mod);
            var _scale = item_mod_get_torch_scale(_mod);
            var _angle = weapon_pointing_direction;
            var _alpha = item_mod_get_torch_alpha_togliere(_mod);
            draw_sprite_ext(_sprite, 0, (x + _x) - camx, (y + _y) - camy, _scale, _scale, _angle, c_black, _alpha);
        }
        
        _i++;
    }
}

if (player_exists_local() && global.night_vision)
{
    var _alpha = 0.6;
    var _scale = 1;
    
    if (skill_hunter_obtained("nightowl"))
    {
        _alpha = struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("nightowl")), variable_get_hash("nightvision_alpha"));
        _scale = struct_get_from_hash(struct_get_from_hash(global.skills_hunter_data, variable_get_hash("nightowl")), variable_get_hash("nightvision_scale"));
    }
    
    draw_sprite_ext(s_glow_nvg_ext, 0, player_get_local().x - camx, player_get_local().y - camy, _scale, _scale, 0, c_white, _alpha);
    var _follow_x = mouse_x;
    var _follow_y = mouse_y;
    
    if (player_get_local_var("aiming", false))
    {
        _follow_x = obj_surface_aim.x;
        _follow_y = obj_surface_aim.y;
    }
    
    draw_sprite_ext(s_glow_nvg_int, 0, _follow_x - camx, _follow_y - camy, 1, 1, 0, c_white, 0.7);
}

gpu_set_blendmode(bm_normal);

if (darkness_tot > 0)
{
    with (obj_light)
    {
        var _c = light_color;
        var _a = alpha_mettere;
        
        if (global.night_vision == true)
        {
            _c = 16777215;
            _a = 0.95;
        }
        
        draw_sprite_ext(light_sprite, 0, x - camx, y - camy, scale, scale, light_direction, _c, _a);
    }
    
    with (player_get_local())
    {
        var _torch_container = torch_container_array[weapon_slot_now];
        var _i = 0;
        
        repeat (array_length(_torch_mod_pos_array))
        {
            var _mod_pos = _torch_mod_pos_array[_i];
            var _torch_struct = variable_struct_get(_torch_container.data, _mod_pos);
            
            if (_torch_struct.have && _torch_struct.on)
            {
                var _x = _torch_struct.x;
                var _y = _torch_struct.y;
                var _mod = _torch_struct.mod_id;
                var _sprite = item_mod_get_torch_sprite(_mod);
                var _scale = item_mod_get_torch_scale(_mod);
                var _angle = weapon_pointing_direction;
                var _color = item_mod_get_torch_color(_mod);
                var _alpha = item_mod_get_torch_alpha_mettere(_mod);
                
                if (global.night_vision)
                {
                    _color = 16777215;
                    _alpha = 0.95;
                }
                
                draw_sprite_ext(_sprite, 0, (x + _x) - camx, (y + _y) - camy, _scale, _scale, _angle, _color, _alpha);
            }
            
            _i++;
        }
    }
}

if (player_exists_local() && global.night_vision)
{
    gpu_set_blendmode(bm_subtract);
    draw_sprite_ext(s_glow_nvg_ext, 0, player_get_local().x - camx, player_get_local().y - camy, 1, 1, 0, c_white, 0.4);
    var _follow_x = obj_cursor.aa_x;
    var _follow_y = obj_cursor.aa_y;
    
    if (player_get_local_var("aiming", false))
    {
        _follow_x = obj_surface_aim.x;
        _follow_y = obj_surface_aim.y;
    }
    
    draw_sprite_ext(s_glow_nvg_int, 0, _follow_x - camx, _follow_y - camy, 1, 1, 0, c_white, 0.4);
    gpu_set_blendmode(bm_normal);
}

draw_set_alpha(1);

if (!global.night_vision)
{
    with (player_get_local())
    {
        if (is_undefined(arms_holder))
        {
            var _laser_container = laser_container_array[weapon_slot_now];
            var _i = 0;
            
            repeat (array_length(_torch_mod_pos_array))
            {
                var _mod_pos = _torch_mod_pos_array[_i];
                var _laser_struct = variable_struct_get(laser_container_array[weapon_slot_now].data, _mod_pos);
                
                if (_laser_struct.on)
                {
                    var dir;
                    
                    if (image_xscale < 0)
                        dir = weapon_holder.image_angle + 180;
                    else
                        dir = weapon_holder.image_angle;
                    
                    var _color = _laser_struct.color;
                    var start_x = x + _laser_struct.x;
                    var start_y = y + _laser_struct.y;
                    var temp_x = start_x;
                    var temp_y = start_y;
                    var xp = start_x;
                    var yp = start_y;
                    var collision = position_meeting(temp_x, temp_y, obj_solid);
                    
                    while (!collision && distance_to_point(temp_x, temp_y) < 420)
                    {
                        xp = temp_x;
                        yp = temp_y;
                        temp_x += lengthdir_x(4, dir);
                        temp_y += lengthdir_y(4, dir);
                        var collision1 = position_meeting(temp_x, temp_y, obj_solid);
                        var collision2 = position_meeting(temp_x, temp_y, obj_npc_parent);
                        collision = collision1 + collision2;
                    }
                    
                    var _light_mid_x = mean(start_x, temp_x) - camx;
                    var _light_mid_y = mean(start_y, temp_y) - camy;
                    var _dist = point_distance(start_x, start_y, temp_x, temp_y) + sprite_get_width(s_glow_laser);
                    var _dir = point_direction(start_x, start_y, temp_x, temp_y);
                    draw_sprite_ext(s_glow_laser, 0, _light_mid_x, _light_mid_y, _dist / sprite_get_width(s_glow_laser), 1, _dir, _color, 0.3);
                }
                
                _i++;
            }
        }
    }
}

surface_reset_target();
draw_surface(surface_light, camx, camy);

if (is_in_raid() && global.show_surf_radiation && instance_exists(obj_map_generator))
{
    if (surface_exists(obj_map_generator.surf_radiation))
        draw_surface_ext(obj_map_generator.surf_radiation, 0, 0, 8, 8, 0, c_white, 1);
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3
}

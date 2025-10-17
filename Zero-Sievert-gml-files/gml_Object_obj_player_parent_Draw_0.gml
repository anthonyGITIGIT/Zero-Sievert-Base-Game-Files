if (arms_holder == undefined && weapon_holder.draw_before_follow && weapon_holder.is_visible)
    weapon_holder.func_draw();

draw_sprite_ext(s_shadow, 0, x, y + 8, 1, 1, 0, c_black, 0.5);

if (player_state_is(mp_index, scr_player_state_move) && is_undefined(arms_holder))
{
    scr_draw_laser("att_1");
    scr_draw_laser("att_2");
    scr_draw_laser("att_3");
    scr_draw_laser("att_4");
}

if (hit_shader == "BULLET_HIT_SHADER_NORMAL")
    shader_set(shd_flash_hit);

if (hit_shader == "BULLET_HIT_SHADER_GLANCE")
    shader_set(shd_flash_hit_glance);

if (hit_shader == "BULLET_HIT_SHADER_NORMAL_BLOCKED" || hit_shader == "BULLET_HIT_SHADER_GLANCE_BLOCKED")
{
    shader_set(shd_flash_hit_blocked);
    var _texture = sprite_get_texture(sprite_index, image_index);
    var _texture_w = texture_get_texel_width(_texture);
    var _texture_h = texture_get_texel_height(_texture);
    shader_set_uniform_f(shader_hit_size, _texture_w, _texture_h);
    
    if (hit_shader == "BULLET_HIT_SHADER_NORMAL_BLOCKED")
    {
        var _col = 16777215;
        shader_set_uniform_f(shader_outline_color, color_get_red(_col) / 255, color_get_green(_col) / 255, color_get_blue(_col) / 255);
    }
    
    if (hit_shader == "BULLET_HIT_SHADER_GLANCE_BLOCKED")
    {
        var _col = 255;
        shader_set_uniform_f(shader_outline_color, color_get_red(_col) / 255, color_get_green(_col) / 255, color_get_blue(_col) / 255);
    }
}

var _backpack_sprite = item_backpack_get_sprite(backpack_now);

if (sprite_exists(_backpack_sprite))
{
    var offset_backpack;
    
    if (player_state_is(mp_index, scr_player_state_weapon_look))
        offset_backpack = 0;
    else if (sprite_index == sprite_idle)
        offset_backpack = (image_index > 1) ? 1 : 0;
    else
        offset_backpack = (image_index > 2) ? 1 : 0;
    
    draw_sprite_ext(_backpack_sprite, 0, x, y + offset_backpack, image_xscale, 1, false, c_white, 1);
}

draw_self();
shader_reset();

if (arms_holder == undefined && !weapon_holder.draw_before_follow && weapon_holder.is_visible)
    weapon_holder.func_draw();

if (arms_holder != undefined)
    arms_holder.func_draw();

if (global.hud_glance_sysytem || is_in_shooting_range())
{
    if (item_exists(arma_now))
    {
        var _get_type_eff_range = item_ammo_get_eff_range(player_loadout_get_ammo_item(self, weapon_slot_now));
        
        if (_get_type_eff_range == "{use_weapon}")
            _get_type_eff_range = item_weapon_get_type_effective_range(arma_now);
        
        var _scope_mult = 1;
        
        if (instance_exists(player_get_local()))
        {
            if (player_get_local_var("aiming") || obj_gamepad.action[UnknownEnum.Value_28].value)
            {
                var _player = player_get_local();
                var _scope = player_loadout_get_mod(_player, _player.weapon_slot_now, "scope");
                
                if (item_exists(_scope))
                    _scope_mult = item_mod_get_scope_mult_eff_range(_scope);
            }
        }
        
        var _array_points = variable_struct_get(global.weapon_glance_stat, _get_type_eff_range).eff_range;
        var _array_points_updated = array_create(array_length(_array_points));
        _array_points_updated = glance_effective_range_get_mastery(_array_points);
        
        if (!array_equals(_array_points_updated, _array_points))
        {
            draw_set_colour(c_lime);
            var _array_position;
            
            for (var i = 0; i < array_length(_array_points_updated); i++)
            {
                _array_position = _array_points_updated[i];
                draw_circle(x, y, _array_position[0] * _scope_mult, true);
            }
            
            draw_set_halign(fa_left);
            draw_text(x - min((_array_position[0] * _scope_mult) - 30, 200), y, "Green is with mastery");
            draw_set_colour(c_white);
        }
        
        for (var i = 0; i < array_length(_array_points); i++)
        {
            var _array_position = _array_points[i];
            draw_circle(x, y, _array_position[0] * _scope_mult, true);
        }
    }
}

enum UnknownEnum
{
    Value_28 = 28
}

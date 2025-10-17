var viewx = camera_get_view_x(view_camera[0]);
var viewy = camera_get_view_y(view_camera[0]);
var _player = player_get_local();

if (display_scope && player_loadout_get_mod_exists(_player, _player.weapon_slot_now, "scope"))
{
    var get_scope_id = player_loadout_get_mod(_player, _player.weapon_slot_now, "scope");
    var scope_sprite = item_mod_get_scope_image(get_scope_id);
    var scopew = sprite_get_width(scope_sprite);
    var scopeh = sprite_get_height(scope_sprite);
    
    if (!surface_exists(surface_aim))
        surface_aim = surface_create(480, 270);
    
    surface_set_target(surface_aim);
    draw_clear_alpha(c_black, 1);
    gpu_set_blendmode(bm_subtract);
    draw_rectangle(x - (scopew / 2) - viewx, y - (scopeh / 2) - viewy, (x + (scopew / 2)) - viewx - 1, (y + (scopeh / 2)) - viewy - 1, false);
    gpu_set_blendmode(bm_normal);
    var _mult = glance_effective_range(player_loadout_get_ammo_item(_player, _player.weapon_slot_now), _player.arma_now, point_distance(_player.x, _player.y, x, y));
    _mult += (item_weapon_get_scope_glance_flat_amount(player_get_local().arma_now) / 100);
    var _ammo_item = player_loadout_get_ammo_item(_player, _player.weapon_slot_now);
    _mult = glance_effective_range(_ammo_item, _player.arma_now, point_distance(_player.x, _player.y, x, y));
    _mult += (item_weapon_get_scope_glance_flat_amount(_player.arma_now) / 100);
    _mult = clamp(_mult, 0, 1);
    var _beyond_max = false;
    
    if ((_mult - (item_weapon_get_scope_glance_flat_amount(player_get_local().arma_now) / 100)) == 0)
    {
        _beyond_max = glance_dis_is_beyond_max_range(player_loadout_get_ammo_item(_player, _player.weapon_slot_now), _player.arma_now, point_distance(_player.x, _player.y, x, y));
        
        if (_beyond_max)
            draw_sprite_ext(s_scope_beyond_max_range, 0, x - viewx, y - viewy, 1, 1, 0, c_red, alpha_dot);
    }
    
    if (!_beyond_max)
        alpha_dot = 0.25;
    
    alpha_dot += (0.0075 * alpha_factor);
    
    if (alpha_dot >= 0.5)
        alpha_factor = -1;
    
    if (alpha_dot <= 0.25)
        alpha_factor = 1;
    
    var _col = make_color_rgb(255, 255 * _mult, 255 * _mult);
    var _off = 4;
    draw_sprite_ext(s_scope_effective_range, 0, x - (scopew / 2) - _off - viewx, y - viewy, 1, 1, 0, _col, 1);
    draw_sprite_ext(s_scope_effective_range, 0, (x + (scopew / 2) + _off) - viewx, y - viewy, 1, 1, 0, _col, 1);
    draw_sprite_ext(s_scope_effective_range, 0, x - viewx, y - (scopeh / 2) - _off - viewy, 1, 1, 90, _col, 1);
    draw_sprite_ext(s_scope_effective_range, 0, x - viewx, (y + (scopeh / 2) + _off) - viewy, 1, 1, 90, _col, 1);
    var _c_scope = 16777215;
    
    if (obj_mouse.linea_libera_gun_mouse == false)
        _c_scope = 2302888;
    
    draw_sprite_ext(s_scope_general, 0, x - viewx, y - viewy, 1, 1, 0, _c_scope, 1);
    surface_reset_target();
    var _blackout_alpha = 1;
    
    if (skill_active("marksman_awareness"))
        _blackout_alpha = global.skills_data.marksman_awareness.value_1;
    
    shader_set(shd_crosshair);
    var _alpha_amount = clamp((animation_pos - animation_ranges_crosshair_alpha_start) / (animation_ranges_crosshair_alpha_end - animation_ranges_crosshair_alpha_start), 0, 1);
    var _blur_amount = clamp((animation_pos - animation_ranges_crosshair_blur_start) / (animation_ranges_crosshair_blur_end - animation_ranges_crosshair_blur_start), 0, 1);
    var i = 0;
    shader_set_uniform_f(shader_params[i], sprite_get_width(scope_sprite), sprite_get_height(scope_sprite));
    i++;
    shader_set_uniform_f(shader_params[i], _blur_amount);
    i++;
    draw_sprite_ext(scope_sprite, 0, x, y, 1, 1, 0, _c_scope, _alpha_amount);
    shader_reset();
    draw_surface_ext(surface_aim, viewx, viewy, 1, 1, 0, c_white, _blackout_alpha);
}

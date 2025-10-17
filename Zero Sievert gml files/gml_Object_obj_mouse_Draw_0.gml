var camx = camera_get_view_x(view_camera[0]);
var camy = camera_get_view_y(view_camera[0]);
visible = true;

if (!player_local_state_is(scr_player_state_pda, scr_player_state_inventory))
{
    draw_self();
    
    if (player_local_state_is(scr_player_state_move))
    {
        var angolo_precisione = degtorad((2 * player_get_local().total_precision) + (player_get_local().recoil_from_shooting * 0.004));
        var dis_mouse_player = player_distance_local(x, y);
        var offset_precisione = (dis_mouse_player * tan(angolo_precisione)) + 5;
        offset_precisione = clamp(offset_precisione, 5, 100);
        var _player = player_get_local();
        var _mult = glance_effective_range(player_loadout_get_ammo_item(_player, _player.weapon_slot_now), _player.arma_now, point_distance(_player.x, _player.y, x, y), true);
        _mult = clamp(_mult, 0, 1);
        var _col = make_color_rgb(255, 255 * _mult, 255 * _mult);
        var _alpha = 1;
        var _alpha_def = 0.5;
        _alpha = _mult + 0.1;
        var _beyond_max = false;
        
        if (_mult == 0)
        {
            _beyond_max = glance_dis_is_beyond_max_range(player_loadout_get_ammo_item(_player, _player.weapon_slot_now), _player.arma_now, point_distance(_player.x, _player.y, x, y));
            
            if (_beyond_max)
            {
                draw_sprite_ext(s_mouse, 7, x, y, 1, 1, 0, c_red, alpha_dot);
                _alpha = 0;
            }
        }
        
        if (!_beyond_max)
            alpha_dot = 1;
        
        draw_sprite_ext(s_mouse, 3, x, y - offset_precisione, 1, 1, 0, _col, _alpha);
        draw_sprite_ext(s_mouse, 3, x, y + offset_precisione, 1, 1, 0, _col, _alpha);
        draw_sprite_ext(s_mouse, 2, x + offset_precisione, y, 1, 1, 0, _col, _alpha);
        draw_sprite_ext(s_mouse, 2, x - offset_precisione, y, 1, 1, 0, _col, _alpha);
        var _alpha_dot = 1;
        alpha_dot += (0.025 * alpha_factor);
        
        if (alpha_dot >= 1)
            alpha_factor = -1;
        
        if (alpha_dot <= 0)
            alpha_factor = 1;
        
        if (!_beyond_max)
            draw_sprite_ext(s_mouse, 1, x, y, 1, 1, 0, c_white, 1);
        
        if (!linea_libera_gun_mouse && !_beyond_max)
            draw_sprite_ext(s_mouse, 1, x, y, 1, 1, 0, c_red, 1);
    }
    
    if (player_local_state_is(scr_player_state_dead))
        image_index = 4;
}

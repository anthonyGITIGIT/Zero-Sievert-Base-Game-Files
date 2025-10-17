if (fog_of_war && player_exists_local())
{
    var _player_x = player_get_local().x;
    var _player_y = player_get_local().y;
    var _camx = round(camera_get_view_x(view_camera[0]));
    var _camy = round(camera_get_view_y(view_camera[0]));
    
    if (!surface_exists(surface_shadow))
    {
        trace("Fog: Surface recreated");
        surface_shadow = surface_create(surf_w, surf_h);
    }
    
    surface_set_target(surface_shadow);
    draw_clear_alpha(c_black, settings_get("FOG FOW") ? 1 : 0);
    
    if (settings_get("FOG FOW"))
    {
        var _angle_diff = global.angle_fow / 2;
        var _px = _player_x - _camx;
        var _py = _player_y - _camy;
        var _dir = point_direction(obj_cursor.aa_x, obj_cursor.aa_y, _player_x, _player_y) + 360;
        var _dir2 = _dir + 180;
        var _off = 1000;
        var _v1x = _px + lengthdir_x(_off, _dir + _angle_diff);
        var _v1y = _py + lengthdir_y(_off, _dir + _angle_diff);
        var _v2x = _px + lengthdir_x(_off, _dir2 + _angle_diff);
        var _v2y = _py + lengthdir_y(_off, _dir2 + _angle_diff);
        var _v3x = _px + lengthdir_x(_off, _dir2 - _angle_diff);
        var _v3y = _py + lengthdir_y(_off, _dir2 - _angle_diff);
        var _v4x = _px + lengthdir_x(_off, _dir - _angle_diff);
        var _v4y = _py + lengthdir_y(_off, _dir - _angle_diff);
        draw_primitive_begin(pr_trianglefan);
        gpu_set_blendmode(bm_subtract);
        draw_vertex(_px, _py);
        draw_vertex(_v1x, _v1y);
        draw_vertex(_v2x, _v2y);
        draw_vertex(_v3x, _v3y);
        draw_vertex(_v4x, _v4y);
        draw_primitive_end();
        draw_sprite(s_glow_fow, 0, _px, _py);
        gpu_set_blendmode(bm_normal);
    }
    
    shader_set(shd_fog_new);
    shader_set_uniform_f(light_pos, _player_x - _camx, _player_y - _camy);
    shader_set_uniform_f(cam_pos, _camx, _camy);
    
    if (vb != undefined)
        vertex_submit(vb, pr_trianglelist, -1);
    
    shader_reset();
    surface_reset_target();
    draw_surface_ext(surface_shadow, _camx - 1, _camy - 1, 1, 1, 0, c_black, settings_get("fog of war alpha"));
}

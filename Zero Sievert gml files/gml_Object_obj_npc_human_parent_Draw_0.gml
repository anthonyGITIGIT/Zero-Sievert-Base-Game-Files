event_inherited();
var rot = weapon_pointing_direction;
var offsetx_arma = 0;
var offsety_arma = 0;
var offset_arma = 2;

if (alarm[1] >= (item_weapon_get_rate_of_fire(arma_now) - 2))
{
    offsetx_arma = -lengthdir_x(offset_arma, rot);
    offsety_arma = -lengthdir_y(offset_arma, rot);
}

if (image_alpha > 0)
    draw_sprite_ext(s_shadow, 0, x, y + 8, 1, 1, 0, c_black, 0.5 * image_alpha);

if (shader_hit == "BULLET_HIT_SHADER_NORMAL")
    shader_set(shd_flash_hit);

if (shader_hit == "BULLET_HIT_SHADER_GLANCE")
    shader_set(shd_flash_hit_glance);

if (shader_hit == "BULLET_HIT_SHADER_NORMAL_BLOCKED" || shader_hit == "BULLET_HIT_SHADER_GLANCE_BLOCKED")
{
    shader_set(shd_flash_hit_blocked);
    var _texture = sprite_get_texture(sprite_index, image_index);
    var _texture_w = texture_get_texel_width(_texture);
    var _texture_h = texture_get_texel_height(_texture);
    shader_set_uniform_f(shader_hit_size, _texture_w, _texture_h);
    
    if (shader_hit == "BULLET_HIT_SHADER_NORMAL_BLOCKED")
    {
        var _col = 16777215;
        shader_set_uniform_f(shader_outline_color, color_get_red(_col) / 255, color_get_green(_col) / 255, color_get_blue(_col) / 255);
    }
    
    if (shader_hit == "BULLET_HIT_SHADER_GLANCE_BLOCKED")
    {
        var _col = 255;
        shader_set_uniform_f(shader_outline_color, color_get_red(_col) / 255, color_get_green(_col) / 255, color_get_blue(_col) / 255);
    }
}

if (target_for_image_scale < x)
{
    image_xscale = -1;
    rot = weapon_pointing_direction + 180;
    draw_self();
}
else
{
    image_xscale = 1;
    rot = weapon_pointing_direction;
    draw_self();
}

shader_reset();
draw_skill_npc_above();

if (global.hud_glance_sysytem || is_in_shooting_range())
{
    var _dis = point_distance(x, y, player_get_local().x, player_get_local().y);
    var _dis2 = point_distance(x, y, obj_cursor.aa_x, obj_cursor.aa_y);
    var _player = player_get_local();
    var _glance_angle = glance_angle(player_loadout_get_ammo_item(_player, _player.weapon_slot_now), _player.arma_now, npc_get_sweet_angle(npc_id), _dis, _dis2);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_text(x + global.language_font_offset.x, (y - 20) + global.language_font_offset.y, "Hit% " + string(round((_glance_angle / npc_get_sweet_angle(npc_id)) * 100)));
}

if (global.show_npc_recoil)
{
    if (instance_exists(target))
    {
        var _xx = NPCrecoil.cross_center_x;
        var _yy = NPCrecoil.cross_center_y;
        draw_circle(_xx, _yy, NPCrecoil.radius_now, true);
        draw_circle_color(_xx, _yy, NPCrecoil.radius_min, c_red, c_red, true);
        draw_circle_color(_xx, _yy, NPCrecoil.radius_max, c_red, c_red, true);
        draw_sprite(s_bullet_shell, 0, _xx + NPCrecoil.cross_x, _yy + NPCrecoil.cross_y);
    }
}

if (global.show_reflexes_npc)
{
    draw_text(x + global.language_font_offset.x, (y - 28) + global.language_font_offset.y, "now: " + string(round(riflessi)));
    draw_text(x + global.language_font_offset.x, (y - 38) + global.language_font_offset.y, "max: " + string(round(riflessi_max)));
    draw_text(x + global.language_font_offset.x, (y - 48) + global.language_font_offset.y, "dis: " + string(round(reflexes_distance)));
    draw_text(x + global.language_font_offset.x, (y - 58) + global.language_font_offset.y, "angle: " + string(round(reflexes_angle)));
    draw_circle(last_seen_x, last_seen_y, reflex_min_distance_last_known, true);
    
    if (instance_exists(obj_light_controller))
    {
        var alert_distance = npc_get_alert_visual_distance(npc_id);
        var alert_angle = npc_get_alert_radius(npc_id);
        var lc = obj_light_controller;
        var t_hm = time_get_hours_fraction();
        var k = 1;
        
        if (lc.ciclo_now == UnknownEnum.Value_3)
        {
            alert_distance = npc_get_alert_visual_distance(npc_id) / k;
            alert_angle = npc_get_alert_radius(npc_id) / k;
        }
        
        if (lc.ciclo_now == UnknownEnum.Value_0)
        {
            var hours_sunrise = lc.ciclo_time[UnknownEnum.Value_1] - lc.ciclo_time[UnknownEnum.Value_0];
            var amount = (t_hm - lc.ciclo_time[UnknownEnum.Value_0]) / hours_sunrise;
            alert_angle = lerp(npc_get_alert_radius(npc_id) / k, npc_get_alert_radius(npc_id), amount);
            alert_distance = lerp(npc_get_alert_visual_distance(npc_id) / k, npc_get_alert_visual_distance(npc_id), amount);
        }
        
        if (lc.ciclo_now == UnknownEnum.Value_2)
        {
            var hours_sunrise = lc.ciclo_time[UnknownEnum.Value_3] - lc.ciclo_time[UnknownEnum.Value_2];
            var amount = (t_hm - lc.ciclo_time[UnknownEnum.Value_2]) / hours_sunrise;
            alert_angle = lerp(npc_get_alert_radius(npc_id), npc_get_alert_radius(npc_id) / k, amount);
            alert_distance = lerp(npc_get_alert_visual_distance(npc_id), npc_get_alert_visual_distance(npc_id) / k, amount);
        }
        
        alert_distance = scr_npc_oval_view(alert_distance, weapon_pointing_direction);
        var x2 = x + lengthdir_x(alert_distance, weapon_pointing_direction + (alert_angle / 2));
        var y2 = y + lengthdir_y(alert_distance, weapon_pointing_direction + (alert_angle / 2));
        var x3 = x + lengthdir_x(alert_distance, weapon_pointing_direction - (alert_angle / 2));
        var y3 = y + lengthdir_y(alert_distance, weapon_pointing_direction - (alert_angle / 2));
        draw_triangle(x, y, x2, y2, x3, y3, true);
    }
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3
}

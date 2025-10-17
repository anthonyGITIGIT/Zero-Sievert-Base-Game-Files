event_inherited();

if (shader_hit == "BULLET_HIT_SHADER_NORMAL")
    shader_set(shd_flash_hit);

if (shader_hit == "BULLET_HIT_SHADER_GLANCE")
    shader_set(shd_flash_hit_glance);

if (xprevious > x)
{
    image_xscale = -1;
    draw_self();
}
else if (xprevious == x)
{
    draw_self();
}
else if (xprevious < x)
{
    image_xscale = 1;
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
    draw_text(x + global.language_font_offset.x, (y - 20) + global.language_font_offset.y, "Angle: " + string(_glance_angle));
}

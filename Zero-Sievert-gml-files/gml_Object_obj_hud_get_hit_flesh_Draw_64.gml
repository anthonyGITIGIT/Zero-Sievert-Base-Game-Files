if (player_get_local_var("aiming", false))
{
    var _scale = camera_get_view_width(view_camera[0]) / 480;
    draw_sprite_ext(s_hud_bleed_all, image_index, 0, 0, _scale * 4, _scale * 4, 0, c_white, a);
}

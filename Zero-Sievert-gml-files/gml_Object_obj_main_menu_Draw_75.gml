if (black_overlay_alpha > 0)
{
    black_overlay_alpha = clamp(black_overlay_alpha - 0.02, 0, 1);
    draw_sprite_stretched_ext(s_1pixel, 0, -1, -1, display_get_gui_width() + 1, display_get_gui_height() + 1, c_black, black_overlay_alpha);
}

with (__uiGlobal().__defaultOnion)
{
    if (InputGetMode() == "directional")
        exit;
}

draw_sprite_ext(s_mouse, 4, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 4, 4, 0, c_white, 1);

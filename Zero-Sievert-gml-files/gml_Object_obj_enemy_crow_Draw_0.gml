if (state != "crow_escape" && state != "crow_move_to_target")
    draw_sprite_ext(s_shadow, 0, x, y + 6, 1, 1, 0, c_black, 0.5);

event_inherited();

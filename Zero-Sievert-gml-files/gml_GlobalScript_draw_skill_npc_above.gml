function draw_skill_npc_above()
{
    if (frames_left_of_impaler_shot_1 > 0 || frames_left_of_impaler_shot_2 > 0)
    {
        var _h_move = sin(current_time / 400) * 4;
        var _v_move = cos(current_time / 400) * 2;
        draw_sprite_ext(spr_slowed_star, 0, x + _h_move, (y + _v_move) - 7, 1, 1, 0, c_yellow, 0.8);
    }
    
    if (remain_visible_frames > 0)
        draw_sprite_ext(spr_skill_has_vision, 0, x - 3, y - 7, 1, 1, 0, c_white, 0.8);
}

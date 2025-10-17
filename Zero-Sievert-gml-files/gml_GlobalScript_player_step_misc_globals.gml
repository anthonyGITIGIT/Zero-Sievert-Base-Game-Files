function player_step_misc_globals()
{
    if (!player_state_is(mp_index, scr_player_state_move))
        global.change_ammo_now = false;
    
    if (is_in_raid())
        is_indoor = y > obj_map_generator.map_height;
}

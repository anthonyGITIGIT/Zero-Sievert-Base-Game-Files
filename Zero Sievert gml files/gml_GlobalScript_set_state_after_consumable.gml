function set_state_after_consumable()
{
    if (!instance_exists(obj_exit_screen))
        player_set_state(scr_player_state_move, follow_id.mp_index);
    else
        player_set_state(scr_player_state_start, follow_id.mp_index);
}

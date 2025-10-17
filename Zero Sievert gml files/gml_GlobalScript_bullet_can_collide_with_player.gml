function bullet_can_collide_with_player(arg0, arg1)
{
    if (!instance_exists(arg1))
        return false;
    
    if (player_get_hp(arg1.mp_index) > 0)
    {
        if (!player_state_is(arg1.mp_index, scr_player_state_start, scr_player_state_free_camera))
        {
            if (arg0.shooter_faction != arg1.faction)
                return true;
        }
    }
    
    return false;
}

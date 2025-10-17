function player_step_update_xscale()
{
    if (player_state_is(mp_index, scr_player_state_weapon_look))
    {
        image_xscale = 1;
        image_index = 0;
    }
    else if (x > (aim_point_x + 1))
    {
        image_xscale = -1;
    }
    else if (x < (aim_point_x - 1))
    {
        image_xscale = 1;
    }
}

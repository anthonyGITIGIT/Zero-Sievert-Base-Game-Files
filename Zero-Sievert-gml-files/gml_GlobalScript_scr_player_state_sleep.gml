function scr_player_state_sleep()
{
    if (aiming)
    {
        aiming = false;
        
        with (obj_mouse)
            visible = true;
    }
}

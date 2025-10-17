function scr_player_state_talk()
{
    if (aiming)
    {
        aiming = false;
        
        with (obj_mouse)
            visible = true;
    }
}

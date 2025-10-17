function scr_player_state_inventory()
{
    if (aiming)
    {
        aiming = false;
        
        with (obj_mouse)
            visible = true;
    }
}

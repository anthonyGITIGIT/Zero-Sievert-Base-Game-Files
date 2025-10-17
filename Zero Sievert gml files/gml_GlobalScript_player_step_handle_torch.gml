function player_step_handle_torch()
{
    if (!item_exists(headset_now))
    {
        with (torch_holder)
            instance_destroy();
        
        global.night_vision = false;
    }
}

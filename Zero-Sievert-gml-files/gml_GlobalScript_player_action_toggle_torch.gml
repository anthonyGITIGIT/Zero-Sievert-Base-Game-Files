function player_action_toggle_torch()
{
    with (player_get_local())
    {
        if (item_exists(arma_now))
        {
            torch_on_general = !torch_on_general;
            audio_play_sound(snd_laser_on, 10, false);
            return true;
        }
        
        return false;
    }
}

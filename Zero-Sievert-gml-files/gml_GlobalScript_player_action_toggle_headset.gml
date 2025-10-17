function player_action_toggle_headset()
{
    with (player_get_local())
    {
        if (item_exists(headset_now))
        {
            if (item_headset_get_type(headset_now) == "torch")
            {
                audio_play_sound(snd_laser_on, 10, false);
                
                if (instance_exists(torch_holder))
                {
                    with (torch_holder)
                        instance_destroy();
                    
                    torch_holder = -4;
                }
                else
                {
                    torch_holder = instance_create_depth(x, y, 0, obj_light_torch);
                    torch_holder.follow_id = id;
                    torch_holder.light_id = item_headset_get_light_id(headset_now);
                    
                    if (item_headset_get_light_id(headset_now) == "hs_pumpkin")
                        audio_play_sound(snd_headset_pumpkin, 25, false);
                }
                
                return true;
            }
            else if (item_headset_get_type(headset_now) == "night_vision")
            {
                audio_play_sound(snd_laser_on, 10, false);
                global.night_vision = !global.night_vision;
                
                if (global.night_vision)
                    audio_play_sound(snd_night_vision_on, 10, false);
                
                return true;
            }
        }
        
        return false;
    }
}

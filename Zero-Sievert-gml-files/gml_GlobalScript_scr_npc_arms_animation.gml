function scr_npc_arms_animation(arg0)
{
    var arms = arg0;
    var _patrol = false;
    draw_weapon = false;
    var my_id_ = id;
    
    if (instance_exists(arms))
    {
        with (arms)
        {
            if (linked_id == my_id_)
            {
                if (image_index > (sprite_get_number(sprite_index) - 2))
                {
                    switch (arms)
                    {
                        case obj_arms_smoke:
                            if (scr_chance(20))
                                _patrol = true;
                            
                            break;
                        
                        case obj_arms_eat:
                            if (scr_chance(60))
                                _patrol = true;
                            
                            break;
                        
                        case obj_arms_drink:
                            if (scr_chance(75))
                                _patrol = true;
                            
                            break;
                        
                        case obj_arms_guitar:
                            if (scr_chance(0.1))
                                _patrol = true;
                            
                            break;
                        
                        case obj_arms_scientist_working:
                            break;
                        
                        default:
                            break;
                    }
                }
            }
        }
    }
    
    if (_patrol == true)
    {
        draw_weapon = true;
        state_finito = true;
    }
}

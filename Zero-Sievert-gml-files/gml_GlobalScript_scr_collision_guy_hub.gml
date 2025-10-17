function scr_collision_guy_hub()
{
    var amount_ = 5;
    
    if (hspd != 0)
    {
        var time_ = current_time;
        
        if (place_meeting(x + ceil(hspd), y, obj_solid))
        {
            while (!place_meeting(x + sign(hspd), y, obj_solid))
            {
                x += sign(hspd);
                
                if (current_time > (time_ + amount_))
                    break;
            }
            
            hspd = 0;
        }
        
        x += hspd;
    }
    
    if (vspd != 0)
    {
        var time_ = current_time;
        
        if (place_meeting(x, y + ceil(vspd), obj_solid))
        {
            while (!place_meeting(x, y + sign(vspd), obj_solid))
            {
                y += sign(vspd);
                
                if (current_time > (time_ + amount_))
                    break;
            }
            
            vspd = 0;
        }
        
        y += vspd;
    }
}

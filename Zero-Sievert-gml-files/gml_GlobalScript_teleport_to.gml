function teleport_to(arg0)
{
    if (!teleport_allowed(arg0))
        exit;
    
    with (obj_player)
    {
        switch (arg0)
        {
            case "Stash":
                x = 284;
                y = 870;
                break;
            
            case "Conductor":
                x = 693;
                y = 1343;
                break;
            
            case "Barman":
                x = 591;
                y = 904;
                break;
            
            case "Doctor":
                x = 986;
                y = 1032;
                break;
            
            case "Networker":
                x = 488;
                y = 1040;
                break;
            
            case "Green Army":
                x = 86;
                y = 586;
                break;
            
            case "Crimson Corporation":
                x = 770;
                y = 815;
                break;
            
            case "Shooting Range":
                x = 1368;
                y = 716;
                break;
            
            default:
                trace("Warning! Teleport target \"", arg0, "\" not recognised");
                break;
        }
        
        teleport_used_frames = 1;
    }
    
    obj_fog_setup.alarm[0] = 1;
    obj_controller.alarm[4] = 1;
    obj_camera.alarm[1] = 1;
}

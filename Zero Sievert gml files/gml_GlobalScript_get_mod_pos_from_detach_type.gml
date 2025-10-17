function get_mod_pos_from_detach_type(arg0)
{
    switch (arg0)
    {
        case "Detach suppressor":
            return "brake";
            break;
        
        case "Detach scope":
            return "scope";
            break;
        
        case "Detach magazine":
            return "magazine";
            break;
        
        case "Detach att 1":
            return "att_1";
            break;
        
        case "Detach att 2":
            return "att_2";
            break;
        
        case "Detach att 3":
            return "att_3";
            break;
        
        case "Detach att 4":
            return "att_4";
            break;
    }
}

function get_detach_type_from_mod_pos(arg0)
{
    switch (arg0)
    {
        case "brake":
            return "Detach suppressor";
            break;
        
        case "scope":
            return "Detach scope";
            break;
        
        case "magazine":
            return "Detach magazine";
            break;
        
        case "att_1":
            return "Detach att 1";
            break;
        
        case "att_2":
            return "Detach att 2";
            break;
        
        case "att_3":
            return "Detach att 3";
            break;
        
        case "att_4":
            return "Detach att 4";
            break;
    }
}

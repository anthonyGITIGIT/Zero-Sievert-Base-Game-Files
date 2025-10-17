function teleport_allowed(arg0)
{
    switch (arg0)
    {
        case "Stash":
        case "Conductor":
        case "Barman":
        case "Doctor":
        case "Shooting Range":
        case "Networker":
            return true;
            break;
        
        case "Green Army":
            return quest_is_complete("unlock_makeshift_camp");
            break;
        
        case "Crimson Corporation":
            return quest_is_complete("new_arrivals");
            break;
    }
    
    return true;
}

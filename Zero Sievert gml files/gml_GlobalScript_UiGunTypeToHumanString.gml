function UiGunTypeToHumanString(arg0)
{
    switch (arg0)
    {
        case "pistol":
            return language_get_string("Pistol");
            break;
        
        case "smg":
            return language_get_string("SMG");
            break;
        
        case "shotgun":
            return language_get_string("Shotgun");
            break;
        
        case "rifle":
            return language_get_string("Rifle");
            break;
        
        case "dmr":
            return language_get_string("DMR");
            break;
        
        case "sniper":
            return language_get_string("Sniper");
            break;
        
        default:
            show_error("Didnt know what gun to display", true);
            break;
    }
}

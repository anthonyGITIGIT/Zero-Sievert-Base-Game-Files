function loot_weapon_get_fire_mode_name(arg0)
{
    switch (loot_weapon_get_fire_mode(arg0))
    {
        case "semi_automatic":
        case "automatic":
            return string(round(3600 / loot_weapon_get_rate_of_fire(arg0))) + " rpm";
            break;
        
        case "bolt_action":
            return "Bolt Action";
            break;
        
        default:
            return "???";
            break;
    }
}

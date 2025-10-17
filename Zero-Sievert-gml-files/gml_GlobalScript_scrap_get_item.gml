function scrap_get_item(arg0)
{
    switch (arg0)
    {
        case "none":
            return "no_item";
        
        case "material":
            return "scrap_material";
        
        case "food":
            return "scrap_food";
        
        case "ammo":
            return "scrap_ammo";
        
        case "med":
            return "scrap_med";
        
        case "weapon":
            return "scrap_weapon";
        
        case "armor":
            return "scrap_armor";
        
        default:
            trace_error("Scrap type \"", arg0, "\" not recognised");
            return "no_item";
            break;
    }
}

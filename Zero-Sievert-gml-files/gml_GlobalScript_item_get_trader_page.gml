function item_get_trader_page(arg0)
{
    switch (item_get_category(arg0))
    {
        case "medication":
        case "injector":
        case "consumable":
            return "medication_and_food";
            break;
        
        case "backpack":
        case "armor":
        case "headset":
            return "equipment";
            break;
        
        case "barter":
        case "repair_weapon":
        case "repair_armor":
        case "key":
        case "book":
        case "book_r":
            return "general";
            break;
        
        case "ammo":
        case "grenade":
            return "ammo";
            break;
        
        case "weapon":
            switch (item_weapon_get_type(arg0))
            {
                case "pistol":
                case "smg":
                    return "pistol_smg";
                    break;
                
                case "rifle":
                    return "rifle";
                    break;
                
                case "shotgun":
                    return "shotgun";
                    break;
                
                case "sniper":
                case "dmr":
                    return "sniper_rifle";
                    break;
            }
            
            break;
        
        case "w_mod":
            switch (item_mod_get_type(arg0))
            {
                case "stock":
                case "barrel":
                    return "stock";
                    break;
                
                case "magazine":
                    return "magazine";
                    break;
                
                case "handguard":
                case "grip":
                    return "handguard_grip";
                    break;
                
                case "foregrip":
                case "scope":
                case "silencer":
                case "torch":
                case "laser":
                case "brake":
                    return "hand_scope";
                    break;
            }
            
            break;
        
        default:
            return trader_pages_default_alias();
            break;
    }
}

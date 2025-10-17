function scr_npc_get_ammo_drop(arg0, arg1)
{
    var _value = npc_get_ammo_value(arg1);
    var _caliber = item_ammo_get_caliber(arg0);
    var _new_ammo_drop = arg0;
    
    switch (_caliber)
    {
        case "a9x18":
            switch (_value)
            {
                case 0:
                    _new_ammo_drop = "ammo_9x18";
                    break;
                
                case 1:
                    _new_ammo_drop = "ammo_9x18";
                    break;
                
                case 2:
                    _new_ammo_drop = choose("ammo_9x18", "ammo_9x18_pbm");
                    break;
                
                case 3:
                    _new_ammo_drop = "ammo_9x18_pbm";
                    break;
                
                case 4:
                    _new_ammo_drop = "ammo_9x18_pbm";
                    break;
            }
            
            break;
        
        case "a9x19":
            switch (_value)
            {
                case 0:
                    _new_ammo_drop = choose("ammo_9x19", "ammo_9x19_sub", "ammo_9x19_sub");
                    break;
                
                case 1:
                    _new_ammo_drop = "ammo_9x19";
                    break;
                
                case 2:
                    _new_ammo_drop = choose("ammo_9x19", "ammo_9x19_ap");
                    break;
                
                case 3:
                    _new_ammo_drop = "ammo_9x19_ap";
                    break;
                
                case 4:
                    _new_ammo_drop = "ammo_9x19_ap";
                    break;
            }
            
            break;
        
        case "a57x28":
            switch (_value)
            {
                case 0:
                    _new_ammo_drop = choose("ammo_57x28", "ammo_57x28_sub");
                    break;
                
                case 1:
                    _new_ammo_drop = "ammo_57x28";
                    break;
                
                case 2:
                    _new_ammo_drop = choose("ammo_57x28", "ammo_57x28_ss190");
                    break;
                
                case 3:
                    _new_ammo_drop = "ammo_57x28_ss190";
                    break;
                
                case 4:
                    _new_ammo_drop = "ammo_57x28_ss190";
                    break;
            }
            
            break;
        
        case "a762x39":
            switch (_value)
            {
                case 0:
                    _new_ammo_drop = choose("ammo_762x39_hp", "ammo_762x39_sub");
                    break;
                
                case 1:
                    _new_ammo_drop = choose("ammo_762x39_sub", "ammo_762x39_hp");
                    break;
                
                case 2:
                    _new_ammo_drop = "ammo_762x39";
                    break;
                
                case 3:
                    _new_ammo_drop = "ammo_762x39_bp";
                    break;
                
                case 4:
                    _new_ammo_drop = "ammo_762x39_bp";
                    break;
            }
            
            break;
        
        case "a545x39":
            switch (_value)
            {
                case 0:
                    _new_ammo_drop = choose("ammo_545x39_hp", "ammo_545x39_sub");
                    break;
                
                case 1:
                    _new_ammo_drop = choose("ammo_545x39_hp", "ammo_545x39", "ammo_545x39_sub");
                    break;
                
                case 2:
                    _new_ammo_drop = "ammo_545x39";
                    break;
                
                case 3:
                    _new_ammo_drop = "ammo_545x39_bt";
                    break;
                
                case 4:
                    _new_ammo_drop = "ammo_545x39_bt";
                    break;
            }
            
            break;
        
        case "a556x45":
            switch (_value)
            {
                case 0:
                    _new_ammo_drop = choose("ammo_556x45_hp", "ammo_556x45_sub");
                    break;
                
                case 1:
                    _new_ammo_drop = choose("ammo_556x45_hp", "ammo_556x45", "ammo_556x45_sub");
                    break;
                
                case 2:
                    _new_ammo_drop = "ammo_556x45";
                    break;
                
                case 3:
                    _new_ammo_drop = "ammo_556x45_m995";
                    break;
                
                case 4:
                    _new_ammo_drop = "ammo_556x45_m995";
                    break;
            }
            
            break;
        
        case "a762x51":
            switch (_value)
            {
                case 0:
                    _new_ammo_drop = "ammo_762x51_hp";
                    break;
                
                case 1:
                    _new_ammo_drop = choose("ammo_762x51_hp", "ammo_762x51");
                    break;
                
                case 2:
                    _new_ammo_drop = choose("ammo_762x51_hp", "ammo_762x51", "ammo_762x51");
                    break;
                
                case 3:
                    _new_ammo_drop = "ammo_762x51";
                    break;
                
                case 4:
                    _new_ammo_drop = "ammo_762x51_m61";
                    break;
            }
            
            break;
        
        case "a45":
            switch (_value)
            {
                case 0:
                    _new_ammo_drop = "ammo_45_sub";
                    break;
                
                case 1:
                    _new_ammo_drop = choose("ammo_45", "ammo_45_sub");
                    break;
                
                case 2:
                    _new_ammo_drop = choose("ammo_45", "ammo_45_ap");
                    break;
                
                case 3:
                    _new_ammo_drop = "ammo_45_ap";
                    break;
                
                case 4:
                    _new_ammo_drop = "ammo_45_ap";
                    break;
            }
            
            break;
        
        case "a762x25":
            switch (_value)
            {
                case 0:
                    _new_ammo_drop = "ammo_762x25";
                    break;
                
                case 1:
                    _new_ammo_drop = "ammo_762x25";
                    break;
                
                case 2:
                    _new_ammo_drop = choose("ammo_762x25", "ammo_762x25_pst");
                    break;
                
                case 3:
                    _new_ammo_drop = "ammo_762x25_pst";
                    break;
                
                case 4:
                    _new_ammo_drop = "ammo_762x25_pst";
                    break;
            }
            
            break;
        
        case "a9x39":
            switch (_value)
            {
                case 0:
                    _new_ammo_drop = "ammo_9x39";
                    break;
                
                case 1:
                    _new_ammo_drop = "ammo_9x39";
                    break;
                
                case 2:
                    _new_ammo_drop = "ammo_9x39";
                    break;
                
                case 3:
                    _new_ammo_drop = "ammo_9x39_bp";
                    break;
                
                case 4:
                    _new_ammo_drop = "ammo_9x39_bp";
                    break;
            }
            
            break;
        
        case "a762x54r":
            switch (_value)
            {
                case 0:
                    _new_ammo_drop = "ammo_762x54R";
                    break;
                
                case 1:
                    _new_ammo_drop = "ammo_762x54R";
                    break;
                
                case 2:
                    _new_ammo_drop = "ammo_762x54R";
                    break;
                
                case 3:
                    _new_ammo_drop = "ammo_762x54R_snb";
                    break;
                
                case 4:
                    _new_ammo_drop = "ammo_762x54R_snb";
                    break;
            }
            
            break;
        
        case "a127x55":
            switch (_value)
            {
                case 0:
                    _new_ammo_drop = "ammo_127x55_hp";
                    break;
                
                case 1:
                    _new_ammo_drop = choose("ammo_127x55_hp", "ammo_127x55_ps");
                    break;
                
                case 2:
                    _new_ammo_drop = "ammo_127x55_ps";
                    break;
                
                case 3:
                    _new_ammo_drop = "ammo_127x55_bp";
                    break;
                
                case 4:
                    _new_ammo_drop = "ammo_127x55_bp";
                    break;
            }
            
            break;
        
        case "a12x70":
            switch (_value)
            {
                case 0:
                    _new_ammo_drop = "ammo_12x70";
                    break;
                
                case 1:
                    _new_ammo_drop = choose("ammo_12x70", "ammo_12x70_slug");
                    break;
                
                case 2:
                    _new_ammo_drop = choose("ammo_12x70", "ammo_12x70_slug");
                    break;
                
                case 3:
                    _new_ammo_drop = choose("ammo_12x70_slug_ap", "ammo_12x70_buckshot_ap");
                    break;
                
                case 4:
                    _new_ammo_drop = "ammo_12x70_buckshot_ap";
                    break;
            }
            
            break;
    }
    
    return _new_ammo_drop;
}

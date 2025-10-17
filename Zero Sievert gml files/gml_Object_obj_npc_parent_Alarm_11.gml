ds_grid_copy(grid_faction_my, global.grid_faction);
var _value = npc_get_ammo_value(npc_id);

if (item_exists(arma_now))
{
    var _caliber = item_weapon_get_caliber(arma_now);
    
    switch (_caliber)
    {
        case "a9x18":
            switch (_value)
            {
                case 0:
                    ammo_id_now = "ammo_9x18";
                    break;
                
                case 1:
                    ammo_id_now = "ammo_9x18";
                    break;
                
                case 2:
                    ammo_id_now = choose("ammo_9x18", "ammo_9x18_pbm");
                    break;
                
                case 3:
                    ammo_id_now = "ammo_9x18_pbm";
                    break;
                
                case 4:
                    ammo_id_now = "ammo_9x18_pbm";
                    break;
            }
            
            break;
        
        case "a9x19":
            switch (_value)
            {
                case 0:
                    ammo_id_now = choose("ammo_9x19", "ammo_9x19_sub", "ammo_9x19_sub");
                    break;
                
                case 1:
                    ammo_id_now = "ammo_9x19";
                    break;
                
                case 2:
                    ammo_id_now = choose("ammo_9x19", "ammo_9x19_ap");
                    break;
                
                case 3:
                    ammo_id_now = "ammo_9x19_ap";
                    break;
                
                case 4:
                    ammo_id_now = "ammo_9x19_ap";
                    break;
            }
            
            break;
        
        case "a57x28":
            switch (_value)
            {
                case 0:
                    ammo_id_now = choose("ammo_57x28", "ammo_57x28_sub");
                    break;
                
                case 1:
                    ammo_id_now = "ammo_57x28";
                    break;
                
                case 2:
                    ammo_id_now = choose("ammo_57x28", "ammo_57x28_ss190");
                    break;
                
                case 3:
                    ammo_id_now = "ammo_57x28_ss190";
                    break;
                
                case 4:
                    ammo_id_now = "ammo_57x28_ss190";
                    break;
            }
            
            break;
        
        case "a762x39":
            switch (_value)
            {
                case 0:
                    ammo_id_now = choose("ammo_762x39_hp", "ammo_762x39_sub");
                    break;
                
                case 1:
                    ammo_id_now = choose("ammo_762x39_sub", "ammo_762x39_hp");
                    break;
                
                case 2:
                    ammo_id_now = "ammo_762x39";
                    break;
                
                case 3:
                    ammo_id_now = "ammo_762x39";
                    break;
                
                case 4:
                    ammo_id_now = "ammo_762x39_bp";
                    break;
            }
            
            break;
        
        case "a545x39":
            switch (_value)
            {
                case 0:
                    ammo_id_now = choose("ammo_545x39_hp", "ammo_545x39_sub");
                    break;
                
                case 1:
                    ammo_id_now = choose("ammo_545x39_hp", "ammo_545x39", "ammo_545x39_sub");
                    break;
                
                case 2:
                    ammo_id_now = "ammo_545x39";
                    break;
                
                case 3:
                    ammo_id_now = choose("ammo_545x39_bt", "ammo_545x39");
                    break;
                
                case 4:
                    ammo_id_now = "ammo_545x39_bt";
                    break;
            }
            
            break;
        
        case "a556x45":
            switch (_value)
            {
                case 0:
                    ammo_id_now = choose("ammo_556x45_hp", "ammo_556x45_sub");
                    break;
                
                case 1:
                    ammo_id_now = choose("ammo_556x45_hp", "ammo_556x45", "ammo_556x45_sub");
                    break;
                
                case 2:
                    ammo_id_now = "ammo_556x45";
                    break;
                
                case 3:
                    ammo_id_now = "ammo_556x45";
                    break;
                
                case 4:
                    ammo_id_now = "ammo_556x45_m995";
                    break;
            }
            
            break;
        
        case "a762x51":
            switch (_value)
            {
                case 0:
                    ammo_id_now = "ammo_762x51_hp";
                    break;
                
                case 1:
                    ammo_id_now = choose("ammo_762x51_hp", "ammo_762x51");
                    break;
                
                case 2:
                    ammo_id_now = choose("ammo_762x51_hp", "ammo_762x51", "ammo_762x51");
                    break;
                
                case 3:
                    ammo_id_now = "ammo_762x51";
                    break;
                
                case 4:
                    ammo_id_now = "ammo_762x51_m61";
                    break;
            }
            
            break;
        
        case "a45":
            switch (_value)
            {
                case 0:
                    ammo_id_now = "ammo_45_sub";
                    break;
                
                case 1:
                    ammo_id_now = choose("ammo_45", "ammo_45_sub");
                    break;
                
                case 2:
                    ammo_id_now = choose("ammo_45", "ammo_45_ap");
                    break;
                
                case 3:
                    ammo_id_now = "ammo_45_ap";
                    break;
                
                case 4:
                    ammo_id_now = "ammo_45_ap";
                    break;
            }
            
            break;
        
        case "a762x25":
            switch (_value)
            {
                case 0:
                    ammo_id_now = "ammo_762x25";
                    break;
                
                case 1:
                    ammo_id_now = "ammo_762x25";
                    break;
                
                case 2:
                    ammo_id_now = choose("ammo_762x25", "ammo_762x25_pst");
                    break;
                
                case 3:
                    ammo_id_now = "ammo_762x25_pst";
                    break;
                
                case 4:
                    ammo_id_now = "ammo_762x25_pst";
                    break;
            }
            
            break;
        
        case "a9x39":
            switch (_value)
            {
                case 0:
                    ammo_id_now = "ammo_9x39";
                    break;
                
                case 1:
                    ammo_id_now = "ammo_9x39";
                    break;
                
                case 2:
                    ammo_id_now = "ammo_9x39";
                    break;
                
                case 3:
                    ammo_id_now = "ammo_9x39";
                    break;
                
                case 4:
                    ammo_id_now = "ammo_9x39_bp";
                    break;
            }
            
            break;
        
        case "a762x54r":
            switch (_value)
            {
                case 0:
                    ammo_id_now = "ammo_762x54R";
                    break;
                
                case 1:
                    ammo_id_now = "ammo_762x54R";
                    break;
                
                case 2:
                    ammo_id_now = "ammo_762x54R";
                    break;
                
                case 3:
                    ammo_id_now = "ammo_762x54R";
                    break;
                
                case 4:
                    ammo_id_now = "ammo_762x54R_snb";
                    break;
            }
            
            break;
        
        case "a127x55":
            switch (_value)
            {
                case 0:
                    ammo_id_now = "ammo_127x55_hp";
                    break;
                
                case 1:
                    ammo_id_now = choose("ammo_127x55_hp", "ammo_127x55_ps");
                    break;
                
                case 2:
                    ammo_id_now = "ammo_127x55_ps";
                    break;
                
                case 3:
                    ammo_id_now = "ammo_127x55_ps";
                    break;
                
                case 4:
                    ammo_id_now = "ammo_127x55_bp";
                    break;
            }
            
            break;
        
        case "a12x70":
            switch (_value)
            {
                case 0:
                    ammo_id_now = "ammo_12x70";
                    break;
                
                case 1:
                    ammo_id_now = choose("ammo_12x70", "ammo_12x70_slug");
                    break;
                
                case 2:
                    ammo_id_now = choose("ammo_12x70", "ammo_12x70_slug");
                    break;
                
                case 3:
                    ammo_id_now = choose("ammo_12x70", "ammo_12x70_slug_ap");
                    break;
                
                case 4:
                    ammo_id_now = "ammo_12x70_slug_ap";
                    break;
            }
            
            break;
        
        case "a50bmg":
            switch (_value)
            {
                case 0:
                    ammo_id_now = "ammo_50bmg_standard";
                    break;
                
                case 1:
                    ammo_id_now = "ammo_50bmg_standard";
                    break;
                
                case 2:
                    ammo_id_now = "ammo_50bmg_standard";
                    break;
                
                case 3:
                    ammo_id_now = "ammo_50bmg_standard";
                    break;
                
                case 4:
                    ammo_id_now = "ammo_50bmg_standard";
                    break;
            }
            
            break;
    }
}

if (npc_get_trader_id(npc_id) != "no_trader")
{
    var _savedata_name = npc_id + "_trader";
    db_open("general");
    var _load = db_section_exists(_savedata_name);
    db_close();
    
    if (npc_get_trader_id(npc_id) == "random_trader")
    {
        gamedata_trader_calculate_shared_money();
        _load = false;
    }
    
    if (_load)
    {
        db_open("general");
        
        if (is_in_hub())
            money_trader = db_read("traders", "money", global.trader_money_all);
        else
            money_trader = db_read(_savedata_name, "money", 0);
        
        loot_array = db_read(_savedata_name, "items", []);
        loot_array_update_to_zs32(loot_array, "trader inventory");
        db_close();
    }
    else
    {
        var _trader_id = npc_get_trader_id(npc_id);
        db_open("general");
        money_trader = floor(trader_get_money(_trader_id) * global.sk_k[UnknownEnum.Value_22]);
        db_write(_savedata_name, "money", money_trader);
        loot_array = trader_unpack_to_loot_array(_trader_id, false, true);
        db_write(_savedata_name, "items", loot_array);
        db_close();
    }
}

enum UnknownEnum
{
    Value_22 = 22
}

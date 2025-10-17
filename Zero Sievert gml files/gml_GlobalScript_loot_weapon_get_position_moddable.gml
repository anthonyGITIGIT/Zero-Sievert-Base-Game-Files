function loot_weapon_get_position_moddable(arg0, arg1)
{
    if (arg1 == "handguard")
    {
        if (item_weapon_pos_get_moddable(arg0.item, "barrel"))
        {
            if (!item_exists(loot_weapon_get_mod(arg0, "barrel")))
                return false;
        }
    }
    
    if (arg1 == "brake")
    {
        if (item_weapon_pos_get_moddable(arg0.item, "barrel"))
        {
            if (!item_exists(loot_weapon_get_mod(arg0, "barrel")))
                return false;
        }
    }
    
    if (arg1 == "att_1" || arg1 == "att_2" || arg1 == "att_3" || arg1 == "att_4")
    {
        var _handguard = loot_weapon_get_mod(arg0, "handguard");
        
        if (item_exists(_handguard))
        {
            if (arg1 == "att_1" && item_mod_handguard_pos_exists(_handguard, "att_1"))
                return true;
            
            if (arg1 == "att_2" && item_mod_handguard_pos_exists(_handguard, "att_2"))
                return true;
            
            if (arg1 == "att_3" && item_mod_handguard_pos_exists(_handguard, "att_3"))
                return true;
            
            if (arg1 == "att_4" && item_mod_handguard_pos_exists(_handguard, "att_4"))
                return true;
        }
    }
    
    return item_weapon_pos_get_moddable(arg0.item, arg1);
}

function loot_weapon_mod_remove(arg0, arg1)
{
    if (arg0 == undefined)
        exit;
    
    if (arg1 == undefined)
        exit;
    
    var _mod_container = struct_get_from_hash(arg0, variable_get_hash("mods"));
    
    if (!is_struct(_mod_container))
        exit;
    
    var _mod = loot_mod_cont_get(_mod_container, arg1);
    
    if (!item_exists(_mod))
        return false;
    
    if (arg1 == "magazine")
    {
        if (!loot_action_unload_now(arg0, true))
            return false;
    }
    
    if (arg1 == "barrel")
    {
        if (item_exists(loot_weapon_get_mod(arg0, "brake")))
        {
            scr_draw_text_with_box("You have to uninstall the muzzle flash");
            return false;
        }
        
        if (item_exists(loot_weapon_get_mod(arg0, "handguard")))
        {
            scr_draw_text_with_box("You have to uninstall the handguard");
            return false;
        }
    }
    
    if (arg1 == "handguard")
    {
        if (item_exists(loot_weapon_get_mod(arg0, "att_1")) || item_exists(loot_weapon_get_mod(arg0, "att_2")) || item_exists(loot_weapon_get_mod(arg0, "att_3")) || item_exists(loot_weapon_get_mod(arg0, "att_4")))
        {
            scr_draw_text_with_box("You have to uninstall the attachments on the handguard");
            return false;
        }
    }
    
    if (!global.general_debug)
    {
        if (!inventory_check_for_space(_mod, 1))
        {
            scr_draw_text_with_box("Not enough inventory space!");
        }
        else
        {
            inventory_add_item(_mod, 1);
            loot_mod_cont_delete(_mod_container, arg1);
        }
    }
    else
    {
        loot_mod_cont_delete(_mod_container, arg1);
    }
    
    return true;
}

function loot_weapon_mod_add(arg0, arg1, arg2)
{
    if (arg0 == undefined)
        return false;
    
    if (arg1 == undefined)
        return false;
    
    if (arg2 == undefined)
        return false;
    
    if (arg2 == "handguard")
    {
        if (item_exists(loot_weapon_get_mod(arg0, "att_1")) || item_exists(loot_weapon_get_mod(arg0, "att_2")) || item_exists(loot_weapon_get_mod(arg0, "att_3")) || item_exists(loot_weapon_get_mod(arg0, "att_4")))
        {
            scr_draw_text_with_box("You have to uninstall the attachments on the handguard");
            return false;
        }
    }
    
    var _mod_container = struct_get_from_hash(arg0, variable_get_hash("mods"));
    
    if (!is_struct(_mod_container))
        return false;
    
    var _mod_item = loot_get_item(arg1);
    
    if (!item_mod_fits_position(_mod_item, arg2))
        return false;
    
    var _existing_mod = loot_mod_cont_get(_mod_container, arg2);
    
    if (item_exists(_existing_mod))
    {
        if (!inventory_check_for_space(_existing_mod))
        {
            scr_draw_text_with_box("Not enough inventory space!");
            return false;
        }
    }
    
    if (arg2 == "magazine")
    {
        if (!loot_action_unload_now(arg0, true))
            return false;
    }
    
    loot_mod_cont_set(_mod_container, arg2, _mod_item);
    inventory_and_stash_remove_item(_mod_item, 1);
    
    if (item_exists(_existing_mod))
        inventory_add_item(_existing_mod, 1);
    
    return true;
}

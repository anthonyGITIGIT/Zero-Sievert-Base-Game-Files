function loot_action_execute(arg0, arg1)
{
    switch (arg1)
    {
        case "Consume":
            loot_action_consume_now(arg0);
            break;
        
        case "Use":
            loot_action_use_now(arg0);
            break;
        
        case "Scrap":
            if (is_in_hub() || base_module_get_level(UnknownEnum.Value_8) > 2)
            {
                if (loot_get_autoscrap(arg0))
                    loot_action_scrap_now(arg0);
                else
                    __uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/context_menu_confirm_scrap.ui");
            }
            else
            {
                scr_draw_text_with_box("You can't scrap items here");
            }
            
            break;
        
        case "Unload":
            loot_action_unload_now(arg0);
            break;
        
        case "Detach suppressor":
        case "Detach scope":
        case "Detach magazine":
        case "Detach att 1":
        case "Detach att 2":
        case "Detach att 3":
        case "Detach att 4":
            scr_draw_text_with_box(arg1);
            
            if (arg1 == "Detach magazine")
                loot_action_unload_now(arg0);
            
            inventory_write_to_db();
            var _pos = get_mod_pos_from_detach_type(arg1);
            var _mod_container = struct_get_from_hash(arg0, variable_get_hash("mods"));
            var _mod = loot_mod_cont_get(_mod_container, _pos);
            inventory_add_item(_mod, 1);
            loot_mod_cont_delete(_mod_container, _pos);
            break;
        
        default:
            trace_error("Loot action \"", arg1, "\" not recognised");
            break;
    }
    
    ui_inventory_check_weight();
}

enum UnknownEnum
{
    Value_8 = 8
}

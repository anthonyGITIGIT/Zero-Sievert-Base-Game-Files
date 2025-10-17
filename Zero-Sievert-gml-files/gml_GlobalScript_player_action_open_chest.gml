function player_action_open_chest(arg0)
{
    with (uiGetData())
    {
        loot_name = language_get_string_iterative(arg0.name_chest ?? chest_get_name(arg0.tipo));
        chest_target = arg0;
        chest_using = true;
        stash_page = undefined;
        trader_target = undefined;
        trader_page = undefined;
    }
    
    audio_play_sound(chest_get_open_sound(arg0.tipo), 10, false);
    
    if (!arg0.already_looted)
    {
        arg0.already_looted = true;
        global.xp_loot += global.xp_da_looting;
        
        switch (arg0.object_index)
        {
            case obj_chest_tool_box:
                stat_increment("tool_box");
                steam_stat_increment("containersopened");
                break;
            
            case obj_chest_electronic_box:
                stat_increment("electronic");
                steam_stat_increment("containersopened");
                break;
            
            case obj_chest_cabinet:
                stat_increment("cabinet");
                steam_stat_increment("containersopened");
                break;
            
            case obj_chest_vending_machine:
                stat_increment("vending_machine");
                steam_stat_increment("containersopened");
                break;
            
            case obj_chest_safe:
                stat_increment("safe");
                steam_stat_increment("containersopened");
                break;
            
            case obj_chest_wood_box:
                stat_increment("wood_box");
                steam_stat_increment("containersopened");
                break;
            
            case obj_chest_map:
                stat_increment("hidden_stash");
                steam_stat_increment("containersopened");
                steam_stat_increment("hiddenstasheslooted");
                break;
            
            case obj_chest_medication_box:
                stat_increment("medication");
                steam_stat_increment("containersopened");
                break;
            
            case obj_chest_bag:
                stat_increment("bag");
                steam_stat_increment("containersopened");
                break;
            
            case obj_chest_attachment:
                stat_increment("attachment_box");
                steam_stat_increment("containersopened");
                break;
            
            case obj_weapon_box_common:
                stat_increment("weapon_box");
                steam_stat_increment("containersopened");
                break;
            
            case obj_weapon_box_rare:
                stat_increment("weapon_box");
                steam_stat_increment("containersopened");
                break;
            
            case obj_chest_cristallo_blu:
                stat_increment("crystal");
                steam_stat_increment("containersopened");
                break;
            
            case obj_chest_cristallo_red:
                stat_increment("crystal");
                steam_stat_increment("containersopened");
                break;
            
            case obj_chest_cristallo_verde:
                stat_increment("crystal");
                steam_stat_increment("containersopened");
                break;
            
            case obj_chest_air_drop:
                stat_increment("air_drop");
                steam_stat_increment("containersopened");
                break;
        }
    }
    
    __uiGlobal().__defaultOnion.LayerAddTop("ZS_vanilla/ui/inventory_chest.ui", "inventory layer");
    player_set_local_state(scr_player_state_inventory);
    ui_player_inventory_populate(true);
    ui_chest_populate(arg0);
    return true;
}

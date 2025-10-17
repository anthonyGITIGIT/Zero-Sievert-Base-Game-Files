function npc_dialogue_map_is_unlocked(arg0 = uiGetData().map_selected)
{
    if (!global.general_debug)
    {
        switch (arg0)
        {
            case UnknownEnum.Value_2:
                return quest_is_complete("unlock_makeshift_camp");
                break;
            
            case UnknownEnum.Value_3:
                return quest_is_complete("kill_orel");
                break;
            
            case UnknownEnum.Value_4:
                return quest_is_complete("kill_orel");
                break;
            
            case UnknownEnum.Value_6:
                return quest_is_complete("gate_sewer");
                break;
            
            case UnknownEnum.Value_9:
                scr_draw_text_with_box("In development");
                break;
            
            case UnknownEnum.Value_8:
                return quest_is_complete("bridge_to_zakov");
                break;
        }
    }
    
    return true;
}

function npc_dialogue_map_go()
{
    var _map = uiGetData().map_selected;
    
    if (!global.general_debug)
    {
        switch (_map)
        {
            case UnknownEnum.Value_2:
                if (!quest_is_complete("unlock_makeshift_camp"))
                {
                    scr_draw_text_with_box("Not yet unlocked");
                    exit;
                }
                
                break;
            
            case UnknownEnum.Value_3:
                if (!quest_is_complete("kill_orel"))
                {
                    scr_draw_text_with_box("Not yet unlocked");
                    exit;
                }
                
                break;
            
            case UnknownEnum.Value_4:
                if (!quest_is_complete("kill_orel"))
                {
                    scr_draw_text_with_box("Not yet unlocked");
                    exit;
                }
                
                break;
            
            case UnknownEnum.Value_6:
                if (!quest_is_complete("gate_sewer"))
                {
                    scr_draw_text_with_box("Not yet unlocked");
                    exit;
                }
                
                break;
            
            case UnknownEnum.Value_8:
                if (!quest_is_complete("bridge_to_zakov"))
                {
                    scr_draw_text_with_box("Not yet unlocked");
                    exit;
                }
                
                break;
            
            case UnknownEnum.Value_9:
                scr_draw_text_with_box("In development");
                exit;
                break;
        }
    }
    
    db_open("raid");
    db_write("Map", "Map id", _map);
    db_close();
    
    with (player_get_local())
    {
        ftue_part3_complete = true;
        skills.save();
        skills_hunter.save("skills_hunter");
    }
    
    scr_save_skill_and_base();
    scr_save_exp();
    scr_save_ftue();
    scr_save_time();
    scr_save_unique_action();
    scr_save_player_status();
    faction_save();
    stash_save();
    quest_save();
    welcometozakovcity_achievement();
    var _value = inventory_get_total_value();
    db_open("pre_raid");
    db_write("inventory_value", "pre_raid", _value);
    db_close();
    inventory_handle_pre_raid_backup(true);
    inventory_set_target_db_to_raid();
    steam_stat_increment("raidsstarted");
    __uiGlobal().__defaultOnion.Clear();
    room_goto(room1);
}

enum UnknownEnum
{
    Value_2 = 2,
    Value_3,
    Value_4,
    Value_6 = 6,
    Value_8 = 8,
    Value_9
}

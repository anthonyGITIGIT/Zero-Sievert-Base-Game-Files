function ui_initialize_data_struct()
{
    with (uiGetData())
    {
        version = concat(1, ".", 2, ".", 24);
        most_recent_save = undefined;
        tutorial_title = "Movement";
        tutorial_sprite = s_tutorial_crosshair;
        tutorial_ui_path = "ZS_vanilla/ui/mm_tutorial.ui";
        settings_title = "Settings - Audio";
        settings_content = [];
        max_save_slots = 3;
        saveslot = undefined;
        loadout = undefined;
        difficulty_new_game = false;
        difficulty_title = "";
        difficulty_name = "";
        difficulty_content = [];
        play_prologue = false;
        sleep_minutes = 0;
        pda_back_is_close = true;
        tooltip_text = "";
        tooltip_loot = undefined;
        tooltip_column_x = 200;
        tooltip_open = false;
        tooltip_tl_x = 0;
        tooltip_tl_y = 0;
        tooltip_br_x = 0;
        tooltip_br_y = 0;
        skill_display_mastery_type = undefined;
        skill_display_mastery_rank = undefined;
        skill_select_hover = undefined;
        skill_pip_hover = undefined;
        skill_gun_type_hover = undefined;
        base_slot_selected = undefined;
        base_module_selected = undefined;
        npc_instance = undefined;
        npc_question_index = undefined;
        npc_quest_index = undefined;
        map_selected = UnknownEnum.Value_1;
        reward_item = undefined;
        reward_item_quantity = 0;
        reward_only_cash = false;
        loot_name = "Ground";
        chest_target = undefined;
        chest_using = false;
        stash_page = undefined;
        trader_page = undefined;
        trader_target = undefined;
        debug_spawner_category = "weapon";
        crafting_mode = "medication";
        crafting_loot = undefined;
        quest_open = false;
        quest_reward_hover = false;
        modding_loot = undefined;
        modding_mod_pos = undefined;
        context_menu_loot = undefined;
        marker_id = undefined;
        marker_popup_text = "???";
        modding_menu_current = undefined;
        ugc_upload_status = 
        {
            in_progress: false
        };
        ugc_download_status = 
        {
            in_progress: false
        };
        modding_menu_needs_refresh = false;
        quickmove_menu_frames = 0;
        quickmove_menu_wasopen = false;
        player_got_hit = false;
    }
}

enum UnknownEnum
{
    Value_1 = 1
}

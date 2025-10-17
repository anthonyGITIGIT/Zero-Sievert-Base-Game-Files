if (keybind_active)
    keybind_update();
else if (black_overlay_alpha <= 0.6 && game_in_focus())
    ui_handle_input(1);

if (!audio_group_is_loaded(snd_assault_rifle))
    audio_group_load(snd_assault_rifle);

if (!audio_group_is_loaded(snd_big_bite_2))
    audio_group_load(snd_big_bite_2);

if (!audio_group_is_loaded(snd_big_bite_3))
    audio_group_load(snd_big_bite_3);

if (!audio_group_is_loaded(snd_big_breathing))
    audio_group_load(snd_big_breathing);

if (!audio_is_playing(snd_main_menu_2) && audio_group_is_loaded(snd_assault_rifle))
    audio_play_sound(snd_main_menu_2, 20, false);

__uiGlobal().__defaultOnion.Step();

if (!window_focused && game_in_focus())
{
    if (room == r_menu)
    {
        mm_init_slot_metadata();
        var _root = uiLayerGetRoot("root");
        
        if (uiFindRelaxed(_root, "saveslot frame") != undefined)
            uiFind(_root, "sidebar frame").ReplaceFromFile("ZS_vanilla/ui/mm_sidebar_saveslots.ui");
    }
    else if (false && global.database_cloud_conflict == 0)
    {
        if (db_cloud_enabled() && db_get_save_hash("shared") != db_cloud_get_hash(db_get_filename("shared")))
        {
            db_cloud_sync_all(1);
            settings_reload_and_apply();
            reload_main_menu();
        }
    }
}

window_focused = game_in_focus();

if (keyboard_check_pressed(vk_f5) && keyboard_check(vk_control))
{
    global.slot_selected = 1;
    scr_aggiorna_save_slot(global.slot_selected);
    saveslot_reload();
    inventory_handle_pre_raid_backup(true);
    inventory_set_target_db_to_raid();
    __uiGlobal().__defaultOnion.Clear();
    room_goto(test_room);
}

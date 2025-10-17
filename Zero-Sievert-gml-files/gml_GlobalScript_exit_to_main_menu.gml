function exit_to_main_menu()
{
    if (is_in_hub())
    {
        scr_save_player_status();
        db_force_save("pre_raid");
    }
    
    audio_stop_all();
    
    with (obj_main_menu)
        stop_video = false;
    
    __uiGlobal().__defaultOnion.Clear();
    room_goto(r_menu);
}
